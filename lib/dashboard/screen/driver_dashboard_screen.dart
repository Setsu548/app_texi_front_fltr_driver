import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/app/app_scaffold.dart';
import 'package:app_texi_fltr_driver/dashboard/view/driver_dashboard_view.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/navigation/view/side_menu_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/date_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/pill_switch_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';

import '../../app/app_router.dart';
import '../../navigation/utils/format_long_date_two_es.dart';
import '../../theme/main_theme.dart';

class DriverDashboardScreen extends HookWidget {
  const DriverDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isOn = useState(false);
    final selectedDate = useState<DateTime>(DateTime.now());

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (!didPop && !Navigator.of(context).canPop()) {
          SystemNavigator.pop();
        }
      },
      child: AppScaffold(
        loadingOverlay: true,
        appBar: AppBarLogoHome(context,true,false),
        endDrawer: Drawer(child: SideMenuView()),
        disableBackButton: true,
        onBackButtonPressed: () async {
          if (!Navigator.of(context).canPop()) {
            SystemNavigator.pop();
            return false;
          }
          return true;
        },
        body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            DateChip(text: formatLongDateTwoEs(selectedDate.value)),
                          ],
                        ),
                        SizedBox(height: 20),

                        CardOnSurface(
                          padding: EdgeInsets.all(20),
                          backgroundColor: lightColorScheme.secondary,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LabelText(context.intl.labelTextCurrentStatus),
                                    BodyText(
                                      context.intl.bodyTextActive,
                                      color: lightColorScheme.surfaceDim,
                                    ),
                                  ],
                                ),
                                PillSwitch(
                                  value: isOn.value,
                                  onChanged: (v) {
                                    isOn.value = v;
                                    if (v) appRouter.push('/dashboard/driver_auth');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        CardOnSurface(
                          padding: EdgeInsets.all(20),
                          backgroundColor: lightColorScheme.secondary,
                          children: [
                            BodyText(
                              context.intl.bodyTextTrajectory,
                              color: lightColorScheme.primary,
                            ),
                            SizedBox(height: 10),
                            LabelText(context.intl.labelTextTripsAttended),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleText('5,230.75 Bs.', color: lightColorScheme.primary),
                                TitleText('750 Km.', color: lightColorScheme.primary),
                              ],
                            ),
                            SizedBox(height: 10),
                            LabelText('Periodo: 01/05/2023 - 31/05/2023'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LabelText(context.intl.labelTextCompletedTrips),
                                BodyText('38', color: lightColorScheme.primary),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TitleText(context.intl.titleTextTravelRequests),
                        LabelText(context.intl.labelTextSelectRequest),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: FirebaseFirestore.instance.collection('drive').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text("No hay solicitudes"));
                      }

                      final travels = snapshot.data!.docs
                          .map((doc) => TravelModel.fromFirebase(doc.data()))
                          .toList();

                      return Column(
                        children: travels.map((travel) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                DriverDashboardView(travel: travel),
                                SizedBox(height: 25),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  SizedBox(height: 40),
                ],
              ),
            )
      ),
    );
  }
}
