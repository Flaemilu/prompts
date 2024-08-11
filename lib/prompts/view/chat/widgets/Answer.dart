import 'package:flutter/material.dart';
import 'package:prompts/prompts/model/answeringminigame.dart';
import 'package:prompts/prompts/model/maybe.dart';

class AnswerWidget extends StatelessWidget{

  Maybe<AnsweringMiniGame> game;
  AnswerWidget(this.game);
  
  @override
  Widget build(BuildContext context) {
    switch(game){
      case Nothing(): 
        return  const Wrap();
      case Just(a:final answers): 
        return Wrap(
          spacing: 8,
          children: answers.getOptions().map((o) => _chip(o.a, context)).toList()
        );
    }
  }

}

Widget _chip(String data, BuildContext context) => ChoiceChip(
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
      onSelected: (selected) => debugPrint(data),
    );