import 'package:pusher_client/pusher_client.dart';

class PusherService {
  late PusherClient _pusher;
  late Channel _channel;

  PusherService() {
    _pusher = PusherClient(
      '0153698a0a49aefdbdf4', // Replace with your actual Pusher App Key
      PusherOptions(
        cluster: 'eu', // Replace with your actual Pusher App Cluster
        encrypted: true, // Set to true if using HTTPS
      ),
    );

    _pusher.connect();
  }

  void connect() {
    _pusher.connect();
  }

  void disconnect() {
    _pusher.disconnect();
  }

  void subscribe(String channelName, Function(dynamic) onEvent) {
    _channel = _pusher.subscribe(channelName);

    _channel.bind('message', (event) {
      onEvent(event?.data);
    });
  }

  void unsubscribe(String channelName) {
    _pusher.unsubscribe(channelName);
  }

  void sendMessage(String channelName, String eventName, String message) {
    _channel.trigger(eventName, message);
  }
}
