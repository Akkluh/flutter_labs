abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadDataEvent extends HomeEvent {
  final String search;
  final String? nextPos;

  const HomeLoadDataEvent({this.search = 'funny', this.nextPos});
}
