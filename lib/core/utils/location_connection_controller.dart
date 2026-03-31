import 'package:go_router/go_router.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/utils/location_service_monitor.dart';

class LocationConnectionController {
  bool _offlinePageVisible = false;

  void handleConnection(LocationServiceStatus status, GoRouter router) {
    switch (status) {
      case LocationServiceStatus.enabled:
        if (_offlinePageVisible) {
          router.pop();
        }
        _offlinePageVisible = false;
        break;
      case LocationServiceStatus.disabled:
        if (!_offlinePageVisible) {
          _offlinePageVisible = true;
          router.push(AppRouter.offlinePositionLocation).then((_) {
            _offlinePageVisible = false;
          });
        }
        break;
      case LocationServiceStatus.checking:
        break;
    }
  }
}
