import 'package:flutter/material.dart';
import 'package:movie/controllers/MovieController.dart';

class CreateMovieView extends StatefulWidget {
  const CreateMovieView({super.key});

  @override
  State<CreateMovieView> createState() => _CreateMovieState();
}

class _CreateMovieState extends State<CreateMovieView> {
  @override
  initState() {
    super.initState();
  }

  MovieController movieController = MovieController();
  final movieNameController = TextEditingController();
  bool responseCreate = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    movieNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastrar Filme'), centerTitle: true),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  controller: movieNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite o nome do filme',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  //onPressed: setState() => { movieNameController.text.isEmpty ? null : () => { movieController.insertMovie(movieNameController.text)} },
                  onPressed: ()  =>  {
                 
                      // if (movieNameController.text.isEmpty) {
                      //   return  null;
                      // }
                      // responseCreate = await movieController.insertMovie(movieNameController.text),

                      SnackBar(
                      content: const Text('Yay! A SnackBar!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    ),
                  },
                  child: const Text('Cadastrar Filme'),
                ),
              ),
            ],
          ),
        ));
  }

  void save() async {
    if (movieNameController.text.isEmpty) {
      return;
    }
    responseCreate =
        await movieController.insertMovie(movieNameController.text);
    showDialog(responseCreate);
  }

  Widget showDialog(bool status) {
    return SnackBar(
      content: const Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }
}
