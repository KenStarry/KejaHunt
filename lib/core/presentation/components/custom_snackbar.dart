import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/presentation/components/snackbars/enum/snackbar_types.dart';
import 'package:keja_hunt/core/presentation/components/snackbars/success_snackbar.dart';

import '../../utils/theme/colors.dart';

void showCustomSnackbar(
  BuildContext context,
  String message, {
  SnackbarType type = SnackbarType.success,
  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) {
      return _AnimatedSnackbarWrapper(
        duration: duration,
        child: SuccessSnackbar(message: message),
        onDismissed: () => overlayEntry.remove(),
      );
    },
  );

  overlay.insert(overlayEntry);
}

class _AnimatedSnackbarWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final VoidCallback onDismissed;

  const _AnimatedSnackbarWrapper({
    required this.child,
    required this.duration,
    required this.onDismissed,
  });

  @override
  State<_AnimatedSnackbarWrapper> createState() =>
      _AnimatedSnackbarWrapperState();
}

class _AnimatedSnackbarWrapperState extends State<_AnimatedSnackbarWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 0.5),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, () async {
      await _controller.reverse();
      if (mounted) {
        widget.onDismissed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(position: _offsetAnimation, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
