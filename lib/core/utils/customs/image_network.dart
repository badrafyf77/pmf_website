import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.topLeftRaduis = 0,
    this.topRightRaduis = 0,
    this.bottomLeftRaduis = 0,
    this.bottomRightRaduis = 0,
  });

  final String url;
  final double? height;
  final double? width;
  final double topLeftRaduis;
  final double topRightRaduis;
  final double bottomLeftRaduis;
  final double bottomRightRaduis;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
    );
  }
}
