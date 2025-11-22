import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_display.dart';
import 'package:calculator/widgets/button_row.dart';
import 'package:calculator/theme/app_theme.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(builder: (context, constraints) {
            const baseWidth = 360.0;
            const baseHeight = 800.0;
            final widthScale = constraints.maxWidth / baseWidth;
            final heightScale = constraints.maxHeight / baseHeight;
            final scale = (widthScale < heightScale ? widthScale : heightScale).clamp(0.7, 1.0);

            return Column(
              children: [
                // Título / encabezado
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Calculadora', style: AppTextStyles.title.copyWith(fontSize: (AppTextStyles.title.fontSize ?? 22) * scale)),
                    const Icon(Icons.more_vert),
                  ],
                ),
                SizedBox(height: 24 * scale),

                // Pantalla de resultado
                Expanded(
                  flex: 2,
                  child: CalculatorDisplay(
                    expression: '12 + 7',
                    result: '19',
                    scale: scale,
                  ),
                ),
                SizedBox(height: 24 * scale),

                // Botones
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        CalculatorButtonRow(['C', '±', '%', '÷'], isTopRow: true, scale: scale),
                        SizedBox(height: 12 * scale),
                        CalculatorButtonRow(['7', '8', '9', '×'], scale: scale),
                        SizedBox(height: 12 * scale),
                        CalculatorButtonRow(['4', '5', '6', '-'], scale: scale),
                        SizedBox(height: 12 * scale),
                        CalculatorButtonRow(['1', '2', '3', '+'], scale: scale),
                        SizedBox(height: 12 * scale),
                        CalculatorButtonRow(['0', ',', '='], isLastRow: true, scale: scale),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

