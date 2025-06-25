import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keja_hunt/core/presentation/components/custom_network_image.dart';

class FadingCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final Duration interval;

  const FadingCarousel({
    super.key,
    required this.imageUrls,
    this.interval = const Duration(seconds: 4),
  });

  @override
  State<FadingCarousel> createState() => _FadingCarouselState();
}

class _FadingCarouselState extends State<FadingCarousel> {
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(widget.interval, (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.imageUrls.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 1000),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: CustomNetworkImage(
        url: widget.imageUrls[currentIndex],
        key: ValueKey<String>(widget.imageUrls[currentIndex]),
      ),
    );
  }
}
