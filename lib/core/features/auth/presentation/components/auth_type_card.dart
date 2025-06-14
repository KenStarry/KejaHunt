import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keja_hunt/core/features/auth/presentation/model/auth_type_card_model.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class AuthTypeCard extends StatelessWidget {
  final AuthTypeCardModel authTypeCardModel;

  const AuthTypeCard({super.key, required this.authTypeCardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: grey200, width: 1),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          SvgPicture.asset(authTypeCardModel.imagePath, width: 30, height: 30),
          Text("Continue with ${authTypeCardModel.title}", style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),)
        ],
      ),
    );
  }
}
