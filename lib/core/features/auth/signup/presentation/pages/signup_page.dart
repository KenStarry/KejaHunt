import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../presentation/components/custom_checkbox.dart';
import '../../../../../presentation/components/custom_filled_button.dart';
import '../../../../../presentation/components/custom_text_field.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/theme/colors.dart';
import '../../../presentation/components/auth_type_card_mini.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isRememberMeChecked = false;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
              "Start Your Hunt\nToday",
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
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  borderColor: Colors.transparent,
                  obscureText: !isConfirmPasswordVisible,
                  prefixIcon: SvgPicture.asset(
                    "assets/images/icons/lock.svg",
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                    icon: SvgPicture.asset(
                      "assets/images/icons/visibility_${isConfirmPasswordVisible ? 'on' : 'off'}.svg",
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

                CustomFilledButton(text: "Sign up", onTap: () {}),
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
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: grey700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    TextSpan(
                      text: "Sign in",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed('login');
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
