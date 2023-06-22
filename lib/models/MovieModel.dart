class MovieModel {
  final int id;
  final String name;
  final bool isCompleted;
  final int score;

  const MovieModel({
    required this.id,
    required this.name,
    required this.isCompleted,
    required this.score,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return MovieModel(
        id: json['id'],
        name: json['name'] ?? 'Sem Nome',
        isCompleted: json['isCompleted']== 1 ? true : false,
        score: json['score'] 
      );
  }
}
