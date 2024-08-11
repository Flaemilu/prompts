
import 'dart:ffi';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/events/event.dart';

class EventManager {
  static final EventBus _eventBus = EventBus(sync: false);
  static final EventManager instance = EventManager._();
  static bool _initialized = false;

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
      case UserChangeChat(chatId: int id):
        debugPrint("Handle change chat: $id!");
        break;
      case UserPickAnswer(id: int id):
        debugPrint("Handle pick anser $id!");
        break;
      case UserNextMessage():
        debugPrint("Handle next message!");
        break;
    }
  }

}