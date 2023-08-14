import 'package:sunrise/domain/model/day.dart';

abstract class MyState {}

class EmptyState extends MyState {}

class Loading extends MyState {}

class Loaded extends MyState {
  Day day;
  Loaded({required this.day});
}

class Error extends MyState {
  String message;
  Error(this.message);
}
