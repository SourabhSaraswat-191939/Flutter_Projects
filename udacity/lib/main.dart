// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './cupertinoAndMaterial.dart';
import './category_route.dart';

// const _categoryName = 'Cake';
// const _categoryIcon = Icons.cake;
// const _categoryColor = Colors.green;

void main() {
  runApp(UnitConverter());
}

class UnitConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unitss Converter',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.grey[600],
            ),
        // This colors the [InputOutlineBorder] when it is selected
        primaryColor: Colors.grey[500],
        textSelectionHandleColor: Colors.green[500],
        primarySwatch: Colors.orange,
        accentColor: Colors.pink,
        bottomAppBarColor: Colors.purple,
        buttonColor: Colors.white,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   title: Text('Unit Converter'),
        //   actions: [
        //     Builder(
        //       builder: (context) => ElevatedButton(
        //         onPressed: () => Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) {
        //             return toggle();
        //           }),
        //         ),
        //         child: Icon(Icons.toggle_on_outlined),
        //       ),
        //     )
        //   ],
        // ),
        backgroundColor: Colors.green[100],
        body: Center(
          child: CategoryRoute(),
        ),
      ),
    );
  }
}
