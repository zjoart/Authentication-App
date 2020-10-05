import 'package:flutter/material.dart';
import 'package:travelui/src/constants/responive_con.dart';

class AxonReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
          width: width,
          height: 240,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 5,
                  offset: Offset(0, 1))
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 70,
                        child: Image.asset('assets/images/rev.jpg')),
                    SizedBox(
                      width: SizeConfig.xMargin(context, 8),
                    ),
                    Flexible(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus',
                        style: TextStyle(
                            fontSize: SizeConfig.textSize(context, 5),
                            fontFamily: 'OpenSans-Regular'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, top: 10),
                  child: Text(
                    '- Solomon',
                    style: TextStyle(
                        fontSize: SizeConfig.textSize(context, 5),
                        fontFamily: 'OpenSansCondensed-Bold'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
