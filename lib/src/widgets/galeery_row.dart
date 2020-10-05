
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelui/src/constants/responive_con.dart';

class GaleeryRow extends StatelessWidget {
  const GaleeryRow({
    Key key, this.text, this.image
  }) : super(key: key);
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 25, top: 20,),
      child: Container(
        height: 200,
        width: 350,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                height: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(text,
              maxLines: 2,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Medium',
                      fontWeight: FontWeight.w500,
                      fontSize:
                          SizeConfig.textSize(context, 7)))
            ],
          ),
        ),
      ),
    );
  }
}
