import 'package:flutter/material.dart';
import 'package:notas/pages/view_movie.dart';
import 'package:notas/themes/custom_themes.dart';
import 'package:notas/widget/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/movie': (context) => const ViewMovie(),
      },
      theme: CustomThemes().defaultTheme,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              onPressed: () {
                Navigator.pushNamed(context, '/movie');
              },
              text: "Filme 1",
            ),
          ],
        ),
      ),
    );
  }
}
