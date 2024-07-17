import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/layers/data/model/config_form_model.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_state.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_store.dart';
import 'package:quiz_app/app/layers/presentation/ui/components/quiz_pageview.dart';
import 'package:quiz_app/app/layers/presentation/ui/pages/finish_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.config});
  final ConfigFormModel config;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late QuizStore store;
  int currentIndex = 0;
  late PageController pc;
  @override
  void initState() {
    pc = PageController(initialPage: currentIndex);
    Provider.of<QuizStore>(context, listen: false)
        .fetchQuestions(config: widget.config);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<QuizStore>(context);
    Widget content = Container();

    final state = store.state;

    if (state.status == QuizPageStatus.loading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (state.status == QuizPageStatus.error) {
      content = Column(children: [const Text('Error'), Text(state.error)]);
    } else if (state.status == QuizPageStatus.ok) {
      content = Scaffold(
        appBar: AppBar(
          title: Text("Question ${currentIndex + 1}"),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                if (currentIndex == 0) {
                  Navigator.pop(context);
                } else {
                  currentIndex--;
                  navigateToIndex();
                }
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: PageView.builder(
          controller: pc,
          itemCount: state.questions.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return QuizPageview(
                question: state.questions[i],
                onSumbit: () {
                  currentIndex++;
                  store.saveAnswer(i);
                  if (currentIndex != state.questions.length) {
                    navigateToIndex();
                  } else {
                    navigateToFinishPage();
                  }
                });
          },
        ),
      );
    }
    return content;
  }

  navigateToFinishPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const FinishPage();
    }));
  }

  navigateToIndex() {
    pc.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.linear,
    );
  }
}
