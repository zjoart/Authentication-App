

import 'package:flutter/material.dart';
import 'package:travelui/src/models/image_model.dart';

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  Resources resources;

  FullScreen(this.resources);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: resources.secureUrl,
            child: Image.network(
              resources.secureUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          new Align(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
