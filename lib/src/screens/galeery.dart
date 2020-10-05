import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelui/src/models/image_model.dart';
import 'package:travelui/src/services/image_provider.dart';
import 'package:travelui/src/widgets/image_gridview.dart';


class GalerryScreen extends StatefulWidget {
  @override
  _GalerryScreenState createState() => _GalerryScreenState();
}

class _GalerryScreenState extends State<GalerryScreen> {
  

  @override
  Widget build(BuildContext context) {
    final imagep = Provider.of<ImageaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      backgroundColor: Colors.blue[800],
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                List<Resources> resources = snapshot.data;
                return GridViewImages(resources: resources);
              } else {
                return Center(child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: imagep.getaPhotos()),
    );
  }
}

