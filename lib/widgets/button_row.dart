import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_button.dart';

class CalculatorButtonRow extends StatelessWidget {
  final List<String> labels;
  final bool isTopRow;
  final bool isLastRow;
  final void Function(String)? onPressed;
  final double? scale;

  const CalculatorButtonRow(
    this.labels, {
    super.key,
    this.isTopRow = false,
    this.isLastRow = false,
    this.onPressed,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    if (isLastRow) {
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: CalculatorButton(
              label: labels[0],
              isNumber: true,
              onPressed: () => onPressed?.call(labels[0]),
              scale: scale,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: CalculatorButton(
              label: labels[1],
              isNumber: true,
              onPressed: () => onPressed?.call(labels[1]),
              scale: scale,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: CalculatorButton(
              label: labels[2],
              isAction: true,
              onPressed: () => onPressed?.call(labels[2]),
              scale: scale,
            ),
          ),
        ],
      );
    }

    return Row(
      children: labels.map((text) {
        final isOperator = ['÷', '×', '-', '+'].contains(text);
        final isAction = ['C', '±', '%'].contains(text);

        return Expanded(
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CalculatorButton(
              label: text,
              isTopRow: isTopRow,
              isOperator: isOperator,
              isAction: isAction,
              isNumber: !(isOperator || isAction),
              onPressed: () => onPressed?.call(text),
              scale: scale,
            ),
          ),
        );
      }).toList(),
    );
  }
}
