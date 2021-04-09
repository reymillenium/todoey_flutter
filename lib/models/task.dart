class Task {
  // Properties:
  String taskText;
  bool isChecked;

  // Constructor:
  Task({
    this.taskText,
    this.isChecked = false,
  });

  // Public methods:
  void toggleChecked() {
    isChecked = !isChecked;
  }
}
