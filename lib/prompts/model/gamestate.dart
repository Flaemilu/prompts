import 'package:prompts/prompts/controller/events/event.dart';
import 'package:prompts/prompts/model/entities/chat.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/lib/maybe.dart';
import 'package:prompts/prompts/lib/pair.dart';
import 'package:prompts/prompts/model/entities/person.dart';

class GameState{


  Set<Person> persons = {};
  Set<Chat> chats = {};
  List<Message> messages = [];

  GameState(){}

  List<Chat> getChatList(){
    var retList = List.of(chats);
    for(final chat in retList){
      int unread =  messages.where((message) => message.chatId == chat.chatId && !message.read).length;
      chat.unread = unread;
    }
    retList.sort((chat1, chat2) {
      var messages1 = messages.where((m) => m.chatId == chat1.chatId);
      var messages2 = messages.where((m) => m.chatId == chat2.chatId);
      return messages1.last.id.compareTo(messages2.last.id);
    });
    return List.of(chats);
  }


  void newMessage(Message m){
      var chat = chats.firstWhere(
        (chat) => chat.chatId == m.chatId, 
        orElse:() =>  chats.firstWhere((chat) => chat.chatName == m.person.personName, orElse:()=>Chat(1, m.person.personName))
      );
      m.chatId = chat.chatId;
      chats.add(chat);
      messages.add(m);
      persons.add(m.person);
  }

}