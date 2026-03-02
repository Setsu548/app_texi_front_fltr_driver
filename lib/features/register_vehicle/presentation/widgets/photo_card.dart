import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/theme/styles_for_texts.dart';

class PhotoCard extends ConsumerWidget {
  final String title;
  final IconData icon;
  final File? imageFile;
  final VoidCallback onPickImage;

  const PhotoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.imageFile,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withValues(
          alpha: 0.15,
        ), // dark grey from other page
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(3.w),
      child: Column(
        children: [
          Container(
            height: 16.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
              image: imageFile != null
                  ? DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageFile == null
                ? Center(
                    child: Icon(
                      icon,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.85),
                      size: 40.sp,
                    ),
                  )
                : null,
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
                    style: StylesForTexts(context: context).headerStyleSmall(),
                  ),
                  SizedBox(height: 0.2.h),
                  Text(
                    requiredText.i18n,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: onPickImage,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
