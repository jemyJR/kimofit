import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/timer_and_calender/logic/timer_and_calender_cubit.dart';
import 'package:kimofit/features/timer_and_calender/ui/widgets/calender/custom_dropdown.dart';

class CustomDropdownBlocBuilder extends StatelessWidget {
  final List<LocalizedField> list;
  final String preferenceKey;

  const CustomDropdownBlocBuilder({
    super.key,
    required this.list,
    required this.preferenceKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerAndCalenderCubit()
        ..loadSelectedValue(preferenceKey: preferenceKey),
      child: BlocBuilder<TimerAndCalenderCubit, TimerAndCalenderState>(
        builder: (context, state) {
          LocalizedField? selectedValue;
          if (state is DropdownValueState) {
            selectedValue = list.firstWhere(
              (field) => field.toString() == state.selectedValue.toString(),
              orElse: () => list.first,
            );
          }
          final cubit = context.read<TimerAndCalenderCubit>();

          return CustomDropdown(
            selectedValue: selectedValue,
            list: list,
            cubit: cubit,
            preferenceKey: preferenceKey,
          );
        },
      ),
    );
  }
}
