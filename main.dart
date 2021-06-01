// // this dart is to showw example of BottomSheet, BottomModalSheet and SnackBar

// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import './category_route.dart';

// // const _categoryName = 'Cake';
// // const _categoryIcon = Icons.cake;
// // const _categoryColor = Colors.green;

// void main() {
//   runApp(UnitConverter());
// }

// class UnitConverter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Unitss Converter',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//         accentColor: Colors.pink,
//         bottomAppBarColor: Colors.purple,
//         buttonColor: Colors.white,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: Text('Unit Converter'),
//         ),
//         backgroundColor: Colors.green[100],
//         body: Column(
//             // child: CategoryRoute(),
//             children: [
//               Center(
//                 child: Builder(
//                   builder: (BuildContext context) {
//                     return ElevatedButton(
//                       child: Text("Sourabh"),
//                       onPressed: () => {
//                         Scaffold.of(context)
//                             .showBottomSheet<void>((BuildContext context) {
//                           return Container(
//                             alignment: Alignment.center,
//                             height: 200,
//                             color: Colors.amber,
//                             child: Center(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   const Text('BottomSheet'),
//                                   ElevatedButton(
//                                     child: const Text('Close BottomSheet'),
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                       },
//                     );
//                   },
//                 ),
//               ),
//               Center(
//                 child: Builder(builder: (BuildContext context) {
//                   return ElevatedButton(
//                     child: const Text('showModalBottomSheet'),
//                     onPressed: () {
//                       showModalBottomSheet<void>(
//                         context: context,
//                         barrierColor: Colors.greenAccent.withOpacity(0.5),
//                         builder: (BuildContext context) {
//                           return Container(
//                             height: 200,
//                             color: Colors.amber,
//                             child: Center(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   const Text('Modal BottomSheet'),
//                                   ElevatedButton(
//                                     child: const Text('Close BottomSheet'),
//                                     onPressed: () => Navigator.pop(context),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   );
//                 }),
//               ),
//               Center(
//                 child: Builder(builder: (BuildContext context) {
//                   return ElevatedButton(
//                       child: const Text('showSnackBar'),
//                       onPressed: () {
//                         Scaffold.of(context).showSnackBar(SnackBar(
//                           content: Text('Show Snackbar'),
//                           duration: Duration(seconds: 3),
//                         ));
//                       });
//                 }),
//               ),
//             ]),
//       ),
//     );
//   }
// }
