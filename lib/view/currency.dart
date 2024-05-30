import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  double riyalToRupiah = 4278.89;
  double dollarToRupiah = 16045;
  double euroToRupiah = 17406.42;

  String selectedCurrency = 'Riyal';
  String conversionDirection = 'to Rupiah';
  double inputAmount = 0.0;
  double convertedAmount = 0.0;

  @override
  void initState() {
    super.initState();
    convertCurrency();
  }

  void convertCurrency() {
    setState(() {
      if (conversionDirection == 'to Rupiah') {
        switch (selectedCurrency) {
          case 'Riyal':
            convertedAmount = inputAmount * riyalToRupiah;
            break;
          case 'Dollar':
            convertedAmount = inputAmount * dollarToRupiah;
            break;
          case 'Euro':
            convertedAmount = inputAmount * euroToRupiah;
            break;
        }
      } else {
        switch (selectedCurrency) {
          case 'Riyal':
            convertedAmount = inputAmount / riyalToRupiah;
            break;
          case 'Dollar':
            convertedAmount = inputAmount / dollarToRupiah;
            break;
          case 'Euro':
            convertedAmount = inputAmount / euroToRupiah;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exchange Rates'),
        backgroundColor: const Color(0xFF1B1A55),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),
              onChanged: (value) {
                setState(() {
                  inputAmount = double.tryParse(value) ?? 0.0;
                  convertCurrency();
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurrency = newValue!;
                  convertCurrency();
                });
              },
              items: ['Riyal', 'Dollar', 'Euro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: conversionDirection,
              onChanged: (String? newValue) {
                setState(() {
                  conversionDirection = newValue!;
                  convertCurrency();
                });
              },
              items: ['to Rupiah', 'from Rupiah']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Converted Amount:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10.0),
            Text(
              conversionDirection == 'to Rupiah'
                  ? NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                      .format(convertedAmount)
                  : NumberFormat.currency(
                          locale: 'en_US',
                          symbol: selectedCurrency == 'Riyal'
                              ? '﷼'
                              : selectedCurrency == 'Dollar'
                                  ? '\$'
                                  : '€')
                      .format(convertedAmount),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
