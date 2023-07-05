import 'package:flutter/material.dart';

import 'widgets/todo_creation_panel.dart';
import 'widgets/todo_list.dart';
import 'package:client/logic/bloc/floater/floater_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FloaterBloc _floaterBloc = BlocProvider.of<FloaterBloc>(context);
    return Column(
      children: [
        BlocBuilder<FloaterBloc, int>(
          bloc: _floaterBloc,
          builder: (BuildContext context, int count) {
            return count == 1 ? TodoCreationPanel() : SizedBox();
          },
        ),
        SizedBox(height: 20),
        TodoListWidget(),
      ],
    );
  }
}
