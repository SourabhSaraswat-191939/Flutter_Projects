import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [IconButton(icon: Icon(Icons.plus_one), onPressed: () {})],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
