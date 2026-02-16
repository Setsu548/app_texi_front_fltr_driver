import 'package:flutter_riverpod/flutter_riverpod.dart';

//--Provider para ocultar la contraseña--//
final hidePasswordProvider = NotifierProvider<HidePasswordProvider, bool>(
  HidePasswordProvider.new,
);

class HidePasswordProvider extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}
//--//