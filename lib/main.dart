import 'package:flutter/material.dart';
import 'package:notas/data/avaliacoes.dart';
import 'package:notas/pages/view_movie.dart';
import 'package:notas/themes/custom_themes.dart';
import 'package:notas/widget/button.dart';
import 'package:notas/widget/header.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Método para buscar filme por genero
  List<Map<String, dynamic>> buscarFilmesPorGenero(String genero) {
    List<Map<String, dynamic>> avaliacoes = carregarAvaliacoes();
    return avaliacoes.where((filme) => filme['genero'] == genero).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filmes = buscarFilmesPorGenero("Fantasia");

    List imagens = filmes.map((filme) => filme['img'][0]).toList();

    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Button(
                      onPressed: () {
                        Navigator.pushNamed(context, '/movie');
                      },
                      text: "Filme 1",
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: CarouselView(
                        itemExtent: 250,
                        itemSnapping: true,
                          children: imagens.map<Widget>((image) {
                            return Image.asset(
                              image, // Exibe a imagem de cada filme
                              fit: BoxFit.cover,
                            );
                          }).toList(),// Convert to a list of widgets
                      ),
                    ), // CarouselView
                  ],
                )
        ),
      ),
    );
  }
}
