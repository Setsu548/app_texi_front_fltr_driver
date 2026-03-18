String acceptOfferUrl(String tripId) => '/drivers/me/trips/$tripId/accept';
String arriveStateUrl(String tripId) => '/drivers/me/trips/$tripId/arrived';
String startTripUrl(String tripId) => '/drivers/me/trips/$tripId/started';
String finishTripUrl(String tripId) => '/drivers/me/trips/$tripId/completed';
