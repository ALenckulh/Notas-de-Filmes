import 'package:flutter/material.dart';
import 'package:notas/data/avaliacoes.dart';
import 'package:notas/pages/view_movie.dart';
import 'package:notas/themes/custom_themes.dart';
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
        '/movie': (context) => ViewMovie(ModalRoute.of(context)!.settings.arguments as String),
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
  late Set<String> categorias;


  @override
  void initState() {
    super.initState();
    getCategorias(); // Chame a função para obter as categorias
  }
  void getCategorias() {
    List<Map<String, dynamic>> avaliacoes = carregarAvaliacoes();
    categorias = avaliacoes.map((avaliacao) => avaliacao['genero'].toString()).toSet();
  }



  // Método para buscar filme por genero
  List<Map<String, dynamic>> buscarFilmesPorGenero(String genero) {
    List<Map<String, dynamic>> avaliacoes = carregarAvaliacoes();
    return avaliacoes.where((filme) => filme['genero'] == genero).toList();
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> filmes = buscarFilmesPorGenero("Fantasia");

    getCategorias();

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
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: CarouselView(
                        onTap: (index) {
                          Navigator.pushNamed(context, '/movie', arguments: '1');
                          },
                        itemExtent: 250,
                        itemSnapping: true,
                        children: filmes.map<Widget>((filme) {
                          return Image.asset(
                            filme['img'][0], // Exibe a imagem de cada filme
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
