import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/features/register_driver/domain/entities/department_entity.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_form_provider.dart';

class DriverDepartmentDropdown extends ConsumerStatefulWidget {
  const DriverDepartmentDropdown({super.key});

  @override
  ConsumerState<DriverDepartmentDropdown> createState() =>
      _DriverDepartmentDropdownState();
}

class _DriverDepartmentDropdownState
    extends ConsumerState<DriverDepartmentDropdown> {
  @override
  Widget build(BuildContext context) {
    final departments = ref.watch(departmentsListProvider);
    final departmentSelected = ref.watch(departmentSelectedProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          department.i18n,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.15.h),
        Container(
          width: 40.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.tertiary.withValues(alpha: 0.2),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.45),
              width: 1.25,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: departments.when(
              data: (data) {
                data.sort((a, b) => a.name.compareTo(b.name));
                return DropdownButton<DepartmentEntity>(
                  value: departmentSelected,
                  underline: const SizedBox(),
                  isExpanded: true,
                  menuMaxHeight: 25.h,
                  dropdownColor: Theme.of(context).colorScheme.tertiary,
                  items: data.map((department) {
                    return DropdownMenuItem<DepartmentEntity>(
                      value: department,
                      child: Text(
                        department.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    ref
                        .read(departmentSelectedProvider.notifier)
                        .setDepartment(value!);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error')),
            ),
          ),
        ),
      ],
    );
  }
}
