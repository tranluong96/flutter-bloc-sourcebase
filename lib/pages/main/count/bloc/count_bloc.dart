import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/singletons/data_service_mgmt.dart';
import 'package:my_app/core/utils/helpers/dp_disposable.dart';
import 'package:my_app/pages/main/count/bloc/count_state.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class CountBloc extends Cubit<CountState> with DPDisposable {
  final countChanged = PublishSubject<void>();

  CountBloc() : super(CountState.initial());

  //get count
  int get count => DataServiceMgmt.instance.count;

  void onIncrement() {
    DataServiceMgmt.instance.incrementCount();
    emit(state.copyWith(count: DataServiceMgmt.instance.count));
    countChanged.add(null);
  }

  void onDecrement() {
    DataServiceMgmt.instance.decrementCount();
    emit(state.copyWith(count: DataServiceMgmt.instance.count));
    countChanged.add(null);
  }

  @override
  Future<void> close() {
    countChanged.close();
    return super.close();
  }
}
