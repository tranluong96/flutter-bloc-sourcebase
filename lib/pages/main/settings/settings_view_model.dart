import 'package:my_app/core/localization/app_localization.dart';
import 'package:my_app/pages/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel extends BaseViewModel {
  final countChanged = BehaviorSubject<int>.seeded(0);

  bool get isEnglish => AppLocalization.isEnglish;
  int get count => countChanged.value;

  Future<void> changeLanguage(bool isEnglish) {
    return AppLocalization.changeLanguage(isEnglish ? 'en' : 'ja');
  }

  void incrementCount() {
    countChanged.add(count + 1);
  }

  void decrementCount() {
    countChanged.add(count - 1);
  }

  void dispose() {
    countChanged.close();
  }
}
