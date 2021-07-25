import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String userName;
  final Key key;
  const MessageBubble(this.message, this.isMe, this.userName,
      {required this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Colors.grey[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: !isMe ? Radius.zero : Radius.circular(12),
                bottomRight: isMe ? Radius.zero : Radius.circular(12)),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe
                      ? Theme.of(context).accentTextTheme.title!.color
                      : Colors.black,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                    color: isMe
                        ? Theme.of(context).accentTextTheme.title!.color
                        : Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
