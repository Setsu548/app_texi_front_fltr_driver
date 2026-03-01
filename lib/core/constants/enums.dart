import 'package:flutter/material.dart';
import 'package:texi/core/lang/extension_lang.dart';

enum Gender {
  male,
  female;

  String get genders {
    switch (this) {
      case Gender.male:
        return maleI.i18n;
      case Gender.female:
        return femaleI.i18n;
    }
  }

  String get genderToSave {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }
}

enum LicenseCategory {
  a,
  b,
  c,
  m,
  p,
  t;

  String get licenseCategory {
    switch (this) {
      case LicenseCategory.a:
        return 'A';
      case LicenseCategory.b:
        return 'B';
      case LicenseCategory.c:
        return 'C';
      case LicenseCategory.m:
        return 'M';
      case LicenseCategory.p:
        return 'P';
      case LicenseCategory.t:
        return 'T';
    }
  }
}

enum VehicleColor {
  white(Colors.white, colorWhite),
  black(Colors.black, colorBlack),
  gray(Color(0xFF9CA3AF), colorGray),
  red(Color(0xFFEF4444), colorRed),
  blue(Color(0xFF3B82F6), colorBlue),
  yellow(Color(0xFFEAB308), colorYellow),
  orange(Color(0xFFF97316), colorOrange);

  final Color color;
  final String labelKey;
  const VehicleColor(this.color, this.labelKey);

  String get vehicleColorToSave {
    switch (this) {
      case VehicleColor.white:
        return 'white';
      case VehicleColor.black:
        return 'black';
      case VehicleColor.gray:
        return 'gray';
      case VehicleColor.red:
        return 'red';
      case VehicleColor.blue:
        return 'blue';
      case VehicleColor.yellow:
        return 'yellow';
      case VehicleColor.orange:
        return 'orange';
    }
  }
}

enum VehicleType {
  sedan(Icons.directions_car_outlined, typeSedan),
  hatchback(Icons.directions_car, typeHatchback),
  suv(Icons.airport_shuttle_outlined, typeSUV),
  minivan(Icons.airport_shuttle, typeMinivan);

  final IconData icon;
  final String labelKey;
  const VehicleType(this.icon, this.labelKey);

  String get vehicleTypeToSave {
    switch (this) {
      case VehicleType.sedan:
        return 'sedan';
      case VehicleType.hatchback:
        return 'hatchback';
      case VehicleType.suv:
        return 'suv';
      case VehicleType.minivan:
        return 'minivan';
    }
  }
}
