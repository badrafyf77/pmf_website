import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

bool isMobileChecker(BuildContext context) {
  bool isMobileScreen = MediaQuery.of(context).size.width < 600;

  final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
  bool isMobileUserAgent =
      userAgent.contains('iphone') || userAgent.contains('android');

  return isMobileScreen || isMobileUserAgent;
}
