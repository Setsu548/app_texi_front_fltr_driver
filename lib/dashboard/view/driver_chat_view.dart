import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/chat_day_divider_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/chat_input_bar_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/chat_message_bubble_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/person_info_chat_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_button_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverChatView extends HookWidget {
  const DriverChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final msgs = <Widget>[
      ChatMessageBubble(text: 'Hola, soy Carlos. Estoy esperando en la entrada principal del centro comercial. Llevo una camisa azul.', isMe: true, timeText: '10:15'),
      ChatMessageBubble(text: 'Perfecto, estoy llegando en 2 minutos. Mi auto es un Toyota Corolla gris, placa ABC-123', timeText: '10:16'),
      ChatMessageBubble(text: 'Gracias, te espero aqui', timeText: '10:18', isMe: true),
      ChatMessageBubble(text: 'Ya estoy llegando. Estoy en el semaforo frente al centro comercial.', timeText: '10:18'),
      ChatMessageBubble(text: 'Te veo en la entrada. Estoy a punto de llegar', timeText: '10:18'),
      ChatDayDivider(text: 'Hoy 10:20'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PersonInfoChat(
          name: 'Miguel Angel Rojas',
          avatarImage: NetworkImage(''),
        ),
        Divider(
          thickness: 8,
          color: lightColorScheme.secondaryContainer,
          height: 40,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            children: msgs,
          ),
        ),
        SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ChatInputBar(
                onTap: (){},
              ),
              SizedBox(height: 10),
              SecondaryButton(
                text: context.intl.btnBack,
                onPressed: () => appRouter.push('/dashboard/driver_pickup'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}