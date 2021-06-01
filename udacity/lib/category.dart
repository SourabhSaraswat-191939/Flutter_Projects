import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import './unit.dart';
import './unit_converter.dart';

class Category {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).

  // final IconData icon;
  final String icon;
  final String name;
  final ColorSwatch tapColor;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.name,
    @required this.tapColor,
    @required this.icon,
    @required this.units,
  })  : assert(name != null),
        assert(tapColor != null),
        assert(icon != null),
        assert(units != null);
  // super(key: key);   # See the reason of when to use it ?

  // void _navigateToConverter(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<Null>(
  //       builder: (context) {
  //         return Scaffold(
  //             appBar: AppBar(
  //               elevation: 1.0,
  //               title: Text(
  //                 name,
  //                 style: Theme.of(context).textTheme.headline5,
  //               ),
  //               centerTitle: true,
  //               backgroundColor: tapColor,
  //             ),
  //             body: ConverterRoute(
  //               color: tapColor,
  //               units: units,
  //             ));
  //       },
  //     ),
  //   );
  // }

}
