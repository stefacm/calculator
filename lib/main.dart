import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF1E1E1E),
      ),
      home: const CalculatorPage(),
    );
  }
}

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
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        '12 + 7',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '19',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Botones
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    _buildButtonRow(['C', '±', '%', '÷'], isTopRow: true),
                    const SizedBox(height: 12),
                    _buildButtonRow(['7', '8', '9', '×']),
                    const SizedBox(height: 12),
                    _buildButtonRow(['4', '5', '6', '-']),
                    const SizedBox(height: 12),
                    _buildButtonRow(['1', '2', '3', '+']),
                    const SizedBox(height: 12),
                    _buildButtonRow(['0', ',', '='], isLastRow: true),
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

Widget _buildButtonRow(
  List<String> labels, {
  bool isTopRow = false,
  bool isLastRow = false,
}) {
  if (isLastRow) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _CalculatorButton(
            label: labels[0],
            isNumber: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: _CalculatorButton(
            label: labels[1],
            isNumber: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: _CalculatorButton(
            label: labels[2],
            isAction: true,
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
          child: _CalculatorButton(
            label: text,
            isTopRow: isTopRow,
            isOperator: isOperator,
            isAction: isAction,
            isNumber: !(isOperator || isAction),
          ),
        ),
      );
    }).toList(),
  );
}

class _CalculatorButton extends StatelessWidget {
  final String label;
  final bool isTopRow;
  final bool isOperator;
  final bool isAction;
  final bool isNumber;

  const _CalculatorButton({
    required this.label,
    this.isTopRow = false,
    this.isOperator = false,
    this.isAction = false,
    this.isNumber = false
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
        onPressed: () {}, // solo visual
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
