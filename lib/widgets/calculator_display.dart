import 'package:flutter/material.dart';
import 'package:calculator/theme/app_theme.dart';

class CalculatorDisplay extends StatelessWidget {
  final String expression;
  final String result;
  final double? scale;

  const CalculatorDisplay({
    super.key,
    this.expression = '',
    this.result = '0',
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    final double p = 16 * (scale ?? 1.0);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(p),
      decoration: BoxDecoration(
        color: AppColors.displayBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              expression,
              softWrap: false,
              maxLines: 1,
              style: AppTextStyles.expression.copyWith(
                fontSize: (AppTextStyles.expression.fontSize ?? 24) * (scale ?? 1.0),
              ),
            ),
          ),
          SizedBox(
            height: (AppTextStyles.result.fontSize ?? 48) * (scale ?? 1.0) * 1.2,
            child: FittedBox(
              alignment: Alignment.centerRight,
              fit: BoxFit.scaleDown,
              child: Text(
                result,
                maxLines: 1,
                softWrap: false,
                style: AppTextStyles.result.copyWith(
                  fontSize: (AppTextStyles.result.fontSize ?? 48) * (scale ?? 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
