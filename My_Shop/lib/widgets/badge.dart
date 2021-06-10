import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color color;
  const Badge({Key key, @required this.child, @required this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 8,
          right: 4,
          child: CircleAvatar(
            maxRadius: 10,
            backgroundColor:
                color != null ? color : Theme.of(context).accentColor,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
