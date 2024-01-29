import 'dart:async';
import 'dart:ui';

class Debounce {
  Debounce({this.seconds = 2});

  final int seconds;

  Timer? _timer;

  void run(VoidCallback callback) {
    _timer?.cancel();

    _timer = Timer(Duration(seconds: seconds), callback);
  }

  void stop() {
    _timer?.cancel();
  }

  void dispose() {
    _timer?.cancel();
  }
}
