import 'dart:convert'; // Para converter o JSON

List<Map<String, dynamic>> carregarAvaliacoes() {
  String jsonData = '''
    {
  "avaliacoes": [
    {
      "id": "1",
      "titulo": "Aventura Épica",
      "nota": 4.5,
      "qntAvaliacao": 200,
      "descricao": "Uma aventura épica em um mundo de fantasia.",
      "comentarios": [
        "Incrível! A trama é envolvente.",
        "Os efeitos especiais são impressionantes."
      ],
      "img": [
        "mountain.png",
        "viajantes.png",
        "traveling.png"
      ],
      "genero": "Fantasia"
    },
    {
      "id": "2",
      "titulo": "Comédia Romântica",
      "nota": 3.8,
      "qntAvaliacao": 150,
      "descricao": "Uma comédia romântica leve e divertida.",
      "comentarios": [
        "Uma boa escolha para uma noite descontraída.",
        "Os personagens são cativantes."
      ],
      "img": [
        "avatar.png"
      ],
      "genero": "Fantasia"
    },
    {
      "id": "3",
      "titulo": "Thriller Psicológico",
      "nota": 4.2,
      "qntAvaliacao": 300,
      "descricao": "Um thriller psicológico cheio de reviravoltas.",
      "comentarios": [
        "Tive que rever algumas partes para entender tudo!",
        "Uma experiência realmente intensa."
      ],
      "img": [
        "batman.png"
      ],
      "genero": "Ação"
    },
    {
      "id": "4",
      "titulo": "Clássico Imperdível",
      "nota": 5.0,
      "qntAvaliacao": 500,
      "descricao": "Um clássico imperdível que definiu uma geração.",
      "comentarios": [
        "Simplesmente perfeito!",
        "A trilha sonora é inesquecível."
      ],
      "img": [
        "chocolate.png"
      ],
      "genero": "Fantasia"
    },
    {
      "id": "5",
      "titulo": "Animação Encantadora",
      "nota": 3.5,
      "qntAvaliacao": 100,
      "descricao": "Uma animação encantadora para todas as idades.",
      "comentarios": [
        "As cores são vibrantes e alegres.",
        "Ótima para crianças e adultos."
      ],
      "img": [
        "moana.png"
      ],
      "genero": "Animação"
    },
    {
      "id": "6",
      "titulo": "Aventura Intergaláctica",
      "nota": 4.3,
      "qntAvaliacao": 220,
      "descricao": "Uma jornada intergaláctica cheia de aventura.",
      "comentarios": [
        "Efeitos visuais impressionantes!",
        "Uma história bem elaborada."
      ],
      "img": [
        "https://images.pexels.com/photos/2502081/pexels-photo-2502081.jpeg",
        "https://images.pexels.com/photos/2605500/pexels-photo-2605500.jpeg"
      ],
      "genero": "Ficção Científica"
    },
    {
      "id": "7",
      "titulo": "Romance Dramático",
      "nota": 3.6,
      "qntAvaliacao": 90,
      "descricao": "Uma narrativa romântica com nuances dramáticas.",
      "comentarios": [
        "Os personagens são muito carismáticos.",
        "Uma boa história para refletir."
      ],
      "img": [
        "https://images.pexels.com/photos/5560064/pexels-photo-5560064.jpeg",
        "https://images.pexels.com/photos/9613329/pexels-photo-9613329.jpeg"
      ],
      "genero": "Romance"
    },
    {
      "id": "8",
      "titulo": "Animação com Mensagem",
      "nota": 4.6,
      "qntAvaliacao": 400,
      "descricao": "Uma animação com uma mensagem poderosa.",
      "comentarios": [
        "Os gráficos são são belos!",
        "Uma verdadeira obra-prima."
      ],
      "img": [
        "https://images.pexels.com/photos/5650244/pexels-photo-5650244.jpeg",
        "https://images.pexels.com/photos/1156492/pexels-photo-1156492.jpeg"
      ],
      "genero": "Animação"
    },
    {
      "id": "9",
      "titulo": "Drama Emocionante",
      "nota": 4.0,
      "qntAvaliacao": 140,
      "descricao": "Um drama envolvente que toca o coração.",
      "comentarios": [
        "Histórias emocionantes!",
        "Uma atuação incrível."
      ],
      "img": [
        "https://images.pexels.com/photos/4068499/pexels-photo-4068499.jpeg",
        "https://images.pexels.com/photos/1362611/pexels-photo-1362611.jpeg"
      ],
      "genero": "Drama"
    },
    {
      "id": "10",
      "titulo": "Terror Psicológico",
      "nota": 4.1,
      "qntAvaliacao": 75,
      "descricao": "Um terror psicológico que vai tirar seu sono.",
      "comentarios": [
        "Muito bem produzido!",
        "As atuações são assustadoras."
      ],
      "img": [
        "https://images.pexels.com/photos/10335459/pexels-photo-10335459.jpeg",
        "https://images.pexels.com/photos/1620321/pexels-photo-1620321.jpeg"
      ],
      "genero": "Terror"
    },
    {
      "id": "11",
      "titulo": "Jornada de Autodescoberta",
      "nota": 4.5,
      "qntAvaliacao": 310,
      "descricao": "Uma emocionante jornada de autodescoberta.",
      "comentarios": [
        "História envolvente e reflexiva.",
        "Uma experiência transformadora.",
        "Recomendo para todos!",
        "Simplesmente incrível!",
        "A forma como retratam a superação é tocante."
      ],
      "img": [
        "https://images.pexels.com/photos/3098260/pexels-photo-3098260.jpeg",
        "https://images.pexels.com/photos/2911201/pexels-photo-2911201.jpeg"
      ],
      "genero": "Drama"
    },
    {
      "id": "12",
      "titulo": "Comédia Leve",
      "nota": 3.9,
      "qntAvaliacao": 80,
      "descricao": "Uma comédia leve sobre a vida cotidiana.",
      "comentarios": [
        "Diversão garantida!",
        "Risos do início ao fim."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Comédia"
    },
    {
      "id": "13",
      "titulo": "Ação Eletrizante",
      "nota": 4.4,
      "qntAvaliacao": 250,
      "descricao": "Uma ação eletrizante com muita adrenalina.",
      "comentarios": [
        "Cenas de ação incríveis!",
        "Um filme que te prende do início ao fim."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Ação"
    },
    {
      "id": "14",
      "titulo": "Ficção Científica Inovadora",
      "nota": 4.7,
      "qntAvaliacao": 350,
      "descricao": "Uma ficção científica inovadora e surpreendente.",
      "comentarios": [
        "Efeitos visuais de outro mundo!",
        "Uma história que te faz refletir."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Ficção Científica"
    },
    {
      "id": "15",
      "titulo": "Suspense Envolvente",
      "nota": 4.0,
      "qntAvaliacao": 120,
      "descricao": "Um suspense envolvente que te deixa tenso.",
      "comentarios": [
        "Muito bem produzido!",
        "As reviravoltas são surpreendentes."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Suspense"
    },
    {
      "id": "16",
      "titulo": "Animação Divertida",
      "nota": 3.7,
      "qntAvaliacao": 110,
      "descricao": "Uma animação divertida para toda a família.",
      "comentarios": [
        "Risadas garantidas!",
        "Personagens carismáticos."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Animação"
    },
    {
      "id": "17",
      "titulo": "Drama Intenso",
      "nota": 4.3,
      "qntAvaliacao": 160,
      "descricao": "Um drama intenso que te faz refletir sobre a vida.",
      "comentarios": [
        "História emocionante!",
        "Atuações incríveis."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Drama"
    },
    {
      "id": "18",
      "titulo": "Terror Sobrenatural",
      "nota": 4.2,
      "qntAvaliacao": 95,
      "descricao": "Um terror sobrenatural que vai te deixar arrepiado.",
      "comentarios": [
        "Muito bem produzido!",
        "As cenas de suspense são de tirar o fôlego."
      ],
      "img": [
        "https://images.pexels.com/photos/8767770/pexels-photo-8767770.jpeg",
        "https://images.pexels.com/photos/4611466/pexels-photo-4611466.jpeg"
      ],
      "genero": "Terror"
    }
  ]
}
''';

  Map<String, dynamic> jsonMap;
  try {
    jsonMap = jsonDecode(jsonData);
    return List<Map<String, dynamic>>.from(jsonMap['avaliacoes']);
  } catch (e) {
    throw Exception("Erro ao decodificar JSON: $e");
  }
}
