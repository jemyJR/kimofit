import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/app/logic/cubit/language_cubit.dart';
import 'package:kimofit/core/constants/assets.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 90.h,
        color: ColorsManager.bgDarklow,
        child: Lottie.asset(
          Assets.animationLoading,
          reverse: true,
          repeat: true,
        ),
      ),
    );
  }
}

OverlayEntry showLoadingOverlay(BuildContext context) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => const Material(
      color: Colors.transparent,
      child: Center(
        child: LoadingWidget(),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
  return overlayEntry;
}

void changeLanguageWithDelay(BuildContext context) {
  OverlayEntry overlayEntry = showLoadingOverlay(context);

  Future.delayed(
    const Duration(seconds: 2),
    () {
      overlayEntry.remove();

      Locale newLocale =
          (context.read<LanguageCubit>().state.locale.languageCode == 'en')
              ? const Locale('ar')
              : const Locale('en');

      context.read<LanguageCubit>().setLocale(newLocale);
    },
  );
}
