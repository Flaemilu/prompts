import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/chatcontroller.dart';
import 'package:prompts/prompts/model/answeringminigame.dart';
import 'package:prompts/prompts/lib/maybe.dart';

class AnswerWidget extends StatelessWidget{

  ChatController controller;
  AnswerWidget(this.controller);
  
  @override
  Widget build(BuildContext context) {
    switch(controller.answer()){
      case Nothing(): 
        return  const Wrap();
      case Just(a:final answers): 
        return Wrap(
          spacing: 8,
          children: answers.getOptions().asMap().entries.map((entry) => _chip(entry.value.a, entry.key, context, controller)).toList()
        );
    }
  }

}

Widget _chip(String data, int index, BuildContext context, ChatController controller) => ChoiceChip(
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
      onSelected: (selected) => controller.pickAnswer(index),
    );