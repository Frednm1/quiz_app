import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app/layers/data/model/config_form_model.dart';
import 'package:quiz_app/app/layers/presentation/controllers/quiz_store.dart';
import 'package:quiz_app/app/layers/presentation/ui/pages/quiz_page.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final ScrollController _controller = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _numberOfQuestionsController = TextEditingController();
  String questionDifficultyController = 'random';
  int? questionCategoryController;
  List<bool> toggleButtonsList = <bool>[false, false, true];

  @override
  void initState() {
    Provider.of<QuizStore>(context, listen: false).reset();
    //Ensure that the page will be initialized in the top of the body
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Config'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Before we proceed, let\'s customize your quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/technical-support.png',
                height: 275,
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('How many questions do you want to answer?'),
                    TextFormField(
                      autocorrect: true,
                      controller: _numberOfQuestionsController,
                      onTapOutside: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (value) {
                        if (value?.isEmpty == true || value == null) {
                          return 'Fill in the field above to proceed';
                        } else if (int.parse(value) <= 0 ||
                            int.parse(value) > 50) {
                          return 'Enter a number between 1 and 50';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        constraints: BoxConstraints(maxHeight: 50),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Select the difficult you whant.'),
                    difficultyWidget(),
                    const SizedBox(height: 20),
                    const Text('Select the category.'),
                    categoriesWidget(),
                    const SizedBox(height: 40),
                    const Text('Select the type.'),
                    typeWidget(),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          navigateToQuiz(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).focusColor,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 60, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text('Start'),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget difficultyWidget() {
    return DropdownButtonFormField(
        style: const TextStyle(fontSize: 14, height: 1),
        value: questionDifficultyController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          constraints: BoxConstraints(maxHeight: 60),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        items: const [
          DropdownMenuItem(value: 'random', child: Text('Random')),
          DropdownMenuItem(value: 'easy', child: Text('Easy')),
          DropdownMenuItem(value: 'medium', child: Text('Medium')),
          DropdownMenuItem(value: 'hard', child: Text('Hard')),
        ],
        onChanged: (value) {
          if (value != null) {
            setState(() {
              questionDifficultyController = value;
            });
          }
        });
  }

  Widget typeWidget() {
    return ToggleButtons(
      fillColor: Theme.of(context).primaryColorLight,
      isSelected: toggleButtonsList,
      borderRadius: BorderRadius.circular(7),
      selectedColor: Colors.black,
      constraints: const BoxConstraints(minWidth: 80, minHeight: 40),
      onPressed: (bid) {
        setState(() {
          toggleButtonsList = List.from([false, false, false]);
          toggleButtonsList[bid] = true;
        });
      },
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('True or False'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Multiple Choice'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Any'),
        ),
      ],
    );
  }

  Widget categoriesWidget() {
    return DropdownButtonFormField(
        style: const TextStyle(fontSize: 14, height: 1),
        value: questionCategoryController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          constraints: BoxConstraints(maxHeight: 60),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        items: const [
          DropdownMenuItem(value: null, child: Text('Any category')),
          DropdownMenuItem(value: 9, child: Text('General Knowledge')),
          DropdownMenuItem(value: 10, child: Text('Entertainment Books')),
          DropdownMenuItem(value: 11, child: Text('Entertainment Film')),
          DropdownMenuItem(value: 12, child: Text('Entertainment Music')),
          DropdownMenuItem(
              value: 13, child: Text('Entertainment Musicals and Theatres')),
          DropdownMenuItem(value: 14, child: Text('Entertainment Television')),
          DropdownMenuItem(value: 15, child: Text('Entertainment Video Games')),
          DropdownMenuItem(value: 16, child: Text('Entertainment Board Games')),
          DropdownMenuItem(value: 17, child: Text('Science and Nature')),
          DropdownMenuItem(value: 18, child: Text('Science: Computers')),
          DropdownMenuItem(value: 19, child: Text('Science: Mathematics')),
          DropdownMenuItem(value: 20, child: Text('Mythology')),
          DropdownMenuItem(value: 21, child: Text('Sports')),
          DropdownMenuItem(value: 22, child: Text('Geography')),
          DropdownMenuItem(value: 22, child: Text('Geography')),
          DropdownMenuItem(value: 23, child: Text('History')),
          DropdownMenuItem(value: 24, child: Text('Politics')),
          DropdownMenuItem(value: 25, child: Text('Art')),
          DropdownMenuItem(value: 26, child: Text('Celebrities')),
          DropdownMenuItem(value: 27, child: Text('Animals')),
        ],
        onChanged: (value) {
          questionCategoryController = value;
        });
  }

  navigateToQuiz(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QuizPage(
            config: ConfigFormModel(
              numberOfQuestions: int.parse(
                _numberOfQuestionsController.value.text,
              ),
              category: questionCategoryController,
              difficulty: questionDifficultyController == 'random'
                  ? null
                  : questionDifficultyController,
              type: toggleButtonsList[0]
                  ? 'boolean'
                  : toggleButtonsList[1]
                      ? 'multiple'
                      : null,
            ),
          );
        },
      ),
    );
  }
}
