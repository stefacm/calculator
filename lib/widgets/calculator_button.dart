import 'package:flutter/material.dart';

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
    Color background;
    Color textColor = Colors.white;

    if (isTopRow || isAction) {
      background = const Color(0xFF2C2C2C);
      textColor = Colors.orangeAccent;
    } else if (isOperator) {
      background = Colors.orangeAccent;
      textColor = Colors.black;
    } else if (isNumber) {
      background = const Color(0xFF1E1E1E);
    } else {
      background = const Color(0xFF2C2C2C);
    }

    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 2,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
