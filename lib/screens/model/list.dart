class MyList {
  final bool completed;
  final int id;
  final String title;
  final int userId;

  MyList(
      {required this.completed,
      required this.id,
      required this.title,
      required this.userId});

  factory MyList.fromJson(Map<String, dynamic> json) {
    return MyList(
      completed: json['completed'],
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }
}
