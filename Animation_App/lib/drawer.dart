import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  // const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Animations List"),
            automaticallyImplyLeading: true, // It will never add a back button.
          ),
          Divider(),
          ListTileTheme(
            child: Text(
              'Implicit Animation',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Animated Container'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Tween Animation'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/tweenAnimation');
            },
          ),
          Divider(),
          ListTileTheme(
            child: Text(
              'Explicit Animation',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
