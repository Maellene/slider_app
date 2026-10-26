import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PricePage(),
    );
  }
}

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  double price = 5000;

  final List<Map<String, dynamic>> products = [
    {'name': 'Cap', 'price': 5000},
    {'name': 'Dress', 'price': 7000},
    {'name': 'T-Shirt', 'price': 10000},
  ];

  @override
  Widget build(BuildContext context) {
    final availableProducts = products
        .where((product) => product['price'] <= price)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Maximum price: ${price.toInt()} RWF',
            style: const TextStyle(fontSize: 20),
          ),
          Slider(
            value: price,
            min: 0,
            max: 20000,
            divisions: 20,
            onChanged: (value) {
              setState(() {
                price = value;
              });
            },
          ),
          const SizedBox(height: 20),
          ...availableProducts.map(
            (product) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${product['name']} - ${product['price']} RWF',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}