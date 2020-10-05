
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:travelui/src/constants/responive_con.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.xMargin(context, width),
      height: SizeConfig.yMargin(context, 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(0, 1))
        ],
        image: DecorationImage(
          image: new AssetImage("assets/images/headerimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: ScaleAnimatedTextKit(
          repeatForever: true,
          onTap: () {
            print("Tap Event");
          },
          text: [
            "Creativity is Our Lifestyle",
            "Crafting Your Imagination",
            "Making the world talk about you"
          ],
          textStyle: TextStyle(
              fontSize: SizeConfig.textSize(context, 10),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-Medium'),
          textAlign: TextAlign.center,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),
    );
  }
}
