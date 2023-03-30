import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tamagotchi_app/tamagotchi.dart';

void main() {
  runApp(const TamagotchiApp());
}

class TamagotchiApp extends StatelessWidget {
  const TamagotchiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tamagotchi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TamagotchiHomePage(),
    );
  }
}

class TamagotchiHomePage extends StatefulWidget {
  const TamagotchiHomePage({Key? key}) : super(key: key);

  @override
  _TamagotchiHomePageState createState() => _TamagotchiHomePageState();
}

class _TamagotchiHomePageState extends State<TamagotchiHomePage> {
  final Tamagotchi tamagotchi =
      Tamagotchi(hunger: 50, happiness: 50, cleanliness: 50);

  @override
  void initState() {
    super.initState();
    startTamagotchiLifeCycle();
  }

  void startTamagotchiLifeCycle() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        tamagotchi.decreaseStats();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamagotchi App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add the Tamagotchi pet image here.
            const Text(
              '''
   _____
  /     \\
 /       \\
|  O   O  |
|    >    | 
 \\  ---  /
  -------
  ''',
              style: TextStyle(fontFamily: 'Courier', fontSize: 14),
            ),

            const SizedBox(height: 20),

            // Add the status information (e.g., hunger, happiness) here.
            Text('Hunger: ${tamagotchi.hunger}'),
            Text('Happiness: ${tamagotchi.happiness}'),
            Text('Cleanliness: ${tamagotchi.cleanliness}'),

            const SizedBox(height: 20),

            // Add the action buttons here (e.g., feed, play, clean).
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tamagotchi.feed();
                    });
                  },
                  child: const Text('Feed'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tamagotchi.play();
                    });
                  },
                  child: const Text('Play'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tamagotchi.clean();
                    });
                  },
                  child: const Text('Clean'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
