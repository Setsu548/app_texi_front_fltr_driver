import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFFD600), // Amarillo
  onPrimary: Color(0xFF000000), // Texto sobre amarillo
  primaryContainer: Color(0xFFFFF176), // Amarillo claro
  onPrimaryContainer: Color(0xFF000000),
  secondary: Color(0xFF212121), // Fondo oscuro secundario
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF424242),
  onSecondaryContainer: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFF000000), // Fondo negro
  onBackground: Color(0xFFFFFFFF), // Texto blanco
  surface: Color(0xFF121212), // Superficies
  onSurface: Color(0xFFFFFFFF),
  outline: Color(0xFF424242), // Bordes grises
  surfaceVariant: Color.fromARGB(255, 231, 122, 5),
  surfaceTint: Color(0xFFFFFFFF), // Texto blanco
);

class MainTheme {
  static ThemeData light() {
    var theme = ThemeData(
      fontFamily: 'Nexa',
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w900, fontSize: 57),
        headlineLarge: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w900, fontSize: 32),
        titleLarge: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 22),
        bodyLarge: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 16),
        labelLarge: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 14),
        displayMedium: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w900, fontSize: 30),
        headlineMedium: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w800, fontSize: 22),
        titleMedium: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w800, fontSize: 18),
        bodyMedium: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 16),
        labelMedium: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 14),
        displaySmall: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w900, fontSize: 36),
        headlineSmall: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w900, fontSize: 24),
        titleSmall: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 14),
        bodySmall: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 12),
        labelSmall: TextStyle(color: lightColorScheme.surfaceTint, fontWeight: FontWeight.w700, fontSize: 11),
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
      ),
      fontFamily: 'Nexa',
      textTheme: theme.textTheme,
      // cardTheme: CardTheme(
      //   elevation: 5,
      //   surfaceTintColor: Colors.transparent,
      //   color: lightColorScheme.secondary,
      // ),
      // dialogTheme: DialogTheme(
      //   elevation: 0,
      //   surfaceTintColor: Colors.transparent,
      //   backgroundColor: lightColorScheme.secondary,
      //   alignment: Alignment.center,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(12)),
      //   ),
      //   actionsPadding: const EdgeInsets.all(10.0),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(lightColorScheme.surface),
          elevation: const MaterialStatePropertyAll(5),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(lightColorScheme.primary),
          textStyle: MaterialStatePropertyAll(theme.textTheme.titleMedium),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(Size.zero),
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(2),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(5),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: lightColorScheme.outline,
              width: 2,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          foregroundColor: MaterialStatePropertyAll(lightColorScheme.surfaceTint),
          textStyle: MaterialStatePropertyAll(theme.textTheme.titleMedium!.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: lightColorScheme.surfaceTint,
          )),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return lightColorScheme.surfaceVariant;
            }
            return lightColorScheme.surfaceTint;
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return lightColorScheme.surfaceVariant.withOpacity(0.1);
            }
            return Colors.transparent;
          }),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        backgroundColor: lightColorScheme.secondary,
        extendedTextStyle: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(5),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return lightColorScheme.primary;
            } else {
              return lightColorScheme.surface;
            }
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return lightColorScheme.onPrimary;
            } else {
              return lightColorScheme.primary;
            }
          }),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              side: BorderSide(
                color: lightColorScheme.outline,
                width: 2,
              ),
            ),
          ),
          side: MaterialStatePropertyAll(
            BorderSide(
              color: lightColorScheme.outline,
              width: 2,
            ),
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: lightColorScheme.surface,
        showCheckmark: false,
        selectedColor: lightColorScheme.primary,
        labelPadding: const EdgeInsets.all(5.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        side: BorderSide(
          color: lightColorScheme.outline,
          width: 2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: theme.textTheme.bodyMedium!.copyWith(color: lightColorScheme.surfaceTint.withOpacity(0.5)),
        fillColor: lightColorScheme.surface,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightColorScheme.outline,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightColorScheme.outline,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightColorScheme.primary,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightColorScheme.primary,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lightColorScheme.primary,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        //isDense: true,
        contentPadding: const EdgeInsets.all(12), // Added this
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: 0,
        contentTextStyle: theme.textTheme.bodyMedium,
        backgroundColor: lightColorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: lightColorScheme.secondary,
      ),
      extensions: [CustomExtensions(colorScheme: lightColorScheme)],
      dividerTheme: const DividerThemeData(
        color: Colors.grey,
        thickness: 1,
      ),
    );
  }

  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: lightColorScheme.primary,
      ),
    );
  }
}

class CustomExtensions extends ThemeExtension<CustomExtensions> {
  CustomExtensions({
    required this.colorScheme,
  }) {
    secondaryOnSurfaceButtonStyle = ButtonStyle(
      overlayColor: WidgetStateProperty.all(colorScheme.surface.withOpacity(0.2)),
      foregroundColor: WidgetStatePropertyAll(colorScheme.surface),
      iconColor: WidgetStatePropertyAll(colorScheme.surface),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: colorScheme.surface,
          decoration: TextDecoration.underline,
          decorationColor: colorScheme.surface,
          fontSize: 14.0,
          height: 1.1,
          fontWeight: FontWeight.w700,
          fontFamily: 'Nexa',
        ),
      ),
    );
  }

  final ColorScheme colorScheme;

  late ButtonStyle secondaryOnSurfaceButtonStyle;

  @override
  ThemeExtension<CustomExtensions> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<CustomExtensions> lerp(covariant ThemeExtension<CustomExtensions>? other, double t) {
    return this;
  }
}

