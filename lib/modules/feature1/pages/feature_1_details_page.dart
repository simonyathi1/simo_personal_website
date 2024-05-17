import 'package:flutter/material.dart';

import '../models/data_models/berry.dart';

class Feature1DetailPage extends StatelessWidget {
  final Berry berry;
  const Feature1DetailPage({Key? key, required this.berry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Berry')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.network(
                    berry.spriteUrl,
                    scale: 0.5,
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(
                  '${berry.name.toUpperCase()} (#${berry.id})',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(berry.effect,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}