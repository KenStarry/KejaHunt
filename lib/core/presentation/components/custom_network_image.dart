import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final bool makeRound;
  final Size? size;

  const CustomNetworkImage({
    super.key,
    this.makeRound = false,
    this.size,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: makeRound ? BorderRadius.circular(((size?.width ?? 100) * 2)) : BorderRadius.zero,
      child: CachedNetworkImage(
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
      ),
    );
  }
}
