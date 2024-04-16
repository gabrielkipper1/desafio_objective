import 'package:desafio_objective/src/features/character_list/widgets/app_bar/landscape_app_bar.dart';
import 'package:desafio_objective/src/features/character_list/widgets/app_bar/portrait_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarBuilder extends StatelessWidget {
  const AppBarBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final reponsive = ResponsiveBreakpoints.of(context);

    if (reponsive.breakpoint.name == DESKTOP) {
      return const LandscapeAppBar();
    }

    return const PortraitAppBar();
  }
}
