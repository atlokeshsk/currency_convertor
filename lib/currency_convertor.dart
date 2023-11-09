import 'package:flutter/material.dart';

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  final _textEditingController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
          color: colorScheme.outline,
          width: 2,
          strokeAlign: BorderSide.strokeAlignCenter),
    );

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Currency Convertor',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: colorScheme.primaryContainer),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primaryContainer),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onPrimaryContainer),
                decoration: InputDecoration(
                  hintText: 'Enter The Amount',
                  hintStyle: TextStyle(color: colorScheme.onPrimaryContainer),
                  filled: true,
                  fillColor: colorScheme.primaryContainer,
                  prefixIcon: const Icon(
                    Icons.monetization_on,
                  ),
                  prefixIconColor: colorScheme.onPrimaryContainer,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme.inverseSurface,
                  foregroundColor: colorScheme.onInverseSurface,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                onPressed: () {
                  setState(() {
                    result = double.parse(_textEditingController.text) * 81;
                  });
                },
                child: const Text('Convert To INR'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
