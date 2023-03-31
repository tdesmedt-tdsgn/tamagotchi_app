import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tamagotchi_app/tamagotchi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tamagotchi_app/auth_page.dart';
import 'package:tamagotchi_app/firebase_auth_service.dart';
import 'package:tamagotchi_app/tamagotchi_storage.dart';
import 'package:tamagotchi_app/trait_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService authService = FirebaseAuthService();
    return MaterialApp(
      title: 'Tamagotchi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: authService.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return TamagotchiHomePage();
          } else {
            return AuthPage(authService: authService);
          }
        },
      ),
    );
  }
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

/* class _TamagotchiHomePageState extends State<TamagotchiHomePage> {
  final TamagotchiStorage tamagotchiStorage = TamagotchiStorage();
  bool showTraitSelector = false;
  late Tamagotchi tamagotchi;
  int _tamagotchiArtIndex = 0;

  // Add these lines to store the values of hunger, happiness, and cleanliness
  int _selectedHunger = 0;
  int _selectedHappiness = 0;
  int _selectedCleanliness = 0;

  List<String> _tamagotchiArt = [
    '''
   _____
  /     \\
 /       \\
|  O   O  |
|    >    | 
 \\  ---  /
  -------
  ''',
    '''
   _____
  /     \\
 /       \\
|  O   O  |
|    <    | 
 \\  ---  /
  -------
  ''',
    '''
   _____
  /     \\
 /       \\
|  o   o  |
|    >    | 
 \\  ---  /
  -------
  ''',
    // Add more variations here
  ];

  @override
  void initState() {
    super.initState();
    _loadTamagotchi();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTamagotchiArt();
    });
  }

  Future<void> _loadTamagotchi() async {
    Tamagotchi? loadedTamagotchi = await tamagotchiStorage.loadTamagotchi();
    if (loadedTamagotchi != null) {
      setState(() {
        tamagotchi = loadedTamagotchi;
      });
    } else {
      setState(() {
        showTraitSelector = true;
      });
    }
  }

  void _createTamagotchi(int hunger, int happiness, int cleanliness) {
    setState(() {
      tamagotchi = Tamagotchi(
          hunger: hunger, happiness: happiness, cleanliness: cleanliness);
      showTraitSelector = false;
    });
    tamagotchiStorage.saveTamagotchi(tamagotchi);
  }

  void _updateTamagotchiArt() {
    setState(() {
      _tamagotchiArtIndex = (_tamagotchiArtIndex + 1) % _tamagotchiArt.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tamagotchi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: showTraitSelector
              ? [
                  TraitSelector(
                    traitName: 'Hunger',
                    onTraitSelected: (value) => _selectedHunger = value,
                  ),
                  TraitSelector(
                    traitName: 'Happiness',
                    onTraitSelected: (value) => _selectedHappiness = value,
                  ),
                  TraitSelector(
                    traitName: 'Cleanliness',
                    onTraitSelected: (value) => _selectedCleanliness = value,
                  ),
                  ElevatedButton(
                    onPressed: () => _createTamagotchi(_selectedHunger,
                        _selectedHappiness, _selectedCleanliness),
                    child: const Text('Create Tamagotchi'),
                  ),
                ]
              : [
                  Text(
                    _tamagotchiArt[_tamagotchiArtIndex],
                    style: TextStyle(fontFamily: 'Courier', fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Hunger: ${tamagotchi.hunger}',
                  ),
                  Text(
                    'Happiness: ${tamagotchi.happiness}',
                  ),
                  Text(
                    'Cleanliness: ${tamagotchi.cleanliness}',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          tamagotchi.feed();
                          tamagotchiStorage.saveTamagotchi(tamagotchi);
                          setState(() {});
                        },
                        child: const Text('Feed'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          tamagotchi.play();
                          tamagotchiStorage.saveTamagotchi(tamagotchi);
                          setState(() {});
                        },
                        child: const Text('Play'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          tamagotchi.clean();
                          tamagotchiStorage.saveTamagotchi(tamagotchi);
                          setState(() {});
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
 */

class _TamagotchiHomePageState extends State<TamagotchiHomePage> {
  final TamagotchiStorage tamagotchiStorage = TamagotchiStorage();
  late Tamagotchi tamagotchi;
  int _tamagotchiArtIndex = 0;

  List<String> _tamagotchiArt = [
    '''
   _____
  /     \\
 /       \\
|  O   O  |
|    >    | 
 \\  ---  /
  -------
  ''',
    '''
   _____
  /     \\
 /       \\
|  O   O  |
|    <    | 
 \\  ---  /
  -------
  ''',
    '''
   _____
  /     \\
 /       \\
|  o   o  |
|    >    | 
 \\  ---  /
  -------
  ''',
    // Add more variations here
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      _loadTamagotchi(prefs);
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTamagotchiArt();
    });
    Timer.periodic(const Duration(seconds: 10), (timer) {
      _updateTamagotchiStats();
    });
  }

  void _loadTamagotchi(SharedPreferences prefs) {
    Tamagotchi? loadedTamagotchi = tamagotchiStorage.loadTamagotchi(prefs);
    if (loadedTamagotchi != null) {
      setState(() {
        tamagotchi = loadedTamagotchi;
      });
    } else {
      _createTamagotchi();
    }
  }

  void _createTamagotchi() {
    setState(() {
      tamagotchi = Tamagotchi(hunger: 50, happiness: 50, cleanliness: 50);
    });
    tamagotchiStorage.saveTamagotchi(tamagotchi);
  }

  void _updateTamagotchiArt() {
    setState(() {
      _tamagotchiArtIndex = (_tamagotchiArtIndex + 1) % _tamagotchiArt.length;
    });
  }

  void _updateTamagotchiStats() {
    tamagotchi.updateStats();
    setState(() {});
    tamagotchiStorage.saveTamagotchi(tamagotchi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tamagotchi'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _tamagotchiArt[_tamagotchiArtIndex],
                style: TextStyle(fontFamily: 'Courier', fontSize: 14),
              ),
              const SizedBox(height: 20),
              Text(
                'Hunger: ${tamagotchi.hunger}',
              ),
              Text(
                'Happiness: ${tamagotchi.happiness}',
              ),
              Text(
                'Cleanliness: ${tamagotchi.cleanliness}',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      tamagotchi.feed();
                      tamagotchiStorage.saveTamagotchi(tamagotchi);
                      setState(() {});
                    },
                    child: const Text('Feed'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      tamagotchi.play();
                      tamagotchiStorage.saveTamagotchi(tamagotchi);
                      setState(() {});
                    },
                    child: const Text('Play'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      tamagotchi.clean();
                      tamagotchiStorage.saveTamagotchi(tamagotchi);
                      setState(() {});
                    },
                    child: const Text('Clean'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
