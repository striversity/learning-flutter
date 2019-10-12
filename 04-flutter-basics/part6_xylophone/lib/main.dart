import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final keyColors = <Color>[
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.black,
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraint) {
            var maxWidth = constraint.maxWidth / (keyColors.length + 2);

            var w = maxWidth - (maxWidth * 0.3);
            var h = 200.0;

            final myKeys = keyColors
                .map((c) => XylophoneKey(
                      color: c,
                      width: w,
                      height: h,
                    ))
                .toList();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr,
              children: myKeys,
            );
          },
        ),
      ),
    );
  }
}

class XylophoneKey extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  XylophoneKey({this.color, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("I was tapped: ${color.toString()}");
      },
      child: Container(
        color: color,
        width: width,
        height: height,
      ),
    );
  }
}
