import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';
import 'package:kimofit/features/supplement/logic/supplement_cubit.dart';
import 'package:kimofit/features/supplement/ui/widget/supplement_grid_view_builder.dart';

class SupplementBlocBuilder extends StatelessWidget {
  const SupplementBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplementCubit, SupplementState>(
      builder: (context, state) {
        if (state is SupplementLoading) {
          return const SupplementGridViewBuilder(
            type: SupplementCardType.loading,
          );
        }

        if (state is SupplementSuccess) {
          List<SupplementModel> supplementList =
              state.supplementResponseModel.results;
          if (supplementList.isEmpty) {
            return const NoDataWidget();
          } else {
            return SupplementGridViewBuilder(
              type: SupplementCardType.sucess,
              supplementList: supplementList,
            );
          }
        }

        if (state is SupplementFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
