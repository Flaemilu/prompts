import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/events/event.dart';
import 'package:prompts/prompts/model/game/game.dart';

class EventManager {
  static final EventBus _eventBus = EventBus(sync: false);
  static final EventManager instance = EventManager._();
  static bool _initialized = false;
  Game? game;
  EventManager._(){
    if(!_initialized){
      _eventBus.on<UserEvent>().listen(
        (event) => this._handleUserEvent(event)
      );
      _initialized = true;
    }
  }

  

  void fireEvent(Object o){
    EventManager._eventBus.fire(o);
    debugPrint("event fired!");
  }


  void _handleUserEvent(UserEvent e) {
    switch(e){
      case UserChangeChat(chatId: String id):
        debugPrint("Handle change chat: $id!");
        game?.person = id;
        game?.mainWidget.setState(() {});
        break;
      case UserPickAnswer(id: String id, label: String label):
        debugPrint("Handle pick anser $id!");
        game?.answer(label, id);
        break;
      case UserNextMessage():
        debugPrint("Handle next message!");
        break;
    }
  }

  void registerGame(Game g){
    this.game = g;
  }

}