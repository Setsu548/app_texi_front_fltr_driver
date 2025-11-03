import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_router.dart';
import '../../app/widgets/primary_variant_button.dart';
import '../../app/widgets/title_text_widget.dart';
import '../../app/widgets/vehicle_card_widget.dart';
import '../../theme/main_theme.dart';

class VehicleSelectionListView extends HookWidget {
  const VehicleSelectionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final vehicles = state.listUsersVehicle;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleText('Lista de Vehículos', color: lightColorScheme.primary),
            const SizedBox(height: 20),
            PrimaryVariantButton(
              text: context.intl.primaryVariantButtonRegisterNewVehicle,
                onPressed: () {
                  appRouter.push('/security/vehicle_info_form');
                },
            ),
            const SizedBox(height: 20),
            if (vehicles.isEmpty)
              Text(
                'No hay vehículos registrados.',
                style: TextStyle(color: lightColorScheme.secondaryContainer),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = vehicles[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: VehicleCardWidget(
                      dateText: 'Año: ${vehicle.year}',
                      priceText: vehicle.license_plate,
                      originDescription: vehicle.brand,
                      destinationDescription: vehicle.model,
                      statusColor: lightColorScheme.primary,
                      statusText: vehicle.used_by == 1
                          ? 'Usado por ti'
                          : 'Disponible',
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}

