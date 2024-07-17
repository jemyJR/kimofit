import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatelessWidget {
  const PdfViewerWidget({
    super.key,
    required this.pdfUrl,
  });

  final String pdfUrl;

  @override
  Widget build(BuildContext context) {
    return SfTheme(
      data: SfThemeData(
        pdfViewerThemeData: SfPdfViewerThemeData(
          backgroundColor: ColorsManager.bgDark,
          progressBarColor: ColorsManager.blue,
          paginationDialogStyle: PdfPaginationDialogStyle(
            backgroundColor: ColorsManager.white,
            headerTextStyle: TextStyles.font22Blue,
            inputFieldTextStyle: TextStyles.font15BlueBold,
            hintTextStyle: TextStyles.font18Gray,
            pageInfoTextStyle: TextStyles.font15BlueBold,
            okTextStyle: TextStyles.font15BlueBold,
            cancelTextStyle: TextStyles.font15BlueBold,
          ),
        ),
      ),
      child: SfPdfViewer.network(
        pdfUrl,
      ),
    );
  }
}
