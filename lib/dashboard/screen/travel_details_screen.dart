import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_loading_widget.dart';
import 'package:app_texi_fltr_driver/dashboard/view/travel_details_view.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/navigation/view/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class TravelDetailsScreen extends HookWidget {
  const TravelDetailsScreen({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    final isReady = useState(false);
    final isMounted = useIsMounted();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          await Future.delayed(const Duration(milliseconds: 900));
        } finally {
          if (isMounted()) isReady.value = true;
        }
      });
      return null;
    }, const []);

    if (!isReady.value) {
      return SecondaryLoading();
    }

    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context),
      endDrawer: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top - 50 + kToolbarHeight,
        ),
        child: Drawer(child: SideMenuView()),
      ),
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          TravelDetailsView(travel: travel),
        ],
      ),
    );
  }
}
