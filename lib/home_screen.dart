import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/design_screen.dart';
import 'package:provider_app/form_screen.dart';
import 'package:provider_app/model/todo_model.dart';
import 'package:provider_app/other_screen.dart';
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
      TodoModel(title: title, isCompleted: false),
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
              hintText: 'Write your item...',
              filled: true,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(onPressed: _handleSubmit, child: const Text('Submit')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xff622CA7),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Todo List',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Navigation buttons in the header with spacing between them
                    SizedBox(width: 10), // Added spacing between buttons
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.text_rotation_angledown_sharp,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Form Page',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DesignScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.design_services,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Design Page',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtherScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.other_houses,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Other Page', // Corrected label for "Other Page"
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Todo List
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: itemProvider.allTodoList.length,
                itemBuilder: (context, index) {
                  final todo = itemProvider.allTodoList[index];
                  return ListTile(
                    onTap: () => itemProvider.todoStatusChanged(todo),
                    leading: MSHCheckbox(
                      size: 30,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: Colors.blue,
                      ),
                      style: MSHCheckboxStyle.stroke,
                      value: todo.isCompleted,
                      onChanged: (selected) =>
                          itemProvider.todoStatusChanged(todo),
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => itemProvider.removeTodoList(todo),
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
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
