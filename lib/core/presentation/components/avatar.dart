import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final Size? size;

  const Avatar({super.key, required this.imageUrl, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width ?? 50.0,
      height: size?.height ?? 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).scaffoldBackgroundColor
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular((size?.width ?? 50) * 2),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
