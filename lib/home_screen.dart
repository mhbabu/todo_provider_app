import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/todo_model.dart';
import 'package:provider_app/provider/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  void _handleSubmit() {
    final title = _textController.text.trim();
    if (title.isEmpty) return;

    context.read<TodoProvider>().addTodoList(
      new TodoModel(title: title, isCompleted: false),
    );
    _textController.clear();
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  Future<void> _showDialogue() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo Item'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Write you item...',
              filled: true,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: _handleSubmit,
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'Todo List',
      //     style: TextStyle(
      //       fontSize: 26,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                // alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff622CA7),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: const Text(
                    'Todo List',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: ListView.builder(
                itemBuilder: (context, itemIndex) {
                  return ListTile(
                    onTap: () {
                      itemProvider.todoStatusChanged(
                        itemProvider.allTodoList[itemIndex],
                      );
                    },
                    leading: MSHCheckbox(
                      size: 30,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: Colors.blue,
                      ),
                      style: MSHCheckboxStyle.stroke,
                      value: itemProvider.allTodoList[itemIndex].isCompleted,
                      onChanged: (selected) {
                        itemProvider.todoStatusChanged(
                          itemProvider.allTodoList[itemIndex],
                        );
                      },
                    ),
                    title: Text(
                      itemProvider.allTodoList[itemIndex].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        decoration:
                            itemProvider.allTodoList[itemIndex].isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        itemProvider.removeTodoList(
                          itemProvider.allTodoList[itemIndex],
                        );
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
                itemCount: itemProvider.allTodoList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff622CA7),
        onPressed: _showDialogue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
