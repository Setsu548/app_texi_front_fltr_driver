import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:texi_driver/core/router/app_router.dart';

class InternetService {
  Timer? _timer;
  bool _isOfflinePageVisible = false;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      bool hasInternet = await InternetConnection().hasInternetAccess;
      if (!hasInternet && !_isOfflinePageVisible) {
        _isOfflinePageVisible = true;
        AppRouter.routes.push(AppRouter.offlineLocation).then((value) {
          _isOfflinePageVisible = false;
        });
      } else if (hasInternet && _isOfflinePageVisible) {
        if (AppRouter.routes.canPop()) {
          AppRouter.routes.pop();
        } else {
          AppRouter.routes.go(AppRouter.initialLocation);
        }
        _isOfflinePageVisible = false;
      }
    });
  }

  void stop() {
    _timer?.cancel();
  }
}
