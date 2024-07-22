import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_calender_cubit/home_cardio_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/custom_dropdown.dart';
import 'package:kimofit/generated/l10n.dart';

class HomeCardioCalenderRowBlocBuilder extends StatelessWidget {
  const HomeCardioCalenderRowBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCardioCalenderCubit, HomeCardioCalenderState>(
      builder: (context, state) {
        if (state is HomeCardioCalenderSuccess) {
          final cubit = context.read<HomeCardioCalenderCubit>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColumn(
                label: S.of(context).dayNamber,
                child: CustomDropdown(
                  list: state.days,
                  selectedValue: state.selectedDay,
                  onChanged: (newDay) {
                    if (newDay != null) {
                      cubit.selectDay(newDay);
                    }
                  },
                ),
              ),
              _buildColumn(
                label: S.of(context).weekNamber,
                child: CustomDropdown(
                  list: weeks,
                  selectedValue: state.selectedWeek,
                  onChanged: (newWeek) {
                    if (newWeek != null) {
                      cubit.selectWeek(newWeek);
                    }
                  },
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildColumn({
    required String label,
    required Widget child,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.font15White,
        ),
        verticalSpace(2),
        child,
      ],
    );
  }
}
