import 'package:flutter/material.dart';
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
      theme: ThemeData(
        textTheme: const TextTheme(
          bodySmall: TextStyle( fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
            const Text(
              "Titulo",
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Texto com sublinhado",
              style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Texto com sublinhado",
              style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            Row(children: [
              Button(
                onPressed: () => (),
                text: "Botão com borda",
                border: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Button(
                onPressed: () => (),
                text: "Botão com cor de fundo",
                bg: Colors.pinkAccent,
              ),
              const SizedBox(
                width: 20,
              ),
              Button(
                onPressed: () => (),
                text: "Botão com icone",
                icon: Icons.smart_button,
              ),
            ]),
          ],
        ));
  }
}
