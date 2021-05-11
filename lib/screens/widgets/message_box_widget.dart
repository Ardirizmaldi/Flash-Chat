import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isMe;
  const MessageWidget({
    Key key,
    this.messageText,
    this.messageSender,
    this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              isMe ? 'Me' : messageSender,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12.0,
              ),
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isMe ? 0 : 30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(isMe ? 30 : 0),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                messageText,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
