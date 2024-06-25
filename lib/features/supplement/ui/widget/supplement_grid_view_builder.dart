import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kimofit/app/ui/kimofit_app.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/supplement/data/models/supplement_doses_model.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';
import 'package:kimofit/features/supplement/ui/widget/supplement_card.dart';
import 'package:kimofit/features/supplement/ui/widget/supplement_card_shimmer.dart';
import 'package:kimofit/generated/l10n.dart';

enum SupplementCardType { sucess, loading }

class SupplementGridViewBuilder extends StatelessWidget {
  const SupplementGridViewBuilder({
    super.key,
    this.supplementList,
    required this.type,
  });
  final List<SupplementModel>? supplementList;
  final SupplementCardType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return type == SupplementCardType.sucess
              ? SupplementCard(
                  supplement: supplementList![index],
                  index: index,
                )
              : SupplementCardShimmer(
                  supplement: supplementModel,
                  index: index,
                );
        },
        itemCount:
            type == SupplementCardType.sucess ? supplementList!.length : 6,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}

SupplementModel supplementModel = SupplementModel(
  name: LocalizedField(
    ar: "المكمل الغذائي",
    en: "Supplement",
  ),
  image: '',
  doses: [
    SupplementDosesModel(dose: 1, times: S.of(contextGlobal).morning),
    SupplementDosesModel(dose: 1, times: S.of(contextGlobal).evening),
  ],
);
