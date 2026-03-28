import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/widgets/loading_screen.dart';
import 'package:texi_driver/features/profile/domain/entities/driver_profile_entity.dart';
import 'package:texi_driver/features/profile/presentation/providers/profile_provider.dart';

class DriverProfile extends ConsumerWidget {
  const DriverProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final profileDriver = ref.watch(driverProfileNotifierProvider);

    return profileDriver.when(
      loading: () => const LoadingScreen(),
      error: (error, stack) => Scaffold(
        appBar: AppBar(title: Text(profileStr.i18n)),
        body: Center(child: Text('Error: $error')),
      ),
      data: (profile) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            profileStr.i18n,
            style: StylesForTexts(context: context).headerStyle(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Profile Header
                _buildProfileHeader(theme, profile),
                const SizedBox(height: 32),

                // Action Cards Row
                /* Row(
                  children: [
                    Expanded(
                      child: _buildActionCard(
                        theme,
                        icon: Icons.history,
                        label: 'Trip History',
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildActionCard(
                        theme,
                        icon: Icons.payments_outlined,
                        label: 'Earnings',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32), */

                // Personal Information
                _buildSectionTitle(
                  theme,
                  icon: Icons.person_outline,
                  title: personalInformation.i18n,
                ),
                const SizedBox(height: 16),
                _buildInfoContainer(
                  theme,
                  children: [
                    _buildInfoRow(email.i18n, profile.email),
                    _buildDivider(),
                    _buildInfoRow(phone.i18n, profile.phoneNumber),
                    _buildDivider(),
                    _buildInfoRow(gender.i18n, profile.gender),
                    _buildDivider(),
                    _buildInfoRow(dateOfBirth.i18n, profile.birthDate),
                  ],
                ),
                const SizedBox(height: 32),

                // Address Information
                _buildSectionTitle(
                  theme,
                  icon: Icons.location_on_outlined,
                  title: address.i18n,
                ),
                const SizedBox(height: 16),
                _buildInfoContainer(
                  theme,
                  children: [
                    _buildInfoRow(locality.i18n, profile.locality.toString()),
                    _buildDivider(),
                    _buildInfoRow(address.i18n, profile.address),
                  ],
                ),
                const SizedBox(height: 32),

                // Vehicle Information
                /* _buildSectionTitle(
                  theme,
                  icon: Icons.directions_car,
                  title: vehicleInfoTitle.i18n,
                ),
                const SizedBox(height: 16),
                _buildInfoContainer(
                  theme,
                  children: [
                    _buildInfoRow('Brand/Model', 'Toyota Corolla'),
                    _buildDivider(),
                    _buildInfoRow('Plate', 'ABC-1234'),
                    _buildDivider(),
                    _buildInfoRow('Color', 'Dark Grey'),
                    _buildDivider(),
                    _buildInfoRow('Capacity', '4 Passengers'),
                  ],
                ),
                const SizedBox(height: 32),

                // Documents
                _buildSectionTitle(
                  theme,
                  icon: Icons.description,
                  title: 'Documents',
                ),
                const SizedBox(height: 16),
                _buildDocumentCard(
                  theme,
                  icon: Icons.badge_outlined,
                  title: "Driver's License",
                  status: "VERIFIED",
                ),
                const SizedBox(height: 12),
                _buildDocumentCard(
                  theme,
                  icon: Icons.shield_outlined,
                  title: "Insurance Policy",
                  status: "VERIFIED",
                ),
                const SizedBox(height: 12),
                _buildDocumentCard(
                  theme,
                  icon: Icons.build_outlined,
                  title: "Technical Inspection",
                  status: "PENDING REVIEW",
                ),
                const SizedBox(height: 32),

                // Settings
                _buildSectionTitle(
                  theme,
                  icon: Icons.settings,
                  title: 'Settings',
                ),
                const SizedBox(height: 16),
                _buildInfoContainer(
                  theme,
                  children: [
                    _buildSettingsRow(theme, 'Notifications', true),
                    _buildDivider(),
                    _buildSettingsRow(theme, 'Dark Mode', true),
                    _buildDivider(),
                    _buildSettingsRow(theme, 'App Sounds', false),
                  ],
                ),
                const SizedBox(height: 32),

                // Action Buttons
                _buildLogoutButton(theme),
                const SizedBox(height: 16), */
                _buildBackButton(theme, context),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme, DriverProfileEntity profile) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.primaryColor, width: 3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    shape: BoxShape.circle,
                  ),
                  child: profile.pictureProfile != null
                      ? Image.network(
                          profile.pictureProfile!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey,
                              ),
                        )
                      : const Icon(Icons.person, size: 50, color: Colors.grey),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.verified,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          '${profile.firstName} ${profile.lastName}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        /* Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: theme.primaryColor, size: 16),
            const SizedBox(width: 4),
            const Text(
              '4.8',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '|',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Text(
              profile.uuid.substring(0, 8),
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ), */
      ],
    );
  }

  Widget _buildActionCard(
    ThemeData theme, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: theme.primaryColor, size: 28),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    ThemeData theme, {
    required IconData icon,
    required String title,
  }) {
    return Row(
      children: [
        Icon(icon, color: theme.primaryColor, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoContainer(
    ThemeData theme, {
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsRow(ThemeData theme, String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: value,
            onChanged: (val) {},
            activeThumbColor: theme.primaryColor,
            activeTrackColor: theme.primaryColor.withValues(alpha: 0.2),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Colors.white10, height: 1, thickness: 1);
  }

  Widget _buildDocumentCard(
    ThemeData theme, {
    required IconData icon,
    required String title,
    required String status,
  }) {
    final isVerified = status == "VERIFIED";
    final badgeColor = isVerified ? Colors.green : Colors.orange;
    final badgeText = isVerified ? "VERIFIED" : "PENDING REVIEW";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: badgeColor.withValues(alpha: 0.3)),
            ),
            child: Text(
              badgeText,
              style: TextStyle(
                color: badgeColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(ThemeData theme) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.redAccent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.redAccent.withValues(alpha: 0.15)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.redAccent, size: 20),
            SizedBox(width: 8),
            Text(
              'Cerrar sesión',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(ThemeData theme, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              'Volver',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
