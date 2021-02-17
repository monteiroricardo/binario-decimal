import 'package:bindec2/pages/home_page.dart';
import 'package:bindec2/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      Routes.HOME_PAGE: (ctx) => HomePage(),
    },
  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
}
