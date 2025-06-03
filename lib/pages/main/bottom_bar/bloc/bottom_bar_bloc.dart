import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'bottom_bar_event.dart';
import 'bottom_bar_state.dart';

@injectable
class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const BottomBarState(0)) {
    on<BottomBarIndexChanged>(_onIndexChanged);
  }

  void _onIndexChanged(BottomBarIndexChanged event, Emitter<BottomBarState> emit) {
    emit(BottomBarState(event.index));
  }
} 