
import 'dart:ffi';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:prompts/prompts/controller/events/event.dart';

class EventManager {
  static final EventBus _eventBus = EventBus(sync: false);
  static final EventManager instance = EventManager._();
  static bool initialized = false;

  EventManager._(){
    if(!initialized){
      _eventBus.on<UserEvent>().listen(
        (event) => this._handleUserEvent(event)
      );
      initialized = true;
    }
  }

  

  void fireEvent(Object o){
    EventManager._eventBus.fire(o);
    debugPrint("event fired!");
  }


  void _handleUserEvent(UserEvent e) {
    switch(e){
      case UserChangeChat(name: String name):
        debugPrint("Handle change chat: $name!");
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