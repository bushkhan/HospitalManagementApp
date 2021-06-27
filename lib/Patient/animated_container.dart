import 'package:flutter/material.dart';

class AnimatedContainer extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            transform: Matrix4.translationValues(0, 270, 1),
            decoration: BoxDecoration(
                color: Color(0xFF265ED7).withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),
            child: null,
          ),
        )
      ],
    );
  }
}
