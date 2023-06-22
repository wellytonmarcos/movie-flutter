import 'package:flutter/material.dart';
import 'package:movie/models/MovieModel.dart';

class CardMovie extends StatelessWidget {

  CardMovie({required this.id, required this.name,
      required this.isCompleted,
      required this.score});

  final int id;
  final String name;
  final bool isCompleted;
  final int score;

  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.movie),
            title: Text(name),
            subtitle: Text('Score: '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('DETALHES'),
                onPressed: () {
                  Navigator.pushNamed(context, '/movies/$id');
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('EDITAR'),
                onPressed: () {
                  Navigator.pushNamed(context, '/movies/edit/$id');
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('EXCLUIR'),
                onPressed: () {
                  Navigator.pushNamed(context, '/movies/delete/$id');
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
