import 'package:my_app/core/utils/helpers/dp_disposable.dart';

abstract class BaseViewModel<Input, Output> with DPDisposable {
  Input get input;
  Output get output;
}
