import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.onTap});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: kBottomContainerColor,
          ),
          width: 350.0,
          height: kBottomContainerHeight,
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
