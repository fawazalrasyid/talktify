import 'package:flutter/material.dart';
import 'package:talktify/app/core/values/app_colors.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            onChanged(newValue);
          },
        ),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSubtitleColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
