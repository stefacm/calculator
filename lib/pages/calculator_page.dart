import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_display.dart';
import 'package:calculator/widgets/button_row.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Título / encabezado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Calculadora',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              const SizedBox(height: 24),

              // Pantalla de resultado
              const Expanded(
                flex: 2,
                child: CalculatorDisplay(
                  expression: '12 + 7',
                  result: '19',
                ),
              ),
              const SizedBox(height: 24),

              // Botones
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const CalculatorButtonRow(['C', '±', '%', '÷'], isTopRow: true),
                    const SizedBox(height: 12),
                    const CalculatorButtonRow(['7', '8', '9', '×']),
                    const SizedBox(height: 12),
                    const CalculatorButtonRow(['4', '5', '6', '-']),
                    const SizedBox(height: 12),
                    const CalculatorButtonRow(['1', '2', '3', '+']),
                    const SizedBox(height: 12),
                    const CalculatorButtonRow(['0', ',', '='], isLastRow: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

