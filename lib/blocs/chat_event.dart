part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ConnectPusher extends ChatEvent {}

class DisconnectPusher extends ChatEvent {}

class SubscribeChannel extends ChatEvent {
  final String channelName;

  SubscribeChannel(this.channelName);
}

class UnsubscribeChannel extends ChatEvent {
  final String channelName;

  UnsubscribeChannel(this.channelName);
}

class NewMessage extends ChatEvent {
  final String message;

  NewMessage(this.message);
}

class SendMessage extends ChatEvent {
  final String channelName;
  final String message;

  SendMessage(this.channelName, this.message);
}
