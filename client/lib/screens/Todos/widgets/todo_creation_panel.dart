import 'package:client/logic/bloc/floater/floater_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/todo_bundle.dart';
import '../../../logic/bloc/todo/todo_bloc.dart';

class TodoCreationPanel extends StatelessWidget {
  TodoCreationPanel({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FloaterBloc _floaterBloc = BlocProvider.of<FloaterBloc>(context);
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(top: 25, left: 8.0, right: 8.0),
                child: Text('Enter todo title:',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textEditingController,
            ),
          ),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              return TextButton(
                  onPressed: () {
                    int id = state.todos?.isNotEmpty == true
                        ? state.todos!.last.id + 1
                        : 1;
                    context.read<TodoBloc>().add(
                          CreateTodoEvent(
                            todo: Todo(
                                id: id,
                                completed: false,
                                title: _textEditingController.text),
                          ),
                        );
                    _textEditingController.clear();
                    _floaterBloc.add(Created(0));
                  },
                  child: Container(
                      width: 140,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Center(
                          child: Text(
                        'Create todo',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white),
                      ))));
            },
          )
        ],
      ),
    );
  }
}
