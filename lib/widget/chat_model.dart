import 'package:socialgram/view_screen/contact_model.dart';

class ChatModel {
  final bool isTyping;
  final String lastMessage;
  final String lastMessageTime;
  final ContactModel contact;

  ChatModel(
      {this.isTyping, this.lastMessage, this.lastMessageTime, this.contact});

  static List<ChatModel> list = [
    ChatModel(
      isTyping: true,
      lastMessage: "hello!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Ashish Rawat"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "Sure, no problem Jhon!",
      lastMessageTime: "1d",
      contact: ContactModel(name: "Akshay Aswal"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "thank you Jhon!",
      lastMessageTime: "3d",
      contact: ContactModel(name: "Aditya Syal"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "hello!",
      lastMessageTime: "2d",
      contact: ContactModel(name: "Ashish Rawat"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "Sure, no problem Jhon!",
      lastMessageTime: "1d",
      contact: ContactModel(name: "Akshay Aswal"),
    ),
    ChatModel(
      isTyping: false,
      lastMessage: "thank you Jhon!",
      lastMessageTime: "3d",
      contact: ContactModel(name: "Aditya Syal"),
    ),
  ];
}