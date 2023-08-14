import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_bloc.dart';
import 'bloc/bloc_event.dart';
import 'bloc/bloc_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              const Text('sunrise-sunset.org/api\nLat, Lng in decimal degrees'),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    final HomeBloc bloc = context.read<HomeBloc>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _getRowInput(),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                bloc.add(GetInfoEvent(
                    lat: _latController.text, lng: _lngController.text));
              },
              child: const Text('Получить данные'),
            ),
            const SizedBox(height: 20),
            _blocBuilder(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<HomeBloc, MyState> _blocBuilder() {
    return BlocBuilder<HomeBloc, MyState>(
      builder: (context, state) {
        if (state is EmptyState) {
          return const SizedBox();
        }

        if (state is Loading) {
          return const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          );
        }

        if (state is Loaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Восход: ${state.day.sunrise}'),
              Text('Заход: ${state.day.sunset}'),
              Text('Полдень: ${state.day.solarNoon}'),
              Text(
                'Продолжительность: ${Duration(seconds: state.day.dayLength)}',
              ),
            ],
          );
        }
        if (state is Error) {
          return Text(state.message);
        }

        return const Text('Вообще чтото непонятное.....');
      },
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Широта'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: true),
            decoration: const InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }
}
