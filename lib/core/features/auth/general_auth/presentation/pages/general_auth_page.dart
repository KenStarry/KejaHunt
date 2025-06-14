import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/features/auth/presentation/model/auth_type_card_model.dart';
import 'package:keja_hunt/core/presentation/components/custom_filled_button.dart';
import 'package:keja_hunt/core/utils/constants.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

import '../../../presentation/components/auth_type_card.dart';

class GeneralAuthPage extends StatefulWidget {
  const GeneralAuthPage({super.key});

  @override
  State<GeneralAuthPage> createState() => _GeneralAuthPageState();
}

class _GeneralAuthPageState extends State<GeneralAuthPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(top: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: SvgPicture.asset(
              "assets/images/undraw/authsvg.svg",
              width: 180,
              height: 180,
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24)),

          SliverToBoxAdapter(
            child: Text(
              "Ready to Hunt?",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 32),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24)),

          /// Auth Options
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  AuthTypeCard(authTypeCardModel: supportedAuthTypes[index]),
              childCount: supportedAuthTypes.length,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(flex: 2, child: Divider(thickness: 1, color: grey200)),
                Expanded(
                  child: Text(
                    "Or",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: grey700,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(flex: 2, child: Divider(thickness: 1, color: grey200)),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                CustomFilledButton(text: "Sign in with password", onTap: () {}),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don’t have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: grey700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextSpan(
                        text: "Sign Up",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushNamed('signup');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
