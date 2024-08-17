import 'package:prompts/prompts/model/entities/chat.dart';
import 'package:prompts/prompts/model/entities/message.dart';
import 'package:prompts/prompts/model/entities/person.dart';

class GameState{


  Set<Person> persons = {};
  Set<Chat> chats = {};
  List<Message> messages = [];

  GameState(){}

  List<Chat> getChatList(){
    var retList = List.of(chats);
    for(final chat in retList){
      int unread =  messages.where((message) => message.chatId == chat.chatName && !message.read).length;
      chat.unread = unread;
    }
    retList.sort((chat1, chat2) {
      var messages1 = messages.where((m) => m.chatId == chat1.chatName);
      var messages2 = messages.where((m) => m.chatId == chat2.chatName);
      return messages1.last.id.compareTo(messages2.last.id);
    });
    return List.of(chats);
  }

  List<Message> getChats(String chatName){
    return this.messages.where((chat) =>
        !(chat is AnswerMessage) &&
        chat.chatId == chatName
      ).toList();
    
  }

  
  AnswerMessage? getAnswer(String chatName){
    try{
      var ret =  this.messages.lastWhere(
        (m) => (m.chatId == chatName) && (m is AnswerMessage)
                && (m.pick == null)
      ) as AnswerMessage;
      ret.read = true;
      return ret;
    } on StateError{
      return null;
    }
  }

  void newEvent(Message m){
      var chat = chats.firstWhere(
        (chat) => chat.chatName == m.chatId, 
        orElse:() =>  chats.firstWhere((chat) => chat.chatName == m.person.personName, orElse:()=>Chat(m.person.personName))
      );
      m.chatId = chat.chatName;
      chats.add(chat);
      messages.add(m);
      persons.add(m.person);
  }

  Message getMessageByLabel(String label){
    return messages.lastWhere((m) => m.messageLabel == label);
  }
}