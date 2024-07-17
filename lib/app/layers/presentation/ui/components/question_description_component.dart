// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class QuestionDescriptionComponent extends StatelessWidget {
  final String title;
  final String content;
  const QuestionDescriptionComponent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white60,
        ),
        children: [
          TextSpan(
            text: parse(title).body?.innerHtml ?? '',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: .8,
            ),
          ),
          TextSpan(
            text: parse(content).body?.innerHtml ?? '',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white60,
              height: .8,
            ),
          ),
        ],
      ),
    );
  }
}
