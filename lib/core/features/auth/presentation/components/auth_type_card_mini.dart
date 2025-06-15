import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/features/auth/presentation/model/auth_type_card_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class AuthTypeCardMini extends StatelessWidget {
  final AuthTypeCardModel authTypeCardModel;
  final VoidCallback onTap;

  const AuthTypeCardMini({super.key, required this.authTypeCardModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: UnconstrainedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(color: grey200, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SvgPicture.asset(
              authTypeCardModel.imagePath,
              width: 30,
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
