import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HouseNetworkImage extends StatelessWidget {
  final String url;
  final Size? size;

  const HouseNetworkImage({super.key, this.size, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: size?.width ?? double.infinity,
      height: size?.height ?? double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      errorWidget: (context, url, error) =>
          Icon(Icons.error, color: Theme.of(context).colorScheme.error),
    );
  }
}
