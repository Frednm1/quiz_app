import 'package:flutter/material.dart';

class AnswerFeedbackComponent extends StatelessWidget {
  final String text;
  final bool correct;

  const AnswerFeedbackComponent({
    super.key,
    required this.text,
    required this.correct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            height: 12,
            width: 12,
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(34, 39, 46, 1)
            ),
          ),
          const SizedBox(width: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: Text(text,maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
          correct
          ? const Icon(Icons.check,color: Colors.green,size: 18,) 
          : const Icon(Icons.close,color: Colors.red,size: 18,),
      ],
    );
  }
} 
