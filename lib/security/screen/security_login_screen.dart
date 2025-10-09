import 'package:app_texi_fltr_driver/app/widgets/primary_loading_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/app_router.dart';
import '../../app/app_scaffold.dart';
import '../../app/widgets/label_text_widget.dart';
import '../../app/widgets/link_text_primary_widget.dart';
import '../view/security_login_view.dart';

class SecurityLoginScreen extends HookWidget {
  const SecurityLoginScreen({super.key});

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
      return PrimaryLoading();
    }
          return AppScaffold(
            appBar: null,
            loadingOverlay: true,
            disableBackButton: true,
            onBackButtonPressed: () async {
              return Future.value(true);
            },
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/texiFondo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/texi.png',
                            width: MediaQuery.of(context).size.height * 0.4,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height * 0.18)),
                            child: Column(
                              children: [
                                LabelText(context.intl.labelFastestSafestTravel),
                                LinkTextPrimary(
                                  context.intl.linkTextPrimaryRegister,
                                  onTap: (){
                                    appRouter.push('/security/welcome');
                                  }
                                )
                              ],
                            ),
                          ), 
                        ],
                      ),
                      const SecurityLoginView(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
