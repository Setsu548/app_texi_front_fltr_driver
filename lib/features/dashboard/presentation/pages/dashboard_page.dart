import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/providers/socket_provider.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/utils/socket_service.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/features/trips_driver/presentation/pages/trip_passenger_offers_page.dart';
import 'package:texi_driver/features/dashboard/presentation/provider/dashboard_providers.dart';
import 'package:texi_driver/features/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:texi_driver/features/dashboard/services/positioning_services.dart';
import '../../../../core/lang/extension_lang.dart';
import '../../services/local_auth_services.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then((bool isSupported) {
      ref.read(supportBiometricsProvider.notifier).toggleSwitch(isSupported);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final socketService = ref.watch(socketServiceProvider).value;

    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: theme.colorScheme.primary),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Text(
          'TEXI',
          style: StylesForTexts(context: context).headerStyle(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.notifications_none, color: primaryColor),
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 8,
                      minHeight: 8,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatusCard(primaryColor, theme, socketService),
              SizedBox(height: 2.h),
              /* _buildEarningsCard(primaryColor, theme),
              SizedBox(height: 3.h),
              Text(
                quickActionsStr.i18n,
                style: StylesForTexts(context: context).headerStyleSmall(),
              ),
              SizedBox(height: 1.5.h),
              _buildQuickActionsGrid(primaryColor, theme),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breakdownLast5Days.i18n,
                    style: StylesForTexts(context: context).headerStyleSmall(),
                  ),
                  TextButton(onPressed: () {}, child: Text(seeAll.i18n)),
                ],
              ),
              SizedBox(height: 1.5.h),
              _buildBreakdownList(primaryColor, theme),
              SizedBox(height: 2.h), */
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(
    Color primaryColor,
    ThemeData theme,
    SocketService? socketService,
  ) {
    final switchActive = ref.watch(switchActiveProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: switchActive ? Colors.greenAccent : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 2.w),
                    RichText(
                      text: TextSpan(
                        text: '${currentStatus.i18n} ',
                        style: StylesForTexts(
                          context: context,
                        ).headerStyleSmall(),
                        children: [
                          TextSpan(
                            text: switchActive
                                ? activeStr.i18n
                                : inactiveStr.i18n,
                            style: StylesForTexts(
                              context: context,
                            ).headerStyleSmall(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.8.h),
                Text(
                  switchActive
                      ? connectedReadyForTrips.i18n
                      : disconnected.i18n,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: switchActive,
            onChanged: (val) async {
              if (val) {
                final localAuth = LocalAuthServices(auth: auth);
                bool isAuthenticated = await localAuth.authenticate();
                if (!mounted) return;
                if (isAuthenticated) {
                  ref.read(switchActiveProvider.notifier).toggleSwitch();
                  try {
                    if (socketService != null) {
                      _showMessage(connectedReadyForTrips.i18n);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TripPassengerOffersPage(),
                        ),
                      );
                      PositioningServices(socketService).start();
                    } else {
                      _showMessage('Error al iniciar el Socket Provider');
                      ref.read(switchActiveProvider.notifier).toggleSwitch();
                    }
                  } catch (e, stack) {
                    _showMessage('Error al iniciar el Socket Provider: \$e');
                    print(stack);
                    ref.read(switchActiveProvider.notifier).toggleSwitch();
                  }
                }
              } else {
                ref.read(switchActiveProvider.notifier).toggleSwitch();
                ref.invalidate(socketServiceProvider);
                PositioningServices(null).stop();
              }
            },
            activeThumbColor: theme.primaryColor,
            activeTrackColor: theme.primaryColor.withValues(alpha: 0.15),
            inactiveThumbColor: theme.colorScheme.secondary.withValues(
              alpha: 0.55,
            ),
            inactiveTrackColor: theme.colorScheme.tertiary.withValues(
              alpha: 0.55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsCard(Color primaryColor, ThemeData theme) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryColor.withValues(alpha: 0.18),
            theme.colorScheme.surface,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                totalEarningsPeriod.i18n.toUpperCase(),
                style: StylesForTexts(
                  context: context,
                ).headerStyleSmall().copyWith(fontSize: 15.65.sp),
              ),
              Icon(Icons.payments, color: primaryColor, size: 28),
            ],
          ),
          SizedBox(height: 1.h),
          RichText(
            text: TextSpan(
              text: '5,230.75',
              style: StylesForTexts(context: context).headerStyleSmall(),
              children: [
                TextSpan(
                  text: ' Bs.',
                  style: StylesForTexts(context: context).headerStyleSmall(),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Divider(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.35),
            thickness: 1,
          ),
          SizedBox(height: 1.h),
          Row(
            children: [
              Icon(Icons.map_outlined, color: primaryColor, size: 18.75.sp),
              SizedBox(width: 1.5.w),
              Text(
                '750 ${kmTraveledStr.i18n}',
                style: StylesForTexts(context: context).bodyStyle(),
              ),
              SizedBox(width: 6.w),
              Icon(Icons.history, color: primaryColor, size: 18.75.sp),
              SizedBox(width: 1.5.w),
              Text(
                last30Days.i18n,
                style: StylesForTexts(context: context).bodyStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid(Color primaryColor, ThemeData theme) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.6,
      crossAxisSpacing: 4.w,
      mainAxisSpacing: 4.w,
      children: [
        _buildActionCard(Icons.restore, historyStr.i18n, primaryColor, theme),
        _buildActionCard(
          Icons.account_balance_wallet_outlined,
          earningsStr.i18n,
          primaryColor,
          theme,
        ),
        _buildActionCard(
          Icons.person_outline,
          profileStr.i18n,
          primaryColor,
          theme,
        ),
        _buildActionCard(
          Icons.support_agent,
          supportStr.i18n,
          primaryColor,
          theme,
        ),
      ],
    );
  }

  Widget _buildActionCard(
    IconData icon,
    String title,
    Color primaryColor,
    ThemeData theme,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 22.5.sp),
          ),
          SizedBox(height: 1.h),
          Text(title, style: StylesForTexts(context: context).bodyStyle()),
        ],
      ),
    );
  }

  Widget _buildBreakdownList(Color primaryColor, ThemeData theme) {
    final items = [
      {
        'date': '${todayStr.i18n}, 24 May',
        'stats': '12 ${tripsStr.i18n} • 45 Km',
        'amount': '420.50 Bs.',
      },
      {
        'date': '${yesterdayStr.i18n}, 23 May',
        'stats': '15 ${tripsStr.i18n} • 62 Km',
        'amount': '580.20 Bs.',
      },
      {
        'date': '22 May',
        'stats': '8 ${tripsStr.i18n} • 30 Km',
        'amount': '310.00 Bs.',
      },
      {
        'date': '21 May',
        'stats': '14 ${tripsStr.i18n} • 55 Km',
        'amount': '505.40 Bs.',
      },
      {
        'date': '20 May',
        'stats': '10 ${tripsStr.i18n} • 40 Km',
        'amount': '380.00 Bs.',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: EdgeInsets.only(bottom: 1.5.h),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary.withValues(alpha: 0.015),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.secondary.withValues(alpha: 0.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['date']!,
                    style: StylesForTexts(context: context).bodyStyle(),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    item['stats']!,
                    style: StylesForTexts(
                      context: context,
                    ).bodyStyle().copyWith(fontSize: 13.5.sp),
                  ),
                ],
              ),
              Text(
                item['amount']!,
                style: StylesForTexts(context: context).bodyStyle().copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(customSnackBar(message, context));
  }
}
