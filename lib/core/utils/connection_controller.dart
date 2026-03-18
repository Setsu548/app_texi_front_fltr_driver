import 'package:go_router/go_router.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/utils/internet_service.dart';

class ConnectionController {
  bool _offlinePageVisible = false;

  void handleConnection(ConnectionStatus status, GoRouter router) {
    switch (status) {
      case ConnectionStatus.online:
        if (_offlinePageVisible) {
          router.pop();
        }
        _offlinePageVisible = false;
        break;
      case ConnectionStatus.offline:
        if (!_offlinePageVisible) {
          _offlinePageVisible = true;
          router.push(AppRouter.offlineLocation).then((_) {
            _offlinePageVisible = false;
          });
        }
        break;
      case ConnectionStatus.checking:
        break;
    }
  }
}
