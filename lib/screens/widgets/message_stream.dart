import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/widgets/message_box_widget.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final Firestore firestore;
  final FirebaseUser loggedInUser;
  const MessageStream({
    Key key,
    this.firestore,
    this.loggedInUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<MessageWidget> listMessage = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageWidget = MessageWidget(
            messageText: messageText,
            messageSender: messageSender,
            isMe: currentUser == messageSender,
          );

          listMessage.add(messageWidget);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: listMessage,
          ),
        );
      },
    );
  }
}
