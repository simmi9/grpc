import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/todo/todo_bloc.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({
    Key? key,
  }) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todos != null && state.todos != []) {
            return Container(
              color: Color.fromARGB(255, 243, 230, 214),
              child: Column(
                children: [
                  Container(
                    child: Text("Todo List", style: TextStyle(fontSize: 24)),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todos!.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: () {
                        context
                            .read<TodoBloc>()
                            .add(DeleteTodoEvent(id: state.todos![index].id));
                        var id = state.todos![index].id;
                        final snackBar = SnackBar(
                            content: Text(
                              'Deleted Todo $id',
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.all(20),
                            backgroundColor: Colors.red[300]);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      onTap: () {
                        context
                            .read<TodoBloc>()
                            .add(UpdateTodoEvent(id: state.todos![index].id));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.orangeAccent,
                          child: Row(
                            children: [
                              Checkbox(
                                value: state.todos![index].completed,
                                activeColor: Colors.lightGreenAccent,
                                checkColor: Colors.black,
                                onChanged: (bool? value) {
                                  context.read<TodoBloc>().add(UpdateTodoEvent(
                                      id: state.todos![index].id));
                                },
                              ),
                              Text(
                                "${state.todos![index].id} ${state.todos![index].title}",
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
