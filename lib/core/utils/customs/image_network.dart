import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    required this.topLeftRaduis,
    required this.topRightRaduis,
    required this.bottomLeftRaduis,
    required this.bottomRightRaduis,
  });

  final String url;
  final double height;
  final double width;
  final double topLeftRaduis;
  final double topRightRaduis;
  final double bottomLeftRaduis;
  final double bottomRightRaduis;

  @override
  Widget build(BuildContext context) {
    return ImageNetwork(
      image: url,
      height: height,
      width: width,
      duration: 250,
      curve: Curves.easeIn,
      debugPrint: false,
      fullScreen: false,
      fitWeb: BoxFitWeb.cover,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftRaduis),
        topRight: Radius.circular(topRightRaduis),
        bottomLeft: Radius.circular(bottomLeftRaduis),
        bottomRight: Radius.circular(bottomRightRaduis),
      ),
      onLoading: Skeletonizer(
        enabled: true,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeftRaduis),
              topRight: Radius.circular(topRightRaduis),
              bottomLeft: Radius.circular(bottomLeftRaduis),
              bottomRight: Radius.circular(bottomRightRaduis),
            ),
          ),
        ),
      ),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
