import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  void onClicked() {
    setState(() {
      counter++;
    });
  }

  List<int> numbers = [];
  void printNumbers() {
    setState(() {
      numbers.add(numbers.length + 1);
    });
  }

  void reset() {
    setState(() {
      counter = 0;
      numbers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                (numbers.isEmpty) ? '' : '$numbers',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              // for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: printNumbers,
                icon: const Icon(Icons.add_box_rounded),
              ),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                iconSize: 40,
                onPressed: reset,
                icon: const Icon(Icons.restore),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
