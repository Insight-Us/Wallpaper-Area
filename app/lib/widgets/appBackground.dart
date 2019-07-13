import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final height = constraint.maxHeight;
      final width = constraint.maxWidth;

      return Image(
        image: AssetImage("Colorful-App-Tiles-Android-Wallpaper.jpg"),
        fit: BoxFit.cover,
        height: height,
        width: width,
      );

    });
  }
}
