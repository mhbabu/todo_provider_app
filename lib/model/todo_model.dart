

class TodoModel {

  String title;
  bool isCompleted;

  TodoModel({required this.title, required this.isCompleted});

  void toggleIsCompleted(){
    isCompleted = !isCompleted;
  }

}