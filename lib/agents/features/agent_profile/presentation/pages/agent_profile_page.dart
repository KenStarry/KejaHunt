import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:keja_hunt/core/utils/theme/colors.dart';

class AgentProfilePage extends StatefulWidget {

  final String userId;

  const AgentProfilePage({super.key, required this.userId});

  @override
  State<AgentProfilePage> createState() => _AgentProfilePageState();
}

class _AgentProfilePageState extends State<AgentProfilePage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Agent Profile",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: redColor,
      ),
    );
  }
}
