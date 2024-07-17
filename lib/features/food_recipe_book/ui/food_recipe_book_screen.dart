import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FoodRecipeBookScreen extends StatelessWidget {
  final String title;

  const FoodRecipeBookScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: SfPdfViewer.network(
        'https://kimofit-production.up.railway.app/media/categories/attachments/FoodRecipeBookScreen.pdf',
      ),
    );
  }
}
