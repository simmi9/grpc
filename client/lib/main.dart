import 'package:client/logic/bloc/floater/floater_bloc.dart';
import 'package:client/screens/home/home_page.dart';
import 'package:client/utils/grpc.dart';
import 'package:client/logic/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GrpcClient grpcClient = GrpcClient();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FloaterBloc>(create: (context) => FloaterBloc()),
        BlocProvider<TodoBloc>(
          create: (context) =>
              TodoBloc(grpcClient: grpcClient)..add(ReadTodoEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
