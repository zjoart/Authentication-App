import 'package:flutter/material.dart';
import 'package:travelui/src/constants/color_con.dart';
import 'package:travelui/src/constants/responive_con.dart';

class DontHave extends StatelessWidget {
  const DontHave({
    Key key,
    @required this.style,
    this.press,
    this.ftext,
    this.stext
  }) : super(key: key);

  final TextStyle style;
  final  Function press;
  final String ftext;
    final String stext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(ftext,
        style: style.copyWith(fontSize: SizeConfig.textSize(context, 4),),
        ),
        FlatButton(
            onPressed: press,
            child: Text(
              stext,
              style: style.copyWith(
                fontSize: SizeConfig.textSize(context, 5),
                  color: kcolor,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}