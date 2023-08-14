abstract class MyEvent {}

class GetInfoEvent extends MyEvent {
  final String lat;
  final String lng;

  GetInfoEvent({required this.lat, required this.lng});
}
