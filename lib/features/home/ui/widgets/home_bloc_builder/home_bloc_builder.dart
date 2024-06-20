import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/features/home/logic/home_cubit.dart';
import 'package:kimofit/features/home/ui/widgets/home_bloc_builder/build_home_failure.dart';
import 'package:kimofit/features/home/ui/widgets/home_bloc_builder/build_home_loading.dart';
import 'package:kimofit/features/home/ui/widgets/home_bloc_builder/build_home_success.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const BuildHomeLoading();
        }

        if (state is HomeSuccess) {
          return BuildHomeSuccess(homeResponseModel: state.homeResponseModel);
        }

        if (state is HomeFailure) {
          return const BuildHomeFailure();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
