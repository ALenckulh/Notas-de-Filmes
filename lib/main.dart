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
        '/': (context) => const MyHomePage(),
        '/movie': (context) => const ViewMovie(),
      },
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFF5C65C0), // #301c41
          secondary: Color(0xFF413B6B), // #5c65c0
          surface: Colors.white70,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
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
