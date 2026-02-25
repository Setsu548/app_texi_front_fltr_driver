import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';

class PhotoCard extends ConsumerWidget {
  final String title;
  final IconData icon;
  const PhotoCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1f2937), // dark grey from other page
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(3.w),
      child: Column(
        children: [
          Container(
            height: 16.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF374151), // lighter dark grey
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                icon,
                color: const Color(0xFF6B7280), // even lighter
                size: 40.sp,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.5.sp,
                    ),
                  ),
                  SizedBox(height: 0.2.h),
                  Text(
                    requiredText.i18n,
                    style: TextStyle(
                      color: const Color(0xFFFFD600),
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD600),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.black),
                  onPressed: () {
                    // TODO: Implement image picker
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
