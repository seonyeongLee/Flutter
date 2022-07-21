class Todo {
  String title;
  String memo;
  String category;
  int color;
  int done; //0: 미완료, 1: 완료
  int date; //20220720

  Todo({required this.title, required this.memo, required this.category,
    required this.color, this.done=0,  required this.date});

}