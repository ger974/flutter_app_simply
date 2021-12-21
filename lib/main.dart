// main.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

//déclaration de couleur
const dGreen = Color(0xFF2ac0a6);
const dWhite = Colors.white;
const dBlack = Colors.black;
const d_red = Color(0xFFE9717D);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'SimplyLife',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const HomePage(),
      getPages: [
        GetPage(name: '/page-three', page: () => const PageThree()),
        GetPage(
            name: '/page-four/:data',
            page: () => const PageFour()) // Dynamic route
      ],
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var container = Container(
      width: 320,
      height: 320,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade800,
                Colors.yellow.shade600,
              ])),
      child: Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: const Text('SimplyLife'),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimplyLife'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text('Navigate ising screen classes'),
            ElevatedButton(
                onPressed: () => Get.to(const PageOne(), arguments: {
                      // 'id': Random().nextInt(5).toString()
                    }), // Passing data by using "arguments"
                child: const Text('Go to page One')),
            ElevatedButton(
                onPressed: () => Get.off(const PageTwo()),
                child: const Text('Go to page Two (Can not go back)')),
            const Divider(),
            // const Text('Navigate Using named routes'),
            OutlinedButton(
                onPressed: () => Get.toNamed('/page-three',
                    arguments: {'id': Random().nextInt(10000).toString()}),
                child: const Text('Aller à la page musique')),
            OutlinedButton(
                onPressed: () => Get.toNamed(
                      '/page-four/${Random().nextInt(10000)}',
                    ),
                child: const Text('Aller à la page vidéo'))
          ],
        ),
      ),
    );
  }
}

// Page One
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: Text(
          Get.arguments['id'] ?? 'Page One',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.off(HomePage()),
          child: const Text('Retour accueil'),
        ),
      ),
    );
  }
}

// Page Three
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musique'),
      ),
      body: Center(
        child: Text(
          Get.arguments['id'] ?? 'Musique-player',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// Page Four
class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vidéos'),
      ),
      body: Center(
        child: Text(
          Get.parameters['data'] ?? 'Vidéo-player',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
