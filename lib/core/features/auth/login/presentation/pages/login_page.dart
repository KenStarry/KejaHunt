import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/features/auth/presentation/components/auth_type_card.dart';
import 'package:keja_hunt/core/presentation/components/custom_checkbox.dart';
import 'package:keja_hunt/core/utils/constants.dart';

import '../../../../../presentation/components/custom_filled_button.dart';
import '../../../../../utils/theme/colors.dart';
import '../../../presentation/components/auth_type_card_mini.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              "assets/images/logo.png",
              width: 200,
              height: 200,
            ),
          ),

          SliverToBoxAdapter(
            child: Text(
              "Let’s Log You In",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 32),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [

                //  Remember Me
                CustomCheckbox(label: "Remember me"),

                CustomFilledButton(text: "Sign in", onTap: () {}),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Forgot Password?",
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
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Divider(thickness: 1, color: grey200),
                    ),
                    Text(
                      "or continue with",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: grey700,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Divider(thickness: 1, color: grey200),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: supportedAuthTypes
                      .map((type) => AuthTypeCardMini(authTypeCardModel: type))
                      .toList(),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Text.rich(
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
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
