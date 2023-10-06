import 'package:flutter/material.dart';
import 'dart:math';

class AppView extends StatefulWidget {
  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int selectedNumber = 1;
  List<int> randomNumbers = [];
  int result = 0;

  void generateRandomNumbers() {
    Random random = Random();
    randomNumbers.clear();

    for (int i = 0; i < selectedNumber; i++) {
      randomNumbers.add(random.nextInt(100));
    }

    setState(() {});
  }

  void _firstVariant() {
    int smallest = randomNumbers
        .reduce((current, next) => current < next ? current : next);
    result = smallest;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You can choose the length of array',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 150,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                int number = index + 1;
                return TextButton(
                  onPressed: () {
                    setState(() {
                      selectedNumber = number;
                    });
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          );
                        }
                        return const TextStyle(
                          fontStyle: FontStyle.normal,
                        );
                      },
                    ),
                  ),
                  child: Text('$number'),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: generateRandomNumbers,
            child: const Text(
              'Generated',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'The array:',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            randomNumbers.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _firstVariant,
            child: const Text(
              'Find the smallest item',
            ),
          ),
          Text(
            result.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
