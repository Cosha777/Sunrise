import 'package:sunrise/domain/model/day.dart';

abstract class DayRepository {
  Future<Day> getDay({required double latitude, required double longitude});
}
