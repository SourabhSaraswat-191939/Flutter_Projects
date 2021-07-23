import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  // const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/d0xSG1RtPc7g21zEL0Z8/messages')
            .snapshots(),
        builder: (ctx, AsyncSnapshot streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return new ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('chats/d0xSG1RtPc7g21zEL0Z8/messages')
              .add({
            'id': 'SourabhSaraswat',
            'text': 'This was added by clicking Float button!'
          });
          // Firestore.instance
          //     .collection('chats/d0xSG1RtPc7g21zEL0Z8/messages')
          //     .snapshots()
          //     .listen((data) {
          //   data.documents.forEach((document) {
          //     print(document['text']);
          //   });
          // });
        },
      ),
    );
  }
}
