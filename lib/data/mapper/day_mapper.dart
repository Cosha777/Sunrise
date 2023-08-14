import 'package:sunrise/data/api/api_day.dart';
import 'package:sunrise/domain/model/day.dart';

class DayMapper {

  static Day fromApi(ApiDay day) {
    return Day(
      sunrise: DateTime.tryParse(day.sunrise),
      sunset: DateTime.tryParse(day.sunset),
      solarNoon: DateTime.tryParse(day.solarNoon),
      dayLength: day.dayLength.toInt(),
    );
  }

}
