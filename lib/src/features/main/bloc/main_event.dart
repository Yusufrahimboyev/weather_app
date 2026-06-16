sealed class MainEvent {
  final String city;
  MainEvent({required this.city});
}

class GetPhoto$MainEvent extends MainEvent {
  GetPhoto$MainEvent({required super.city});
}
