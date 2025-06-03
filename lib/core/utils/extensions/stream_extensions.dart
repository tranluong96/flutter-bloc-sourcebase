import 'dart:async';

extension BindStream<T> on Stream<T> {
  StreamSubscription<T> bindTo(StreamController<T> to) {
    return listen((event) {
      to.sink.add(event);
    });
  }
}
