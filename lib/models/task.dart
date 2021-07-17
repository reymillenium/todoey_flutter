class Task {
  // Properties:
  int id;
  String taskText;
  bool isChecked;

  // Constructor:
  Task({
    this.id,
    this.taskText,
    this.isChecked = false,
  });

  // Public methods:
  void toggleChecked() {
    isChecked = !isChecked;
  }

  void updateFrom(Task task) {
    taskText = task.taskText;
    isChecked = task.isChecked;
  }
}
