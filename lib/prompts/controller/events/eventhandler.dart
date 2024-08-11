import 'package:prompts/prompts/controller/events/event.dart';

abstract class EventHandler{
  handle(UserEvent e);
}