import 'package:texi_driver/core/utils/socket_service.dart';

class TripOffersPassenger {
  final SocketService _socketService;

  TripOffersPassenger(this._socketService);

  void listenToOffers(Function(dynamic) onData) {
    _socketService.onMessage('trip:offer', onData);
  }

  void acceptOffer(String tripId) {
    _socketService.sendMessage('trip:accept', {'tripId': tripId});
  }
}
