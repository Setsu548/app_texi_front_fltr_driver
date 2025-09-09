import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/link_text_secondary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/star_rating_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelRatingView extends HookWidget {
  const TravelRatingView({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleText('${context.intl.titleTextTripRatingQuestion} Maria?'),
        LabelText('${context.intl.labelTextDestination} Centro Comercial Plaza Mayor'),
        SizedBox(height: 20),
        StarRating(
          onRatingChanged: (newRating) {},
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: LabelText(context.intl.labelTextAdditionalComments, textAlign: TextAlign.start)),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: 5, 
          decoration: InputDecoration(
            hintText: context.intl.textFieldHintTellMore,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
        SizedBox(height: 20),
        PrimaryButton(text: context.intl.primaryButtonSendRating, onPressed: (){}),
        SizedBox(height: 20),
        LinkTextSecondary(context.intl.linkTextSecondarySkipForNow, onTap: (){})
      ],
    );
  }
}