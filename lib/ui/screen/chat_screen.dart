import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chat_bloc.dart';
import '../../repositories/pusher_service.dart';

class ChatScreen extends StatelessWidget {
  final String channelName;

  ChatScreen({required this.channelName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Chat"),
      ),
      body: BlocProvider(
        create: (context) => ChatBloc(PusherService())
          ..add(ConnectPusher())
          ..add(SubscribeChannel(channelName)),
        child: ChatView(),
      ),
    );
  }
}

class ChatView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatLoaded) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.messages[index]),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter your message',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final message = _controller.text;
                  if (message.isNotEmpty) {
                    BlocProvider.of<ChatBloc>(context).add(
                      SendMessage('roomtest', message),
                    );
                    _controller.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
