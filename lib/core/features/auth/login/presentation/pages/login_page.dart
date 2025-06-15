import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/features/auth/presentation/components/auth_type_card.dart';
import 'package:keja_hunt/core/presentation/components/custom_checkbox.dart';
import 'package:keja_hunt/core/presentation/components/custom_text_field.dart';
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
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  bool isPasswordVisible = false;
  bool isRememberMeChecked = true;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
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
              "Ready to Hunt\nAgain?",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 32),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24)),

          SliverToBoxAdapter(
            child: Column(
              spacing: 20,
              children: [
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  borderColor: Colors.transparent,
                  prefixIcon: SvgPicture.asset(
                    "assets/images/icons/email.svg",
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn),
                  ),
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  borderColor: Colors.transparent,
                  obscureText: !isPasswordVisible,
                  prefixIcon: SvgPicture.asset(
                    "assets/images/icons/lock.svg",
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: SvgPicture.asset(
                      "assets/images/icons/visibility_${isPasswordVisible ? 'on' : 'off'}.svg",
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn),
                    ),
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
                //  Remember Me
                CustomCheckbox(
                  label: "Remember me",
                  isChecked: isRememberMeChecked,
                  onTap: () {
                    setState(() {
                      isRememberMeChecked = !isRememberMeChecked;
                    });
                  },
                ),

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
                      .map(
                        (type) => AuthTypeCardMini(
                          authTypeCardModel: type,
                          onTap: () {},
                        ),
                      )
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
          SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
