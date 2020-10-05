import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:travelui/src/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageaProvider with ChangeNotifier {
  String baseUrl =
      'https://316424672643174:Ho0f6ofglEP-Typ50tO55Dju5s8@api.cloudinary.com/v1_1/axon-digital-agency/resources/image/upload';

  ImageaProvider();

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<List<Resources>> getaPhotos() async {
    return await http.get(baseUrl).then((response) {
      Data an = Data.fromJson(json.decode(response.body.toString()));
      return an.resources;
    });
  }
}
