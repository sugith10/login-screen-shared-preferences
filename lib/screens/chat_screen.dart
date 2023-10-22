import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Name'), // Chat partner's name
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ChatMessage(isMyMessage: false, message: 'Hi there!'),
                  ChatMessage(isMyMessage: true, message: 'Hello!'),
                  ChatMessage(isMyMessage: false, message: 'How are you?'),
                  ChatMessage(isMyMessage: true, message: 'I\'m good!'),
                ],
              ),
            ),
            ChatInputField(),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isMyMessage;
  final String message;

  ChatMessage({required this.isMyMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMyMessage ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                contentPadding: EdgeInsets.all(16),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
