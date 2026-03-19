import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/providers/dio_provider.dart';
import 'package:texi_driver/features/profile/domain/entities/driver_profile_entity.dart';
import 'package:texi_driver/features/profile/domain/repo/driver_profile_repo.dart';
import 'package:texi_driver/features/profile/data/repo_impl/driver_profile_repo_impl.dart';

final driverProfileRepoProvider = Provider<DriverProfileRepo>((ref) {
  return DriverProfileRepoImpl();
});

class ProfileNotifier extends AsyncNotifier<DriverProfileEntity> {
  @override
  Future<DriverProfileEntity> build() async {
    return _fetchProfile();
  }

  Future<DriverProfileEntity> _fetchProfile() async {
    final repo = ref.read(driverProfileRepoProvider);
    final dio = ref.read(dioProvider);
    final response = await repo.getProfile(dio);
    return response.data!;
  }

  Future<void> updateProfile(DriverProfileEntity profile) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(driverProfileRepoProvider);
      final dio = ref.read(dioProvider);
      final response = await repo.updateProfile(profile, dio);
      return response.data!;
    });
  }
}

final driverProfileNotifierProvider =
    AsyncNotifierProvider<ProfileNotifier, DriverProfileEntity>(
      ProfileNotifier.new,
    );
