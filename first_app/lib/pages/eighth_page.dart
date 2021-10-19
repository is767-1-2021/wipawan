import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class EighthPage extends StatefulWidget {
  @override
  _EighthPageState createState() => _EighthPageState();
}

class _EighthPageState extends State<EighthPage> {
  final TextEditingController _controller = TextEditingController();
  final _channal = WebSocketChannel.connect(
    Uri.parse(
        'wss://demo.piesocket.com/v3/channel_1?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notify_self'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'send a message'))),
            SizedBox(height: 24.0),
            StreamBuilder(
              stream: _channal.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channal.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channal.sink.close();
    super.dispose();
  }
}
