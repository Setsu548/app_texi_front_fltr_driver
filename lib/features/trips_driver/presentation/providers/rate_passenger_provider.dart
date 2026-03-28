import 'package:flutter_riverpod/flutter_riverpod.dart';

final rateProvider = NotifierProvider<RateNotifier, int>(RateNotifier.new);

class RateNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setRate(int rate) {
    state = rate;
  }

  void reset() {
    state = 0;
  }
}
