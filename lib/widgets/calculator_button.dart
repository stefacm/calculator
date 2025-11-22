import 'package:flutter/material.dart';
import 'package:calculator/theme/app_theme.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isTopRow;
  final bool isOperator;
  final bool isAction;
  final bool isNumber;
  final VoidCallback? onPressed;

  const CalculatorButton({
    super.key,
    required this.label,
    this.isTopRow = false,
    this.isOperator = false,
    this.isAction = false,
    this.isNumber = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Color background = isTopRow || isAction
        ? AppColors.topRowBg
        : (isOperator ? AppColors.operatorBg : AppColors.numberBg);

    final Color textColor = isTopRow || isAction
        ? AppColors.actionText
        : (isOperator ? Colors.black : AppTextStyles.button.color ?? Colors.white);

    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 2,
        ),
        child: Text(label, style: AppTextStyles.button.copyWith(color: textColor)),
      ),
    );
  }
}
