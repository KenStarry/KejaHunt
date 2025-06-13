import 'package:flutter/material.dart';

class AgentDashboardPage extends StatefulWidget {
  final Widget child;
  const AgentDashboardPage({super.key, required this.child});

  @override
  State<AgentDashboardPage> createState() => _AgentDashboardPageState();
}

class _AgentDashboardPageState extends State<AgentDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(),
      ),
    );
  }
}
