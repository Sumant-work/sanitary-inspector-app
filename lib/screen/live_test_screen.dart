import 'package:flutter/material.dart';
class LiveTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('🔒 Live Test')),
      body: Center(child: Text(
        'Live Tests are coming soon! 🚧\n​Join our Telegram to stay updated.',
        textAlign: TextAlign.center,
      )),
    );
  }
}
