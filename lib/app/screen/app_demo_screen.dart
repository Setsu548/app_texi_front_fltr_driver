import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';

import '../widgets/avatar_text_widget.dart';
import '../widgets/body_text_bold_widget.dart';
import '../widgets/body_text_primary_widget.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/card_primary_widget.dart';
import '../widgets/card_secondary_widget.dart';
import '../widgets/card_tertiary_widget.dart';
import '../widgets/danger_button_widget.dart';
import '../widgets/double_icon_button_secondary_widget.dart';
import '../widgets/double_icon_button_widget.dart';
import '../widgets/dual_text_line_widget.dart';
import '../widgets/icon_text_button_widget.dart';
import '../widgets/image_info_card_widget.dart';
import '../widgets/info_tile_flat_secondary_widget.dart';
import '../widgets/info_tile_flat_widget.dart';
import '../widgets/info_tile_widget.dart';
import '../widgets/inline_button_widget.dart';
import '../widgets/link_text_primary_widget.dart';
import '../widgets/label_text_secondary_widget.dart';
import '../widgets/label_text_widget.dart';
import '../widgets/labeled_dropdown_widget.dart';
import '../widgets/labeled_text_field_widget.dart';
import '../widgets/link_text_secondary_widget.dart';
import '../widgets/primary_button_widget.dart';
import '../widgets/radio_group_row_widget.dart';
import '../widgets/radio_group_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/secondary_button_icon_widget.dart';
import '../widgets/secondary_button_widget.dart';
import '../widgets/small_text_secondary_widget.dart';
import '../widgets/small_text_widget.dart';
import '../widgets/star_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../theme/main_theme.dart';
import '../app_bar_logo.dart';
import '../app_scaffold.dart';
import '../widgets/title_text_widget.dart';

class AppDemoScreen extends HookWidget {
  const AppDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 5, initialIndex: 0);
    useListenable(controller);

    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogo(context),
      body: TabBarView(
        controller: controller,
        children: const [
          AppDemoTextsView(),
          AppDemoBtnView(),
          AppDemoCardView(),
          AppDemoFormView(),
          AppDemoOthersView(),
        ],
      ),
      bottomBar: SafeArea(
        // 👈 evita que se pegue a los botones del sistema
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Txt'),
            Tab(text: 'Btn'),
            Tab(text: 'Cards'),
            Tab(text: 'Form'),
            Tab(text: 'Otros'),
          ],
        ),
      ),
    );
  }
}

