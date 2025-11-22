import 'package:flutter/material.dart';
import 'package:calculator/widgets/styles.dart';

class CalculatorDisplay extends StatelessWidget {
  final String expression;
  final String result;

  const CalculatorDisplay({
    super.key,
    this.expression = '',
    this.result = '0',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CalcStyles.displayBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(expression, style: CalcStyles.expression),
          Text(result, style: CalcStyles.result),
        ],
      ),
    );
  }
}
