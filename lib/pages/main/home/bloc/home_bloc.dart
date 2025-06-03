import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/localization/app_localization.dart';
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
          emit(state.copyWith(status: HomeStatus.loading));
        })
        .asyncMap((_) => Future.delayed(const Duration(seconds: 2)))
        .map((_) => 1)
        .doOnData((_) {
          emit(state.copyWith(status: HomeStatus.loaded));
        })
        .doOnError((error, stackTrace) {
          emit(state.copyWith(status: HomeStatus.error));
        })
        .listen((value) {
          emit(state.copyWith(status: HomeStatus.error));
        })
        .canceledBy(this);
  }

  void init() {
    _testStream.add(null);
  }

  void updateCount() {
    final newCount = DataServiceMgmt.instance.count;
    countChanged.add(newCount);
    emit(state.copyWith(count: newCount, status: HomeStatus.update));
  }

  void incrementCount() {
    DataServiceMgmt.instance.incrementCount();
    updateCount();
  }

  void decrementCount() {
    DataServiceMgmt.instance.decrementCount();
    updateCount();
  }

  void toggleLanguage(bool value, BuildContext context) {
    emit(state.copyWith(isEnglish: value));
    AppLocalization.of(context).changeLanguage(value ? 'en' : 'ja');
  }

  void initLanguage(bool isEnglish) {
    emit(state.copyWith(isEnglish: isEnglish));
  }

  void resetState() {
    emit(state.copyWith(status: HomeStatus.initial, error: null));
  }

  @override
  Future<void> close() {
    countChanged.close();
    showModalStream.close();
    _testStream.close();
    return super.close();
  }
}
