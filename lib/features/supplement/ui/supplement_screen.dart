import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';
import 'package:kimofit/features/supplement/ui/widget/supplement_grid_view_builder.dart';

class SupplementScreen extends StatelessWidget {
  const SupplementScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: SupplementGridViewBuilder(
        supplementList: supplementTestData,
      ),
    );
  }
}

final List<SupplementModel> supplementTestData = [
  SupplementModel(
    name: LocalizedField(
      ar: "الكركمين",
      en: "Curcumin",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 1, times: "مساء"),
      SupplementDosesModel(dose: 1, times: "مساء"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "الزنك",
      en: "Zinc",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 2, times: "مساء"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "الحديد",
      en: "Iron",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 4, times: "مساء"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "الفيتامينات",
      en: "Vitamins",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 1, times: "صباحا"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "المغنيسيوم",
      en: "Magnesium",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 1, times: "صباحا"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "الكالسيوم",
      en: "Calcium",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 1, times: "صباحا"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "فيتامين سي",
      en: "Vitamin C",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 1, times: "صباحا"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "الزنك",
      en: "Zinc",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 2, times: "صباحا"),
    ],
  ),
  SupplementModel(
    name: LocalizedField(
      ar: "الكركمين",
      en: "Curcumin",
    ),
    image:
        'https://kimofit-production.up.railway.app/media/supplements/L-Arginine_A58VjnZ.jpg',
    doses: [
      SupplementDosesModel(dose: 1, times: "صباحا"),
    ],
  ),
];
