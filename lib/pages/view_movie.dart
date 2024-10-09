import 'package:flutter/material.dart';
import 'package:notas/data/avaliacoes.dart';
import 'package:notas/themes/colors.dart';
import 'package:notas/widget/header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewMovie extends StatefulWidget {
  final String movieId;

  const ViewMovie(this.movieId, {super.key});

  @override
  ViewMovieState createState() => ViewMovieState();
}

class ViewMovieState extends State<ViewMovie> {
  late List<String> comentarios = [];
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  // Método para buscar filme por ID
  Map<String, dynamic>? buscarFilmePorId(String id) {
    List<Map<String, dynamic>> avaliacoes = carregarAvaliacoes();
    return avaliacoes.firstWhere((filme) => filme['id'] == id);
  }

  // Carregar comentários do local storage
  Future<void> _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedComments =
        prefs.getStringList('comentarios_${widget.movieId}');
    setState(() {
      comentarios = savedComments ?? [];
    });
  }

  // Salvar comentários no local storage
  Future<void> _saveComment(String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      comentarios.add(comment);
    });
    await prefs.setStringList('comentarios_${widget.movieId}', comentarios);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? filme = buscarFilmePorId(widget.movieId);

    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: filme != null // Verifica se filme não é nulo
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: CarouselView(
                        itemExtent: 250,
                        itemSnapping: true,
                        children: filme['img'].map<Widget>((image) {
                          return Image.asset(
                            image, // Use the image from the movie data
                            fit: BoxFit.cover,
                          );
                        }).toList(), // Convert to a list of widgets
                      ),
                    ), // CarouselView
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filme['titulo'], // Fornece um valor padrão
                            style: Theme.of(context)
                                .primaryTextTheme
                                .titleLarge
                                ?.copyWith(
                                  color: MyColors.primary100,
                                ),
                            textAlign: TextAlign.start,
                          ), // Título do filme
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              ..._buildStarRating(filme['nota']),
                              const SizedBox(width: 12),
                              Text(
                                filme['nota']
                                    .toString(), // Use the sinopse from the movie data
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: MyColors.neutral100,
                                    ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ), // Avaliação do filme
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Gênero:", // Use the sinopse from the movie data
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: MyColors.neutral50,
                                    ),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                filme[
                                    'genero'], // Use the sinopse from the movie data
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: MyColors.neutral100,
                                      fontWeight: FontWeight.w600,
                                    ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ), // Gênero do filme
                          const SizedBox(height: 8),
                          Text(
                            filme[
                                'descricao'], // Use the sinopse from the movie data
                            style: Theme.of(context)
                                .primaryTextTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: MyColors.neutral100,
                                  fontWeight: FontWeight.w500,
                                ),
                            textAlign: TextAlign.justify,
                          ), // Sinopse do filme
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: MyColors.neutral,
                      thickness: 1,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.comment,
                          color: MyColors.neutral,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Comentários:", // Use the sinopse from the movie data
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyLarge
                              ?.copyWith(
                                color: MyColors.primary100,
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ), // Título dos comentários
                    const SizedBox(height: 12),
                    ..._buildComments(
                        List<String>.from(filme['comentarios']) + comentarios,
                        context),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: "Adicione um comentário...",
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            if (_commentController.text.isNotEmpty) {
                              _saveComment(_commentController.text);
                              _commentController.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  'Filme não encontrado.',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
        ),
      ),
    );
  }

  // Method to build star rating
  List<Widget> _buildStarRating(double rating) {
    List<Widget> stars = [];

    // Calculate the number of full, half, and empty stars
    int fullStars = rating.floor(); // Full stars
    bool hasHalfStar =
        (rating - fullStars) >= 0.25; // Check if there's a half star
    int emptyStars =
        5 - fullStars - (hasHalfStar ? 1 : 0); // Remaining empty stars

    // Add full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.amber)); // Full star icon
    }

    // Add half star if applicable
    if (hasHalfStar) {
      stars.add(
          const Icon(Icons.star_half, color: Colors.amber)); // Half star icon
    }

    // Add empty stars
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_outline,
          color: MyColors.neutral)); // Empty star icon
    }

    return stars; // Return the list of star icons
  }

  // Método para construir a lista de comentários
  List<Widget> _buildComments(List<String> comentarios, BuildContext context) {
    if (comentarios.isEmpty) {
      return [const Text("Nenhum comentário disponível.")];
    }

    return comentarios.map<Widget>((comentario) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: MyColors.neutral20,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  color: MyColors.neutral,
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: Text(
                    comentario,
                    style:
                        Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                              color: MyColors.neutral150,
                              fontWeight: FontWeight.w500,
                            ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
