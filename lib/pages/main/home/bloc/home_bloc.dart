import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/singletons/data_service_mgmt.dart';
import 'package:my_app/core/utils/helpers/dp_disposable.dart';
import 'package:my_app/pages/main/home/bloc/home_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Cubit<HomeState> with DPDisposable {
  int get count => DataServiceMgmt.instance.count;
  final _testStream = PublishSubject<void>();
  final showModalStream = PublishSubject<void>();
  final countChanged = BehaviorSubject<int>.seeded(0);

  HomeBloc() : super(HomeState.initial()) {
    countChanged.add(count);
    _testStream
        .doOnData((_) {
          _safeEmit(state.copyWith(status: HomeStatus.loading));
        })
        .asyncMap((_) => Future.delayed(const Duration(seconds: 2)))
        .map((_) => 1)
        .doOnData((_) {
          _safeEmit(state.copyWith(status: HomeStatus.loaded));
        })
        .doOnError((error, stackTrace) {
          _safeEmit(state.copyWith(status: HomeStatus.error));
        })
        .listen((value) {
          _safeEmit(state.copyWith(status: HomeStatus.error));
        })
        .canceledBy(this);
  }

  /// Chỉ emit khi bloc còn sống để tránh StateError khi màn hình đã dispose
  /// nhưng tác vụ async (vd Future.delayed) mới hoàn tất.
  void _safeEmit(HomeState newState) {
    if (!isClosed) emit(newState);
  }

  void init() {
    _testStream.add(null);
  }

  void updateCount() {
    final newCount = DataServiceMgmt.instance.count;
    countChanged.add(newCount);
    _safeEmit(state.copyWith(count: newCount, status: HomeStatus.update));
  }

  void incrementCount() {
    DataServiceMgmt.instance.incrementCount();
    updateCount();
  }

  void decrementCount() {
    DataServiceMgmt.instance.decrementCount();
    updateCount();
  }

  /// Chỉ cập nhật state. Việc đổi ngôn ngữ thực tế (phụ thuộc BuildContext)
  /// do tầng UI xử lý để bloc không giữ tham chiếu tới context.
  void toggleLanguage(bool value) {
    _safeEmit(state.copyWith(isEnglish: value));
  }

  void initLanguage(bool isEnglish) {
    _safeEmit(state.copyWith(isEnglish: isEnglish));
  }

  void resetState() {
    _safeEmit(state.copyWith(status: HomeStatus.initial, error: null));
  }

  @override
  Future<void> close() {
    cancelSubscriptions();
    countChanged.close();
    showModalStream.close();
    _testStream.close();
    return super.close();
  }
}
