import 'package:app_texi_fltr_driver/login/bloc/login_bloc.dart';
import 'package:app_texi_fltr_driver/login/view/vehicle_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_bar_logo_home.dart';
import '../../app/app_scaffold.dart';
import '../view/vehicle_selection_list_view.dart';

class VehicleSelectionScreen extends HookWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.microtask(() {
        // Aquí va tu lógica o llamada a BLoC
        context.read<LoginBloc>().add(LoginEvent.getVehiclePlate(befor: (res){},success: (res){},error: (err){}));
        debugPrint('🚗 Cargando vehículos...');
      });
      return null; // cleanup no necesario
    }, const []);

    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context,false,false),
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.loadingListVehicle == true ) {
            return Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              state.listUsersVehicle.isNotEmpty
              ? VehicleSelectionListView()
              : VehicleSelectionView()
            ],
          );
        },
      ),
    );
  }
}
