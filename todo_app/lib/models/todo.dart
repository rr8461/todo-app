class ToDo //user defined data type can be used as data type like final ToDo x;
{
  String? id;
  //? indicates null or string values is passed
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });
static List<ToDo> list(){
  return[
    ToDo(id:'01',todoText: 'Morning Exercise',isDone: true),
    ToDo(id:'02',todoText: 'Buy Groceries',isDone: true),
  ToDo(id: '03', todoText: 'Check Emails', isDone: true),
      ToDo(id: '04', todoText: 'Team Meeting'),
      ToDo(id: '05', todoText: 'Work on mobile app'),
      ToDo(id: '06', todoText: 'Dinner with Pingu')
  ];
}
}