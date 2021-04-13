class ChatItemModel {
  final String senderId;
  final String message;

  ChatItemModel({this.senderId, this.message});

  static List<ChatItemModel> list = [
    ChatItemModel(
      senderId: "1",
      message: "Hope you are in Pink Of Your Health There!",
    ),
    ChatItemModel(
      senderId: "1",
      message: "Sure we can talk tomorrow",
    ),
    ChatItemModel(
      senderId: "1",
      message: "Hi Ashish",
    ),
    ChatItemModel(
      senderId: "2",
      message: "How are you Dealing With The Pandemic Situation?",
    ),
    ChatItemModel(
      senderId: "2",
      message: "Are you available tomorrow at 3PM?",
    ),
    ChatItemModel(
      senderId: "2",
      message: "Hi Mohit",
    ),
  ];
}