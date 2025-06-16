import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final Size? size;
  final VoidCallback? onTap;

  const Avatar({super.key, required this.imageUrl, this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size?.width ?? 50.0,
        height: size?.height ?? 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: imageUrl.isEmpty
            ? Center(child: Icon(Icons.person_rounded))
            : ClipRRect(
                borderRadius: BorderRadius.circular((size?.width ?? 50) * 2),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.person_rounded),
                ),
              ),
      ),
    );
  }
}
