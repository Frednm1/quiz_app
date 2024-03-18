// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  final void Function() action;
  final String answer;
  final bool isActive;
  const AnswerButton({
    super.key,
    required this.action,
    required this.answer,
    required this.isActive,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.action,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width - 60, 45),
        backgroundColor:
            widget.isActive ? Colors.indigo : Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(),
      ),
      child: Text(
        widget.answer,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
