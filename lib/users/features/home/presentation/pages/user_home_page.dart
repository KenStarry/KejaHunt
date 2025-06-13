import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(left: 16),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "Discover\nyour new home!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 26
              ),
            ),
          ),

          SliverToBoxAdapter()
        ],
      ),
    );
  }
}