class AppDemoTextsView extends HookWidget {
  const AppDemoTextsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TitleText('TITLE TEXT'),
            ),
            Padding(padding: EdgeInsets.all(10), child: BodyText('BODY TEXT')),
            Padding(
              padding: EdgeInsets.all(10),
              child: BodyTextBold('BODY TEXT BOLD'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: BodyTextPrimary('BODY TEXT PRIMARY'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: LabelText('LABEL TEXT'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: LinkTextPrimary('LINK TEXT PRIMARY', onTap: () {}),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightColorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LabelTextSecondary('LABEL TEXT SECONDARY'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SmallText('SMALL TEXT'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightColorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SmallTextSecondary('SMALL TEXT SECONDARY'),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDemoBtnView extends HookWidget {
  const AppDemoBtnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PrimaryButton(text: 'Primary Button', onPressed: () {}),
              SizedBox(height: 10),
              PrimaryVariantButton(
                text: 'Primary Variant Button',
                onPressed: () {},
              ),
              SizedBox(height: 10),
              SecondaryButton(text: 'Secondary Button', onPressed: () {}),
              SizedBox(height: 10),
              SecondaryVariantButton(
                text: 'Secondary Variant Button',
                onPressed: () {},
              ),
              SizedBox(height: 10),
              DangerButton(text: 'Danger Button', onPressed: () {}),
              SizedBox(height: 10),
              InlineButton(text: 'Inline Button', onPressed: () {}),
              SizedBox(height: 10),
              IconTextButton(
                icon: Icons.add,
                label: 'Icon Text Button',
                onTap: () {},
              ),
              SizedBox(height: 10),
              DoubleIconButton(
                leadingIcon: Icons.send,
                title: 'Double Icon Button',
                description: 'description',
                trailingIcon: Icons.home,
                onTap: () {},
              ),
              SizedBox(height: 10),
              DoubleIconButtonSecondary(
                leadingIcon: Icons.home,
                title: 'Double Icon Button Secondary',
                description: 'description',
                trailingIcon: Icons.add,
                onTap: () {},
              ),
              SizedBox(height: 20),
              SecondaryButtonIcon(
                text: 'Secondary Button Icon',
                onPressed: () {},
                icon: Icons.home,
              ),
              SizedBox(height: 10),
              LinkTextPrimary('Link Text Primary', onTap: () {}),
              SizedBox(height: 10),
              LinkTextSecondary('Link Text Secondary', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDemoCardView extends HookWidget {
  const AppDemoCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CardPrimary(children: [Text('Card Primary')]),
            SizedBox(height: 10),
            CardSecondary(children: [Text('Card Secondary')]),
            SizedBox(height: 10),
            CardTertiary(children: [Text('Card Tertiary')]),
            SizedBox(height: 10),
            CardOnSurface(
              children: [
                BodyText('Card On Surface', color: lightColorScheme.surface),
              ],
            ),
            SizedBox(height: 10),
            CardPrimaryContainer(
              children: [
                BodyText('Card On Surface', color: lightColorScheme.surface),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTile(
                        icon: Icons.add,
                        label: 'Info Tile',
                        description: 'description',
                        onTap: () {},
                      ),
                      SizedBox(height: 16),
                      InfoTileFlat(
                        icon: Icons.restart_alt,
                        title: 'Info Tile Flat',
                        description: 'description',
                      ),
                      SizedBox(height: 16),
                      InfoTileFlatSecondary(
                        icon: Icons.home,
                        title: 'Info Tile Flat Secondary',
                        description: 'description',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageInfoCard(
                        imageUrl: 'assets/images/texi.png',
                        title: 'Image Info Card',
                        description: 'description',
                        price: '0',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppDemoFormView extends HookWidget {
  const AppDemoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardSecondary(
                children: [
                  LabeledTextField(label: "Nombres*", hint: "Ej. Juan Diego"),
                  LabeledTextField(label: "Apellidos*", hint: "Ej. Dias Soto"),
                  LabeledTextField(
                    label: "Numero de Telefono*",
                    hint: "77777777",
                    keyboardType: TextInputType.number,
                    prefixText: '+591',
                  ),
                  LabeledDropdown<String>(
                    label: "Departamento",
                    hint: "Selecciona una ciudad",
                    onChanged: (value) {},
                    items: [
                      DropdownMenuItem(
                        value: "Cochabamba",
                        child: BodyText(
                          "Cochabamba",
                          color: lightColorScheme.surface,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "La Paz",
                        child: BodyText(
                          "La Paz",
                          color: lightColorScheme.surface,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Santa Cruz",
                        child: BodyText(
                          "Santa Cruz",
                          color: lightColorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                  // RadioGroup(
                  //   label: 'Color*',
                  //   options: ["Blanco", "Negro", "Gris", "Rojo", "Azul", "Verde", "Plata", "Otro"],
                  // ),
                  RadioGroupRow(
                    label: 'Tipo de Vehiculo',
                    options: ["Sedan", "SUV", "Hatchback"],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDemoOthersView extends HookWidget {
  const AppDemoOthersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CustomSearchBar(
              icon: Icons.home,
              iconColor: lightColorScheme.primary,
              hintText: 'Custom Search Bar',
              suggestionsBuilder: (context, controller) {
                return [];
              },
            ),
            SizedBox(height: 10),
            AvatarText(text: 'Avatar Text'),
            SizedBox(height: 10),
            DualTextLine(leftText: 'Dual Text', rightText: 'Line'),
            SizedBox(height: 10),
            StarRating(),
          ],
        ),
      ),
    );
  }
}
