import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/selectable_reason_item_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CancelTripView extends HookWidget {
  const CancelTripView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final selectedIndex = useState<int?>(null);

    final reasons = [
      'El pasajero no se presento en el punto de recogida',
      'El pasajero solicito mas asientos de los permitidos',
      'El pasajero se comporta de manera inapropiada',
      'El pasajero no coincide con la descripcion del perfil',
      'Problemas tecnicos con el vehiculo',
      'Preocupaciones de seguridad',
      'Otro motivo'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleCancelTripView),
        LabelText(context.intl.bodyCancelTripReasonIntro),
        SizedBox(height: 20),
        BodyText(context.intl.bodyCancelTripQuestion),
        SizedBox(height: 10),
        Column(
          children: List.generate(reasons.length, (i) {
            final selected = selectedIndex.value == i;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SelectableReasonItem(
                text: reasons[i],
                isSelected: selected,
                onTap: () => selectedIndex.value = i,
              ),
            );
          }),
        ),
        SizedBox(height: 10),
        LabelText(context.intl.labelCancelTripAddCommentOptional),
        SizedBox(height: 10),
        TextField(
          maxLines: 5, 
          decoration: InputDecoration(
            hintText: context.intl.hintCancelTripAddComment,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(12),
          ),
        ),
        SizedBox(height: 10),
        LabelText(context.intl.labelCancelTripReasonVisibleTo),
        SizedBox(height: 20),
        PrimaryButton(
          text: context.intl.btnCancelTripConfirm, 
          onPressed: (){}
        ),
        SizedBox(height: 20),
        SecondaryButton(
          text: context.intl.btnDriverProfileBack, 
          onPressed: (){
          appRouter.push('/dashboard/driver_pickup');
          }
        ),
      ],
    );
  }
}