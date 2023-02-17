class  Task {
  String title;
  String describe;
  String id='jh';
  int date;
  bool isdone;

  Task({
    required this.title,
    required this.describe,
     this.id ='s',
    required this.date,
     this.isdone=false,
  });

  Task.fromJson(Map<String, dynamic> json)
      : this(
    title: json['title']! as String,
    describe: json['describe']! as String,
    id: json['id']! as String,
    date: json['date']! as int,
    isdone: json['isdone']! as bool,
  );



  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'describe': describe,
      'id': id,
      'date': date,
      'isdone': isdone,
    };
  }
}