import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelui/src/constants/responive_con.dart';

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 25),
      child: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20 / 4),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: SizeConfig.textSize(context, 8),
                  fontFamily: 'OpenSansCondensed-Light',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(right: 20 / 4),
                height: 7,
                color: Colors.blue.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
