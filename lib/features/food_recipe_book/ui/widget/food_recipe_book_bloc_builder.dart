// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kimofit/core/di/dependency_injection.dart';
// import 'package:kimofit/core/helpers/extensions.dart';
// import 'package:kimofit/core/widgets/custom_snack_bar.dart';
// import 'package:kimofit/core/widgets/loading_widget.dart';
// import 'package:kimofit/core/widgets/no_data_widget.dart';
// import 'package:kimofit/features/food_recipe_book/logic/food_recipe_book_cubit.dart';
// import 'package:kimofit/features/food_recipe_book/ui/widget/pdf_viewer_widget.dart';

// class FoodRecipeBookBlocBuilder extends StatelessWidget {
//   const FoodRecipeBookBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final loadingService = getIt<LoadingWidgetService>();
//     return BlocBuilder<FoodRecipeBookCubit, FoodRecipeBookState>(
//       builder: (context, state) {
//         if (state is FoodRecipeBookLoading) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             loadingService.showLoadingOverlay(context);
//           });
//         }
//         if (state is FoodRecipeBookSuccess) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             loadingService.hideLoading();
//           });
//           final pdfUrl = state.pdfUrl;

//           if (pdfUrl.isNullOrEmpty()) {
//             return const NoDataWidget();
//           } else {
//             return PdfViewerWidget(
//               pdfUrl: pdfUrl,
//             );
//           }
//         }
//         if (state is FoodRecipeBookFailure) {
//           customSnackBar(context, state.errorMessage);
//         }

//         return const SizedBox.shrink();
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/loading_widget.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/food_recipe_book/logic/food_recipe_book_cubit.dart';
import 'package:kimofit/features/food_recipe_book/ui/widget/pdf_viewer_widget.dart';

class FoodRecipeBookBlocBuilder extends StatelessWidget {
  const FoodRecipeBookBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingService = getIt<LoadingWidgetService>();

    return BlocBuilder<FoodRecipeBookCubit, FoodRecipeBookState>(
      builder: (context, state) {
        if (state is FoodRecipeBookLoading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            loadingService.showLoadingOverlay(context);
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            loadingService.hideLoading();
          });
        }
        if (state is FoodRecipeBookSuccess) {
          final pdfUrl = state.pdfUrl;
          if (pdfUrl.isNullOrEmpty()) {
            return const NoDataWidget();
          } else {
            return PdfViewerWidget(
              pdfUrl: pdfUrl,
            );
          }
        }

        if (state is FoodRecipeBookFailure) {
          customSnackBar(context, state.errorMessage);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
