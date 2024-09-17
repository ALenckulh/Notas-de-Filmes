import 'package:flutter/material.dart';
import 'package:notas/pages/view_movie.dart';
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
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(
              title: "Visualização de filmes",
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/movie': (context) => const ViewMovie(),
      },
      theme: ThemeData(
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontWeight: FontWeight.bold),
          titleSmall:
              TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Button(
            onPressed: () {
              Navigator.pushNamed(context, '/movie');
            },
            text: "filme 1")
      ],
    ));
  }
}
