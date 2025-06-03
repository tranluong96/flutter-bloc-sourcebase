abstract class BottomBarEvent {}

class BottomBarIndexChanged extends BottomBarEvent {
  final int index;

  BottomBarIndexChanged(this.index);
} 