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

  bool showTitle = true;
  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.deepPurple,
            decorationColor: Colors.blueGrey,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle
                  ? const LargeTitle(title: 'Click Count')
                  : const Text(
                      'nothing',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blueAccent,
                      ),
                    ),
              Text(
                (counter == 0) ? '' : '$counter',
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
                'generate number',
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
              const SizedBox(
                height: 30,
              ),
              IconButton(
                iconSize: 40,
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LargeTitle extends StatefulWidget {
  final String title;

  const LargeTitle({
    super.key,
    required this.title,
  });

  @override
  State<LargeTitle> createState() => _LargeTitleState();
}

class _LargeTitleState extends State<LargeTitle> {
  @override
  void initState() {
    super.initState();

    print('initState!');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');

    return Text(
      widget.title,
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
