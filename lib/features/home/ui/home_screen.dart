import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/features/home/logic/home_cubit.dart';
import 'package:kimofit/features/home/ui/widgets/home_bloc_builder/home_bloc_builder.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      body: refreshWidget(
        context,
        const HomeBlocBuilder(),
      ),
    );
  }
}

Widget refreshWidget(BuildContext context, Widget child) {
  return LiquidPullToRefresh(
    color: ColorsManager.blue,
    animSpeedFactor: 2.0,
    showChildOpacityTransition: false,
    onRefresh: () async {
      await context.read<HomeCubit>().refreshHomeData();
    },
    child: child,
  );
}
