import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final height = constraint.maxHeight;
      final width = constraint.maxWidth;

      return Stack(
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Positioned(
            left: -(height/2 -width/2 ),
            bottom: height * 0.20,
            child: Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                  color: Colors.pink[600], shape: BoxShape.circle),
            ),
          ),
          Positioned(
            left: -(height/2 -width/2 ),
            bottom: height * 0.30,
            child: Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                  color: Colors.pink[700], shape: BoxShape.circle),
            ),
          )
        ],
      );
    });
  }
}
