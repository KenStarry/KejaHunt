import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keja_hunt/core/features/users/map/presentation/components/triangle_clipper.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import '../../../../../presentation/components/avatar.dart';

class CustomUserMarker extends StatelessWidget {
  final Uint8List bytes;

  const CustomUserMarker({super.key, required this.bytes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: true
            ? [
                Center(
                  child: SvgPicture.asset(
                    "assets/images/icons/marker.svg",
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                  ),
                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor
                    ),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.memory(
                        bytes,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ]
            : [
                //  profile pic
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor, width: 3),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [primaryColor100, primaryColor],
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.memory(
                        bytes,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                //  triangle cutout
                Positioned(
                  bottom: 4,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Transform.flip(
                      flipY: true,
                      child: ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          width: 16,
                          height: 16,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
