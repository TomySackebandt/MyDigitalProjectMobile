import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:meta/meta.dart';

import '../repositories/pusher_service.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final PusherService pusherService;

  ChatBloc(this.pusherService) : super(ChatInitial()) {
    on<ConnectPusher>((event, emit) {
      pusherService.connect();
    });

    on<DisconnectPusher>((event, emit) {
      pusherService.disconnect();
    });

    on<SubscribeChannel>((event, emit) {
      pusherService.subscribe(event.channelName, (data) {
        add(NewMessage(data));
      });
    });

    on<UnsubscribeChannel>((event, emit) {
      pusherService.unsubscribe(event.channelName);
    });

    on<NewMessage>((event, emit) {
      if (state is ChatLoaded) {
        final updatedMessages = List<String>.from((state as ChatLoaded).messages)
          ..add(event.message);
        emit(ChatLoaded(updatedMessages));
      } else {
        emit(ChatLoaded([event.message]));
      }
    });

    on<SendMessage>((event, emit) {
      pusherService.sendMessage(event.channelName, 'message', event.message);
    });
  }
}
