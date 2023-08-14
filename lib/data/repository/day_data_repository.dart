import 'package:sunrise/domain/model/day.dart';
import 'package:sunrise/domain/repository/day_repository.dart';

class DayDataRepository implements DayRepository {
  @override
  Future<Day> getDay({required double latitude, required double longitude}) {
    return getDay(latitude: latitude, longitude: longitude);
  }
}
