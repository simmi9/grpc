import 'package:client/screens/Todos/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client/logic/bloc/floater/floater_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FloaterBloc _floaterBloc = BlocProvider.of<FloaterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Todo gRPC Client',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.white70),
          ),
        ),
        scrolledUnderElevation: 50,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed cod
          _floaterBloc.add(Add(1));
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
          color: Color.fromARGB(255, 247, 245, 245), child: const TodoPage()),
    );
  }
}
