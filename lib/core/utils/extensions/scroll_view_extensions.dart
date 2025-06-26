import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

extension ScrollViewExtensions on Widget {
  Widget refreshIndicator(
    BuildContext context, {
    required RefreshController controller,
    required void Function()? onRefresh,
  }) => SmartRefresher(
    controller: controller,
    enablePullDown: true,
    header: WaterDropHeader(
      waterDropColor: Theme.of(context).colorScheme.primary,
    ),
    onRefresh: onRefresh,
    physics: BouncingScrollPhysics(),
    child: this,
  );
}
