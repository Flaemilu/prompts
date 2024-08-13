import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/chatcontroller.dart';
import 'package:prompts/prompts/model/answeringminigame.dart';
import 'package:prompts/prompts/lib/maybe.dart';
import 'package:prompts/prompts/model/entities/message.dart';

class AnswerWidget extends StatelessWidget{

  ChatController controller;
  AnswerWidget(this.controller);
  
  @override
  Widget build(BuildContext context) {
    var answer = controller.getAnswer();
    if(answer == null) return  const Wrap();
    else {
        return Wrap(
          spacing: 8,
          children: answer.options.entries.map((entry) => _chip(entry.key, answer.messageLabel, context, controller)).toList()
        );
    }
  }

}

Widget _chip(String data, String label, BuildContext context, ChatController controller) => ChoiceChip(
      labelPadding: EdgeInsets.all(4.0),
      label: Text(
        data,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontSize: 14),
      ),
      selectedColor: Colors.deepPurple,
      selected: true,
      elevation: 1,
      padding: EdgeInsets.symmetric(horizontal: 10),
      showCheckmark: false,
      onSelected: (selected) => controller.pickAnswer(label, data),
    );