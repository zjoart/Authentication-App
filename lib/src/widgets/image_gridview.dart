import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travelui/src/models/image_model.dart';
import 'package:travelui/src/screens/fullscreen.dart';

class GridViewImages extends StatelessWidget {
  const GridViewImages({
    Key key,
    @required this.resources,
  }) : super(key: key);

  final List<Resources> resources;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.74,
      shrinkWrap: false,
      children: resources.map((i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FullScreen(i)));
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.black,
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Hero(
                tag: i.secureUrl,
                child: CachedNetworkImage(
        imageUrl: i.secureUrl,
        placeholder: (context, url) => Container(
         child:  new BackdropFilter(filter: new ImageFilter.blur(sigmaX: 600.0, sigmaY: 1000.0),child: Container(
        alignment: Alignment.center,
        color: Colors.grey.withOpacity(0.1),
      ),),
      
         ),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

