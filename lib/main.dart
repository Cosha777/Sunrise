import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunrise/ui/bloc/bloc_bloc.dart';
import 'package:sunrise/ui/home.dart';

import 'data/api/api_util.dart';
import 'data/api/service/sunrise_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          ApiUtil(SunriseService()),
        ),
        child: const Home(),
      ),
    );
  }
}
