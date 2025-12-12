import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomSimularImage extends StatelessWidget {
  const CustomSimularImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: FancyShimmerImage(imageUrl: image),
        ),
      ),
    );
  }
}
