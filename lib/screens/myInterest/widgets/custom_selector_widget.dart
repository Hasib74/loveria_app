import 'package:flutter/material.dart';
import 'package:loveria/screens/myInterest/widgets/multi_selected_field.dart';

import 'custom_age_ranger_widget.dart';

enum CustomSelectorType { range, single, multiple }

class CustomSelectorWidget extends StatelessWidget {
  String? label;
  CustomSelectorType? type;
  Function(RangeValues range)? onSelectedAge;
  Function(List<String> multiSelectedValue)? onSelectedMultiple;

  List<String>? values = [];

  CustomSelectorWidget(
      {super.key,
      this.label,
      this.type,
      this.onSelectedAge,
      this.values,
      this.onSelectedMultiple});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _view(),
      ],
    );
  }

  _view() {
    switch (type) {
      case CustomSelectorType.range:
        return AppRangeSlider(
            label: label ?? "",
            minAge: 20,
            maxAge: 140,
            onChanged: (value) {
              onSelectedAge?.call(value);
            },
            ageRange: const RangeValues(20, 140));
      case CustomSelectorType.single:
        return Container();
      case CustomSelectorType.multiple:
        return AppMultiSelectField<String>(
          menus: const [
            "Slim",
            "Average",
            "Athletic",
            "A few extra pounds",
            "Curvy",
            "Heavyset",
            "Stocky",
            "A little extra",
            "Full-figured",
            "Jacked",
            "Overweight",
            "Thin",
            "Fit",
            "Skinny",
            "Obese",
            "Muscular",
            "Ripped",
            "Solid",
            "Toned",
            "Unspecified"
          ],
          onSelectedMultiple: (value) {
            onSelectedMultiple?.call(value);
          },
          title: label ?? "",
        );
      default:
        return Container();
    }
  }
}
