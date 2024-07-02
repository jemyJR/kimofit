import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/custom_sub_container_shimmer.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/diet_plan/logic/diet_plan_cubit.dart';
import 'package:kimofit/features/diet_plan/ui/widget/diet_plan_bloc_builder/build_diet_plan_success.dart';
import 'package:kimofit/core/widgets/header_text_and_content.dart';
import 'package:kimofit/generated/l10n.dart';

class DietPlanBlocBuilder extends StatelessWidget {
  const DietPlanBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DietPlanCubit, DietPlanState>(
      builder: (context, state) {
        if (state is DietPlanLoading) {
          return HeaderTextAndContent(
            title: S.current.dietPlanHeaderMessage,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomSubContainerShimmer(
                  height: 100.h,
                );
              },
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          );
        }

        if (state is DietPlanSuccess) {
          final dietPlanResponseModel = state.dietPlanResponseModel;
          final dietsList = dietPlanResponseModel.diets;

          if (dietsList.isEmpty) {
            return const NoDataWidget();
          } else {
            return HeaderTextAndContent(
              title: S.current.dietPlanHeaderMessage,
              child: BuildDietPlanSuccess(
                dietPlanResponseModel: dietPlanResponseModel,
              ),
            );
          }
        }

        if (state is DietPlanFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
