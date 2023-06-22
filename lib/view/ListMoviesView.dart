import 'package:flutter/material.dart';
import 'package:movie/components/CardMovie.dart';
import 'package:movie/controllers/MovieController.dart';
import 'package:movie/models/MovieModel.dart';

class ListMoviesView extends StatefulWidget {
  const ListMoviesView({super.key});

  @override
  State<ListMoviesView> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMoviesView> {
  MovieController _movieController = MovieController();
  late Future<MovieModel> futureMovie;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos os Filmes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/movies/create')},
        tooltip: 'Cadastrar Filme',
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: _movieController.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CardMovie(
                  id: snapshot.data![index].id,
                  name: snapshot.data![index].name,
                  isCompleted: snapshot.data![index].isCompleted,
                  score: snapshot.data![index].score,);
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
