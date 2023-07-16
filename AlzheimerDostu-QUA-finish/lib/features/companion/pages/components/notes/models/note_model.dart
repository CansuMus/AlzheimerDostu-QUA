class Note {
  final String title;
  final String body;
  final int? id;
  Note({required this.id,required this.title, required this.body, });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id']  as int,
      title: map['title'],
      body: map['body'],
    );
  }
}
