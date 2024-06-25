import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';
import 'package:kimofit/features/supplement/ui/supplement_screen.dart';
import 'package:kimofit/features/supplement/ui/widget/supplement_card.dart';

class SupplementGridViewBuilder extends StatelessWidget {
  const SupplementGridViewBuilder({
    super.key,
    required this.supplementList,
  });
  final List<SupplementModel> supplementList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SupplementCard(
            supplement: supplementList[index],
            index: index,
          );
        },
        itemCount: supplementTestData.length,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
