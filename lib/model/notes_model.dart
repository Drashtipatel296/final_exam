class NotesModel{
  int? id;
  String? note;

  NotesModel({required this.id, required this.note});

  factory NotesModel.fromMap(Map json){
    return NotesModel(
      id: json['id'],
      note: json['note'] ?? 'work',
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'note' : note,
    };
  }
}