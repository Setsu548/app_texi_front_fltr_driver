import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @labelLaborCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría laboral'**
  String get labelLaborCategory;

  /// No description provided for @labelInitialAdvisor.
  ///
  /// In es, this message translates to:
  /// **'Asesor inicial'**
  String get labelInitialAdvisor;

  /// No description provided for @commonCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar Viaje'**
  String get commonCancel;

  /// No description provided for @labelFastestSafestTravel.
  ///
  /// In es, this message translates to:
  /// **'Plataforma para conductores'**
  String get labelFastestSafestTravel;

  /// No description provided for @primaryVariantButtonSignIn.
  ///
  /// In es, this message translates to:
  /// **'Iniciar Sesión'**
  String get primaryVariantButtonSignIn;

  /// No description provided for @linkTextPrimaryRegister.
  ///
  /// In es, this message translates to:
  /// **'Registrarse'**
  String get linkTextPrimaryRegister;

  /// No description provided for @commonRequiredFieldError.
  ///
  /// In es, this message translates to:
  /// **'Este campo es obligatorio'**
  String get commonRequiredFieldError;

  /// No description provided for @labelTextCurrentStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado actual'**
  String get labelTextCurrentStatus;

  /// No description provided for @bodyTextActive.
  ///
  /// In es, this message translates to:
  /// **'Activo'**
  String get bodyTextActive;

  /// No description provided for @bodyTextTrajectory.
  ///
  /// In es, this message translates to:
  /// **'Tu trayectoria junto a TEXI'**
  String get bodyTextTrajectory;

  /// No description provided for @labelTextTripsAttended.
  ///
  /// In es, this message translates to:
  /// **'En viajes atendidos'**
  String get labelTextTripsAttended;

  /// No description provided for @labelTextCompletedTrips.
  ///
  /// In es, this message translates to:
  /// **'Viajes completados:'**
  String get labelTextCompletedTrips;

  /// No description provided for @titleTextTravelRequests.
  ///
  /// In es, this message translates to:
  /// **'Solicitudes de viaje'**
  String get titleTextTravelRequests;

  /// No description provided for @labelTextSelectRequest.
  ///
  /// In es, this message translates to:
  /// **'Selecciona una solicitud para aceptar'**
  String get labelTextSelectRequest;

  /// No description provided for @labelTextPickup.
  ///
  /// In es, this message translates to:
  /// **'Recogida'**
  String get labelTextPickup;

  /// No description provided for @labelTextDestination.
  ///
  /// In es, this message translates to:
  /// **'Destino'**
  String get labelTextDestination;

  /// No description provided for @labelTextDetail.
  ///
  /// In es, this message translates to:
  /// **'Detalle'**
  String get labelTextDetail;

  /// No description provided for @labelTextDistance.
  ///
  /// In es, this message translates to:
  /// **'Distancia'**
  String get labelTextDistance;

  /// No description provided for @labelTextEstimatedTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo estimado'**
  String get labelTextEstimatedTime;

  /// No description provided for @labelTextEarnings.
  ///
  /// In es, this message translates to:
  /// **'Ganancias'**
  String get labelTextEarnings;

  /// No description provided for @commonAccept.
  ///
  /// In es, this message translates to:
  /// **'Aceptar'**
  String get commonAccept;

  /// No description provided for @titleTextTravelDetails.
  ///
  /// In es, this message translates to:
  /// **'Detalles del Viaje'**
  String get titleTextTravelDetails;

  /// No description provided for @labelTextInProgress.
  ///
  /// In es, this message translates to:
  /// **'En progreso'**
  String get labelTextInProgress;

  /// No description provided for @bodyTextTravelInfo.
  ///
  /// In es, this message translates to:
  /// **'Información del viaje'**
  String get bodyTextTravelInfo;

  /// No description provided for @labelTextPaymentMethod.
  ///
  /// In es, this message translates to:
  /// **'Método de pago'**
  String get labelTextPaymentMethod;

  /// No description provided for @labelTextServiceType.
  ///
  /// In es, this message translates to:
  /// **'Tipo de servicio'**
  String get labelTextServiceType;

  /// No description provided for @primaryVariantButtonAcceptTrip.
  ///
  /// In es, this message translates to:
  /// **'Aceptar Viaje'**
  String get primaryVariantButtonAcceptTrip;

  /// No description provided for @secondaryVariantButtonBack.
  ///
  /// In es, this message translates to:
  /// **'Regresar'**
  String get secondaryVariantButtonBack;

  /// No description provided for @labelTextTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo'**
  String get labelTextTime;

  /// No description provided for @labelTextTariff.
  ///
  /// In es, this message translates to:
  /// **'Tarifa'**
  String get labelTextTariff;

  /// No description provided for @primaryVariantButtonHowToGet.
  ///
  /// In es, this message translates to:
  /// **'Cómo llegar'**
  String get primaryVariantButtonHowToGet;

  /// No description provided for @infoTileFlatPickupPoint.
  ///
  /// In es, this message translates to:
  /// **'Punto de recogida'**
  String get infoTileFlatPickupPoint;

  /// No description provided for @labelTextWaitingTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo de espera'**
  String get labelTextWaitingTime;

  /// No description provided for @primaryVariantButtonIArrived.
  ///
  /// In es, this message translates to:
  /// **'He llegado'**
  String get primaryVariantButtonIArrived;

  /// No description provided for @secondaryVariantButtonMessage.
  ///
  /// In es, this message translates to:
  /// **'Mensaje'**
  String get secondaryVariantButtonMessage;

  /// No description provided for @primaryVariantButtonStartTrip.
  ///
  /// In es, this message translates to:
  /// **'Iniciar viaje'**
  String get primaryVariantButtonStartTrip;

  /// No description provided for @primaryVariantButtonEndTrip.
  ///
  /// In es, this message translates to:
  /// **'Finalizar viaje'**
  String get primaryVariantButtonEndTrip;

  /// No description provided for @titleTextTripRatingQuestion.
  ///
  /// In es, this message translates to:
  /// **'Cómo fue tu viaje con'**
  String get titleTextTripRatingQuestion;

  /// No description provided for @labelTextAdditionalComments.
  ///
  /// In es, this message translates to:
  /// **'Comentarios adicionales (opcional)'**
  String get labelTextAdditionalComments;

  /// No description provided for @textFieldHintTellMore.
  ///
  /// In es, this message translates to:
  /// **'Cuéntanos más sobre tu pasajero...'**
  String get textFieldHintTellMore;

  /// No description provided for @primaryButtonSendRating.
  ///
  /// In es, this message translates to:
  /// **'Enviar calificación'**
  String get primaryButtonSendRating;

  /// No description provided for @linkTextSecondarySkipForNow.
  ///
  /// In es, this message translates to:
  /// **'Omitir por ahora'**
  String get linkTextSecondarySkipForNow;

  /// No description provided for @titleTextActivateTexi.
  ///
  /// In es, this message translates to:
  /// **'Activar TEXI'**
  String get titleTextActivateTexi;

  /// No description provided for @titleTextFacialIdentification.
  ///
  /// In es, this message translates to:
  /// **'Identificación Facial'**
  String get titleTextFacialIdentification;

  /// No description provided for @bodyTextFaceInstruction.
  ///
  /// In es, this message translates to:
  /// **'Por favor, coloca tu rostro frente a la cámara para verificar tu identidad y comienza a recibir viajes'**
  String get bodyTextFaceInstruction;

  /// No description provided for @labelTextWellLitPlaceWarning.
  ///
  /// In es, this message translates to:
  /// **'Asegúrate de estar en un lugar bien iluminado, sin prendas adicionales (gorra, anteojos, bufanda...)'**
  String get labelTextWellLitPlaceWarning;

  /// No description provided for @primaryVariantButtonStartScan.
  ///
  /// In es, this message translates to:
  /// **'Iniciar Escaneo'**
  String get primaryVariantButtonStartScan;

  /// No description provided for @labelTextBiometricInfoProtection.
  ///
  /// In es, this message translates to:
  /// **'Tu información biométrica está protegida y solo se usa para verificar tu identidad'**
  String get labelTextBiometricInfoProtection;

  /// No description provided for @titleTextTexiRegister.
  ///
  /// In es, this message translates to:
  /// **'TEXI REGISTRO'**
  String get titleTextTexiRegister;

  /// No description provided for @titleTextWelcomeDriver.
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenido\nConductor!'**
  String get titleTextWelcomeDriver;

  /// No description provided for @bodyTextWelcomeMessage.
  ///
  /// In es, this message translates to:
  /// **'Estamos emocionados de que te unas a nuestra plataforma. Para comenzar a trabajar, necesitamos algunos datos importantes.'**
  String get bodyTextWelcomeMessage;

  /// No description provided for @labelTextCompleteDataInfo.
  ///
  /// In es, this message translates to:
  /// **'Es importante completar todos los datos correctamente para garantizar una verificación rápida y sin problemas'**
  String get labelTextCompleteDataInfo;

  /// No description provided for @primaryVariantButtonStartRegistration.
  ///
  /// In es, this message translates to:
  /// **'Comenzar Registro'**
  String get primaryVariantButtonStartRegistration;

  /// No description provided for @labelTextTermsAndConditions.
  ///
  /// In es, this message translates to:
  /// **'Al registrarte, aceptas nuestros términos y condiciones de servicio'**
  String get labelTextTermsAndConditions;

  /// No description provided for @secondaryVariantButtonCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get secondaryVariantButtonCancel;

  /// No description provided for @titleTextPersonalInfo.
  ///
  /// In es, this message translates to:
  /// **'Información Personal'**
  String get titleTextPersonalInfo;

  /// No description provided for @labelTextEnterPersonalData.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa tus datos personales'**
  String get labelTextEnterPersonalData;

  /// No description provided for @labeledTextFieldFirstName.
  ///
  /// In es, this message translates to:
  /// **'Nombres*'**
  String get labeledTextFieldFirstName;

  /// No description provided for @labeledTextFieldFirstNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Juan Diego'**
  String get labeledTextFieldFirstNameHint;

  /// No description provided for @labeledTextFieldLastName.
  ///
  /// In es, this message translates to:
  /// **'Apellidos*'**
  String get labeledTextFieldLastName;

  /// No description provided for @labeledTextFieldLastNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Dias Soto'**
  String get labeledTextFieldLastNameHint;

  /// No description provided for @labeledTextFieldPhoneNumber.
  ///
  /// In es, this message translates to:
  /// **'Número de Teléfono*'**
  String get labeledTextFieldPhoneNumber;

  /// No description provided for @labeledTextFieldAddress.
  ///
  /// In es, this message translates to:
  /// **'Dirección*'**
  String get labeledTextFieldAddress;

  /// No description provided for @labeledTextFieldAddressHint.
  ///
  /// In es, this message translates to:
  /// **'Calle, número, barrio'**
  String get labeledTextFieldAddressHint;

  /// No description provided for @labeledDropdownDepartment.
  ///
  /// In es, this message translates to:
  /// **'Departamento*'**
  String get labeledDropdownDepartment;

  /// No description provided for @labeledDropdownDepartmentHint.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu departamento'**
  String get labeledDropdownDepartmentHint;

  /// No description provided for @labeledDropdownProvince.
  ///
  /// In es, this message translates to:
  /// **'Provincia*'**
  String get labeledDropdownProvince;

  /// No description provided for @labeledDropdownProvinceHint.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu provincia'**
  String get labeledDropdownProvinceHint;

  /// No description provided for @labeledTextFieldEmail.
  ///
  /// In es, this message translates to:
  /// **'Correo Electrónico*'**
  String get labeledTextFieldEmail;

  /// No description provided for @labeledTextFieldEmailHint.
  ///
  /// In es, this message translates to:
  /// **'ejemplo@correo.com'**
  String get labeledTextFieldEmailHint;

  /// No description provided for @primaryVariantButtonContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get primaryVariantButtonContinue;

  /// No description provided for @titleTextIdentityVerification.
  ///
  /// In es, this message translates to:
  /// **'Verificación de Identidad'**
  String get titleTextIdentityVerification;

  /// No description provided for @labelTextIdentityInstruction.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingrese su número de identificación y suba las imágenes requeridas para verificar su identidad'**
  String get labelTextIdentityInstruction;

  /// No description provided for @labeledTextFieldIdNumber.
  ///
  /// In es, this message translates to:
  /// **'Número de Identificación*'**
  String get labeledTextFieldIdNumber;

  /// No description provided for @labeledTextFieldIdNumberHint.
  ///
  /// In es, this message translates to:
  /// **'Ingrese su número de identificación'**
  String get labeledTextFieldIdNumberHint;

  /// No description provided for @labelTextIdNumberInfo.
  ///
  /// In es, this message translates to:
  /// **'Ingrese su número que aparece en su documento de identidad'**
  String get labelTextIdNumberInfo;

  /// No description provided for @bodyTextIdPhoto.
  ///
  /// In es, this message translates to:
  /// **'Foto del Documento de Identidad'**
  String get bodyTextIdPhoto;

  /// No description provided for @photoCaptureFrontDocumentTitle.
  ///
  /// In es, this message translates to:
  /// **'Parte frontal del documento'**
  String get photoCaptureFrontDocumentTitle;

  /// No description provided for @photoCaptureFrontDocumentDescription.
  ///
  /// In es, this message translates to:
  /// **'Asegúrese de que toda la información sea visible'**
  String get photoCaptureFrontDocumentDescription;

  /// No description provided for @photoCaptureBackDocumentTitle.
  ///
  /// In es, this message translates to:
  /// **'Parte trasera del documento'**
  String get photoCaptureBackDocumentTitle;

  /// No description provided for @photoCaptureBackDocumentDescription.
  ///
  /// In es, this message translates to:
  /// **'Asegúrese de que toda la información sea visible'**
  String get photoCaptureBackDocumentDescription;

  /// No description provided for @photoCaptureProfileTitle.
  ///
  /// In es, this message translates to:
  /// **'Foto para su perfil'**
  String get photoCaptureProfileTitle;

  /// No description provided for @photoCaptureProfileDescription.
  ///
  /// In es, this message translates to:
  /// **'Tome una foto clara de tu rostro'**
  String get photoCaptureProfileDescription;

  /// No description provided for @photoCaptureProfileButton.
  ///
  /// In es, this message translates to:
  /// **'Tomar Foto'**
  String get photoCaptureProfileButton;

  /// No description provided for @secondaryVariantButtonContinueLater.
  ///
  /// In es, this message translates to:
  /// **'Continuar Después'**
  String get secondaryVariantButtonContinueLater;

  /// No description provided for @titleTextDriverLicenseVerification.
  ///
  /// In es, this message translates to:
  /// **'Verificación de Licencia'**
  String get titleTextDriverLicenseVerification;

  /// No description provided for @labelTextDriverLicenseInstruction.
  ///
  /// In es, this message translates to:
  /// **'Por favor sube las imágenes de tu documento para verificar tu licencia'**
  String get labelTextDriverLicenseInstruction;

  /// No description provided for @labeledDropdownLicenseCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría de Licencia'**
  String get labeledDropdownLicenseCategory;

  /// No description provided for @labeledDropdownLicenseCategoryHint.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar categoría'**
  String get labeledDropdownLicenseCategoryHint;

  /// No description provided for @bodyTextDriverLicensePhoto.
  ///
  /// In es, this message translates to:
  /// **'Foto de Licencia de Conducir'**
  String get bodyTextDriverLicensePhoto;

  /// No description provided for @photoOptionsFrontTitle.
  ///
  /// In es, this message translates to:
  /// **'Lado Frontal'**
  String get photoOptionsFrontTitle;

  /// No description provided for @photoOptionsFrontButtonTake.
  ///
  /// In es, this message translates to:
  /// **'Subir foto'**
  String get photoOptionsFrontButtonTake;

  /// No description provided for @photoOptionsFrontButtonUpload.
  ///
  /// In es, this message translates to:
  /// **'Usar camara'**
  String get photoOptionsFrontButtonUpload;

  /// No description provided for @photoOptionsBackTitle.
  ///
  /// In es, this message translates to:
  /// **'Lado Posterior'**
  String get photoOptionsBackTitle;

  /// No description provided for @titleTextRegistrationConfirmation.
  ///
  /// In es, this message translates to:
  /// **'¡Datos del registro!'**
  String get titleTextRegistrationConfirmation;

  /// No description provided for @labelTextVerifyData.
  ///
  /// In es, this message translates to:
  /// **'Por favor verifique que los datos que se enviarán a su revisión son los correctos'**
  String get labelTextVerifyData;

  /// No description provided for @bodyTextInformationSummary.
  ///
  /// In es, this message translates to:
  /// **'Resumen de información'**
  String get bodyTextInformationSummary;

  /// No description provided for @bodyTextPersonalInformation.
  ///
  /// In es, this message translates to:
  /// **'Información\nPersonal'**
  String get bodyTextPersonalInformation;

  /// No description provided for @linkTextEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar'**
  String get linkTextEdit;

  /// No description provided for @bodyTextName.
  ///
  /// In es, this message translates to:
  /// **'Nombre:'**
  String get bodyTextName;

  /// No description provided for @bodyTextCI.
  ///
  /// In es, this message translates to:
  /// **'CI:'**
  String get bodyTextCI;

  /// No description provided for @bodyTextPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono:'**
  String get bodyTextPhone;

  /// No description provided for @bodyTextEmail.
  ///
  /// In es, this message translates to:
  /// **'Email:'**
  String get bodyTextEmail;

  /// No description provided for @bodyTextLicenseCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría:'**
  String get bodyTextLicenseCategory;

  /// No description provided for @primaryVariantButtonSubmitRequest.
  ///
  /// In es, this message translates to:
  /// **'Enviar Solicitud'**
  String get primaryVariantButtonSubmitRequest;

  /// No description provided for @bodyTextAllDataSubmitted.
  ///
  /// In es, this message translates to:
  /// **'Todos los datos han sido enviados para ser verificados. Recibirás un mensaje con la confirmación y los próximos pasos a seguir'**
  String get bodyTextAllDataSubmitted;

  /// No description provided for @titleTextVehicleSelection.
  ///
  /// In es, this message translates to:
  /// **'Selección de Vehículo'**
  String get titleTextVehicleSelection;

  /// No description provided for @bodyTextVehicleInstruction.
  ///
  /// In es, this message translates to:
  /// **'Por favor selecciona una de las siguientes opciones para continuar con el proceso de registro'**
  String get bodyTextVehicleInstruction;

  /// No description provided for @primaryVariantButtonRegisterNewVehicle.
  ///
  /// In es, this message translates to:
  /// **'Registrar vehículo nuevo'**
  String get primaryVariantButtonRegisterNewVehicle;

  /// No description provided for @primaryVariantButtonSelectRegisteredVehicle.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar Vehículo Registrado'**
  String get primaryVariantButtonSelectRegisteredVehicle;

  /// No description provided for @bodyTextRegisteredVehicleInfo.
  ///
  /// In es, this message translates to:
  /// **'Si ya ha registrado un vehículo anteriormente puede seleccionarlo de la lista de vehículos registrados. De lo contrario, registre un nuevo vehículo para comenzar'**
  String get bodyTextRegisteredVehicleInfo;

  /// No description provided for @titleTextVehicleInfo.
  ///
  /// In es, this message translates to:
  /// **'Información del Vehículo'**
  String get titleTextVehicleInfo;

  /// No description provided for @labelTextEnterVehicleData.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa los detalles de tu vehículo para completar tu registro como conductor TEXI.'**
  String get labelTextEnterVehicleData;

  /// No description provided for @labeledDropdownVehicleBrand.
  ///
  /// In es, this message translates to:
  /// **'Marca del Vehículo*'**
  String get labeledDropdownVehicleBrand;

  /// No description provided for @labeledDropdownVehicleBrandHint.
  ///
  /// In es, this message translates to:
  /// **'Selecciona una marca'**
  String get labeledDropdownVehicleBrandHint;

  /// No description provided for @labeledTextFieldVehicleModel.
  ///
  /// In es, this message translates to:
  /// **'Modelo*'**
  String get labeledTextFieldVehicleModel;

  /// No description provided for @labeledTextFieldVehicleModelHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Corolla, Civic, Sentra'**
  String get labeledTextFieldVehicleModelHint;

  /// No description provided for @labeledDropdownVehicleYear.
  ///
  /// In es, this message translates to:
  /// **'Año*'**
  String get labeledDropdownVehicleYear;

  /// No description provided for @labeledDropdownVehicleYearHint.
  ///
  /// In es, this message translates to:
  /// **'Selecciona el año'**
  String get labeledDropdownVehicleYearHint;

  /// No description provided for @labeledTextFieldVehiclePlate.
  ///
  /// In es, this message translates to:
  /// **'Número de Placa'**
  String get labeledTextFieldVehiclePlate;

  /// No description provided for @labeledTextFieldVehiclePlateHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. 1234-ABC'**
  String get labeledTextFieldVehiclePlateHint;

  /// No description provided for @radioGroupVehicleColor.
  ///
  /// In es, this message translates to:
  /// **'Color*'**
  String get radioGroupVehicleColor;

  /// No description provided for @radioGroupVehicleType.
  ///
  /// In es, this message translates to:
  /// **'Tipo de Vehículo'**
  String get radioGroupVehicleType;

  /// No description provided for @bodyTextVehicleOwnership.
  ///
  /// In es, this message translates to:
  /// **'Tarjeta de Propiedad del Vehículo'**
  String get bodyTextVehicleOwnership;

  /// No description provided for @photoOptionsVehicleDocumentTitle.
  ///
  /// In es, this message translates to:
  /// **'Documento de propiedad'**
  String get photoOptionsVehicleDocumentTitle;

  /// No description provided for @photoOptionsVehicleDocumentButtonTake.
  ///
  /// In es, this message translates to:
  /// **'Subir foto'**
  String get photoOptionsVehicleDocumentButtonTake;

  /// No description provided for @photoOptionsVehicleDocumentButtonUpload.
  ///
  /// In es, this message translates to:
  /// **'Usar cámara'**
  String get photoOptionsVehicleDocumentButtonUpload;

  /// No description provided for @labelTextConfirmVehicleData.
  ///
  /// In es, this message translates to:
  /// **'Confirmo que la información proporcionada es correcta'**
  String get labelTextConfirmVehicleData;

  /// No description provided for @bodyTextVehicleInfoNotice.
  ///
  /// In es, this message translates to:
  /// **'Asegúrese de que los datos ingresados coincidan con los documentos oficiales del vehículo para evitar problemas durante la verificación'**
  String get bodyTextVehicleInfoNotice;

  /// No description provided for @titleTextVehiclePhotos.
  ///
  /// In es, this message translates to:
  /// **'Fotografías del Vehículo'**
  String get titleTextVehiclePhotos;

  /// No description provided for @labelTextVehiclePhotosInstruction.
  ///
  /// In es, this message translates to:
  /// **'Para completar el registro, necesitamos fotos claras de los cuatro lados de su vehículo'**
  String get labelTextVehiclePhotosInstruction;

  /// No description provided for @cardPrimaryContainerVehiclePhotosInfo.
  ///
  /// In es, this message translates to:
  /// **'Asegúrese de tomar las fotos con buena iluminación y que se vea claramente todo el vehículo en cada toma.'**
  String get cardPrimaryContainerVehiclePhotosInfo;

  /// No description provided for @bodyTextFront.
  ///
  /// In es, this message translates to:
  /// **'1. Frente del vehículo'**
  String get bodyTextFront;

  /// No description provided for @bodyTextLeftSide.
  ///
  /// In es, this message translates to:
  /// **'2. Lateral izquierdo'**
  String get bodyTextLeftSide;

  /// No description provided for @bodyTextRightSide.
  ///
  /// In es, this message translates to:
  /// **'3. Lateral derecho'**
  String get bodyTextRightSide;

  /// No description provided for @bodyTextBack.
  ///
  /// In es, this message translates to:
  /// **'4. Parte trasera'**
  String get bodyTextBack;

  /// No description provided for @photoPickerTapLabel.
  ///
  /// In es, this message translates to:
  /// **'Toque para tomar la foto'**
  String get photoPickerTapLabel;

  /// No description provided for @titleTextRegistrationConfirmationVehicle.
  ///
  /// In es, this message translates to:
  /// **'¡Datos del registro!'**
  String get titleTextRegistrationConfirmationVehicle;

  /// No description provided for @labelTextVerifyVehicleData.
  ///
  /// In es, this message translates to:
  /// **'Por favor verifique que los datos que se enviarán a su revisión son los correctos'**
  String get labelTextVerifyVehicleData;

  /// No description provided for @bodyTextVehicleInformation.
  ///
  /// In es, this message translates to:
  /// **'Información del Vehículo'**
  String get bodyTextVehicleInformation;

  /// No description provided for @labelVehicleBrand.
  ///
  /// In es, this message translates to:
  /// **'Marca:'**
  String get labelVehicleBrand;

  /// No description provided for @labelVehicleModel.
  ///
  /// In es, this message translates to:
  /// **'Modelo:'**
  String get labelVehicleModel;

  /// No description provided for @labelVehicleYear.
  ///
  /// In es, this message translates to:
  /// **'Año:'**
  String get labelVehicleYear;

  /// No description provided for @labelVehiclePlate.
  ///
  /// In es, this message translates to:
  /// **'Placa:'**
  String get labelVehiclePlate;

  /// No description provided for @labelVehicleCategory.
  ///
  /// In es, this message translates to:
  /// **'Categoría:'**
  String get labelVehicleCategory;

  /// No description provided for @labelVehicleColor.
  ///
  /// In es, this message translates to:
  /// **'Color:'**
  String get labelVehicleColor;

  /// No description provided for @bodyTextDocuments.
  ///
  /// In es, this message translates to:
  /// **'Documentos'**
  String get bodyTextDocuments;

  /// No description provided for @labelVehicleRegistrationCard.
  ///
  /// In es, this message translates to:
  /// **'Tarjeta de Circulación'**
  String get labelVehicleRegistrationCard;

  /// No description provided for @labelVehiclePhoto.
  ///
  /// In es, this message translates to:
  /// **'Foto del Vehículo'**
  String get labelVehiclePhoto;

  /// No description provided for @labelVehicleInsurance.
  ///
  /// In es, this message translates to:
  /// **'Seguro Obligatorio'**
  String get labelVehicleInsurance;

  /// No description provided for @labelTextAllDataSent.
  ///
  /// In es, this message translates to:
  /// **'Todos los datos han sido enviados para ser verificados. Recibirás un mensaje con la confirmación y los próximos pasos a seguir.'**
  String get labelTextAllDataSent;

  /// No description provided for @titleTextVehicleVerification.
  ///
  /// In es, this message translates to:
  /// **'Verificación de Vehículo'**
  String get titleTextVehicleVerification;

  /// No description provided for @bodyTextVehiclePlateInstruction.
  ///
  /// In es, this message translates to:
  /// **'Ingrese la placa del vehículo para verificar si está registrado en nuestro sistema y vincularlo como conductor.'**
  String get bodyTextVehiclePlateInstruction;

  /// No description provided for @labelTextVehiclePlateInfo.
  ///
  /// In es, this message translates to:
  /// **'La placa debe ingresarse sin espacios ni caracteres especiales\n(ejemplo: ABC123).'**
  String get labelTextVehiclePlateInfo;

  /// No description provided for @hintTextVehiclePlate.
  ///
  /// In es, this message translates to:
  /// **'Ingrese la placa aquí'**
  String get hintTextVehiclePlate;

  /// No description provided for @primaryVariantButtonVerifyVehicle.
  ///
  /// In es, this message translates to:
  /// **'Verificar Vehículo'**
  String get primaryVariantButtonVerifyVehicle;

  /// No description provided for @linkTextRegisterNewVehicle.
  ///
  /// In es, this message translates to:
  /// **'¿No tienes un vehículo registrado? registre uno nuevo'**
  String get linkTextRegisterNewVehicle;

  /// No description provided for @titleTextVehicleFound.
  ///
  /// In es, this message translates to:
  /// **'¡Vehículo encontrado!'**
  String get titleTextVehicleFound;

  /// No description provided for @bodyTextVehicleFoundInstruction.
  ///
  /// In es, this message translates to:
  /// **'Su petición será revisada por nuestro equipo en las próximas 24 horas.'**
  String get bodyTextVehicleFoundInstruction;

  /// No description provided for @bodyTextVehicleDetails.
  ///
  /// In es, this message translates to:
  /// **'Detalles del vehículo'**
  String get bodyTextVehicleDetails;

  /// No description provided for @labelTextVehiclePlate.
  ///
  /// In es, this message translates to:
  /// **'Placa:'**
  String get labelTextVehiclePlate;

  /// No description provided for @labelTextVehicleModel.
  ///
  /// In es, this message translates to:
  /// **'Modelo:'**
  String get labelTextVehicleModel;

  /// No description provided for @labelTextVehicleYear.
  ///
  /// In es, this message translates to:
  /// **'Año:'**
  String get labelTextVehicleYear;

  /// No description provided for @bodyTextVehicleNotificationInfo.
  ///
  /// In es, this message translates to:
  /// **'Recibirá una notificación cuando su solicitud haya sido verificada y aprobada.'**
  String get bodyTextVehicleNotificationInfo;

  /// No description provided for @primaryVariantButtonBackHome.
  ///
  /// In es, this message translates to:
  /// **'Volver al inicio'**
  String get primaryVariantButtonBackHome;

  /// No description provided for @secondaryVariantButtonCheckStatus.
  ///
  /// In es, this message translates to:
  /// **'Revisar estado'**
  String get secondaryVariantButtonCheckStatus;

  /// No description provided for @titleTextVehicleNotFound.
  ///
  /// In es, this message translates to:
  /// **'Vehículo no encontrado'**
  String get titleTextVehicleNotFound;

  /// No description provided for @bodyTextVehicleNotFoundInstruction.
  ///
  /// In es, this message translates to:
  /// **'La placa ingresada no está registrada en nuestro sistema. Por favor verifique los datos o registre el vehículo como nuevo.'**
  String get bodyTextVehicleNotFoundInstruction;

  /// No description provided for @labelTextVehicleNotFoundInfo.
  ///
  /// In es, this message translates to:
  /// **'Si está seguro que la placa es correcta, es posible que necesite registrar este vehículo en el sistema primero.'**
  String get labelTextVehicleNotFoundInfo;

  /// No description provided for @primaryVariantButtonRetry.
  ///
  /// In es, this message translates to:
  /// **'Volver a intentar'**
  String get primaryVariantButtonRetry;

  /// No description provided for @secondaryVariantButtonBackHome.
  ///
  /// In es, this message translates to:
  /// **'Regresar al inicio'**
  String get secondaryVariantButtonBackHome;

  /// No description provided for @bodyTextNeedRegisterVehicle.
  ///
  /// In es, this message translates to:
  /// **'¿Necesita registrar un vehículo nuevo?'**
  String get bodyTextNeedRegisterVehicle;

  /// No description provided for @labelTextRegisterVehicleInfo.
  ///
  /// In es, this message translates to:
  /// **'Si el vehículo no está en nuestro sistema, puede registrarlo fácilmente.'**
  String get labelTextRegisterVehicleInfo;

  /// No description provided for @labelPassword.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get labelPassword;

  /// No description provided for @sideMenuItemProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get sideMenuItemProfile;

  /// No description provided for @sideMenuItemHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get sideMenuItemHistory;

  /// No description provided for @sideMenuItemEarnings.
  ///
  /// In es, this message translates to:
  /// **'Ganancias'**
  String get sideMenuItemEarnings;

  /// No description provided for @sideMenuItemOperatorTexi.
  ///
  /// In es, this message translates to:
  /// **'Operador TEXI'**
  String get sideMenuItemOperatorTexi;

  /// No description provided for @sideMenuItemLogout.
  ///
  /// In es, this message translates to:
  /// **'SALIR'**
  String get sideMenuItemLogout;

  /// No description provided for @titleDriverProfileView.
  ///
  /// In es, this message translates to:
  /// **'Mi Perfil'**
  String get titleDriverProfileView;

  /// No description provided for @labelDriverProfileTrips.
  ///
  /// In es, this message translates to:
  /// **'viajes'**
  String get labelDriverProfileTrips;

  /// No description provided for @labelDriverProfileDriverSince.
  ///
  /// In es, this message translates to:
  /// **'Conductor desde'**
  String get labelDriverProfileDriverSince;

  /// No description provided for @bodyDriverProfileVehicleInfo.
  ///
  /// In es, this message translates to:
  /// **'Información del Vehículo'**
  String get bodyDriverProfileVehicleInfo;

  /// No description provided for @labelDriverProfileMakeModel.
  ///
  /// In es, this message translates to:
  /// **'Marca y Modelo'**
  String get labelDriverProfileMakeModel;

  /// No description provided for @labelDriverProfilePlate.
  ///
  /// In es, this message translates to:
  /// **'Placa'**
  String get labelDriverProfilePlate;

  /// No description provided for @labelDriverProfileColor.
  ///
  /// In es, this message translates to:
  /// **'Color'**
  String get labelDriverProfileColor;

  /// No description provided for @labelDriverProfileCapacity.
  ///
  /// In es, this message translates to:
  /// **'Capacidad'**
  String get labelDriverProfileCapacity;

  /// No description provided for @bodyDriverProfileDocuments.
  ///
  /// In es, this message translates to:
  /// **'Documentos'**
  String get bodyDriverProfileDocuments;

  /// No description provided for @bodyDriverProfileDriverLicense.
  ///
  /// In es, this message translates to:
  /// **'Licencia de conducir'**
  String get bodyDriverProfileDriverLicense;

  /// No description provided for @labelDriverProfileExpires.
  ///
  /// In es, this message translates to:
  /// **'Vence:'**
  String get labelDriverProfileExpires;

  /// No description provided for @labelDriverProfileVerified.
  ///
  /// In es, this message translates to:
  /// **'Verificado'**
  String get labelDriverProfileVerified;

  /// No description provided for @bodyDriverProfileVehicleInsurance.
  ///
  /// In es, this message translates to:
  /// **'Seguro vehicular'**
  String get bodyDriverProfileVehicleInsurance;

  /// No description provided for @bodyDriverProfileTechInspection.
  ///
  /// In es, this message translates to:
  /// **'Inspección técnica'**
  String get bodyDriverProfileTechInspection;

  /// No description provided for @cardDriverProfileTripHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial de Viajes'**
  String get cardDriverProfileTripHistory;

  /// No description provided for @cardDriverProfileEarnings.
  ///
  /// In es, this message translates to:
  /// **'Ganancias'**
  String get cardDriverProfileEarnings;

  /// No description provided for @bodyDriverProfileSettings.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get bodyDriverProfileSettings;

  /// No description provided for @labelDriverProfileNotifications.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get labelDriverProfileNotifications;

  /// No description provided for @labelDriverProfileDarkMode.
  ///
  /// In es, this message translates to:
  /// **'Modo oscuro'**
  String get labelDriverProfileDarkMode;

  /// No description provided for @labelDriverProfileSounds.
  ///
  /// In es, this message translates to:
  /// **'Sonidos'**
  String get labelDriverProfileSounds;

  /// No description provided for @btnDriverProfileLogout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get btnDriverProfileLogout;

  /// No description provided for @btnDriverProfileBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get btnDriverProfileBack;

  /// No description provided for @titleTravelHistoryView.
  ///
  /// In es, this message translates to:
  /// **'Historial de Viajes'**
  String get titleTravelHistoryView;

  /// No description provided for @labelTravelHistoryCompletedTrips.
  ///
  /// In es, this message translates to:
  /// **'viajes completados'**
  String get labelTravelHistoryCompletedTrips;

  /// No description provided for @bodyTravelHistoryFilterByDate.
  ///
  /// In es, this message translates to:
  /// **'Filtrar por fecha'**
  String get bodyTravelHistoryFilterByDate;

  /// No description provided for @linkTravelHistoryApply.
  ///
  /// In es, this message translates to:
  /// **'Aplicar'**
  String get linkTravelHistoryApply;

  /// No description provided for @labelTravelHistoryFrom.
  ///
  /// In es, this message translates to:
  /// **'Desde'**
  String get labelTravelHistoryFrom;

  /// No description provided for @labelTravelHistoryTo.
  ///
  /// In es, this message translates to:
  /// **'Hasta'**
  String get labelTravelHistoryTo;

  /// No description provided for @statusTripCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completado'**
  String get statusTripCompleted;

  /// No description provided for @titleDriverEarningsView.
  ///
  /// In es, this message translates to:
  /// **'Mis Ganancias'**
  String get titleDriverEarningsView;

  /// No description provided for @bodyDriverEarningsTotal.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get bodyDriverEarningsTotal;

  /// No description provided for @bodyDriverEarningsEarnings.
  ///
  /// In es, this message translates to:
  /// **'Ganancias'**
  String get bodyDriverEarningsEarnings;

  /// No description provided for @labelDriverEarningsThisMonth.
  ///
  /// In es, this message translates to:
  /// **'este mes'**
  String get labelDriverEarningsThisMonth;

  /// No description provided for @btnDriverEarningsDaily.
  ///
  /// In es, this message translates to:
  /// **'Diario'**
  String get btnDriverEarningsDaily;

  /// No description provided for @btnDriverEarningsWeekly.
  ///
  /// In es, this message translates to:
  /// **'Semanal'**
  String get btnDriverEarningsWeekly;

  /// No description provided for @btnDriverEarningsMonthly.
  ///
  /// In es, this message translates to:
  /// **'Mensual'**
  String get btnDriverEarningsMonthly;

  /// No description provided for @bodyDriverEarningsBreakdownByDay.
  ///
  /// In es, this message translates to:
  /// **'Desglose por día'**
  String get bodyDriverEarningsBreakdownByDay;

  /// No description provided for @bodyDriverEarningsPerformanceMetrics.
  ///
  /// In es, this message translates to:
  /// **'Métricas de rendimiento'**
  String get bodyDriverEarningsPerformanceMetrics;

  /// No description provided for @bodyDriverEarningsTripsCompleted.
  ///
  /// In es, this message translates to:
  /// **'Viajes completados'**
  String get bodyDriverEarningsTripsCompleted;

  /// No description provided for @bodyDriverEarningsKilometersTraveled.
  ///
  /// In es, this message translates to:
  /// **'Kilómetros recorridos'**
  String get bodyDriverEarningsKilometersTraveled;

  /// No description provided for @bodyDriverEarningsAvgPerTrip.
  ///
  /// In es, this message translates to:
  /// **'Promedio por viaje'**
  String get bodyDriverEarningsAvgPerTrip;

  /// No description provided for @bodyDriverEarningsAvgPerKm.
  ///
  /// In es, this message translates to:
  /// **'Promedio por km'**
  String get bodyDriverEarningsAvgPerKm;

  /// No description provided for @bodyDriverEarningsLastTrips.
  ///
  /// In es, this message translates to:
  /// **'Últimos viajes'**
  String get bodyDriverEarningsLastTrips;

  /// No description provided for @linkDriverEarningsSeeAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todo'**
  String get linkDriverEarningsSeeAll;

  /// No description provided for @bodyDriverEarningsComparisonPrevPeriod.
  ///
  /// In es, this message translates to:
  /// **'Comparación con periodo anterior'**
  String get bodyDriverEarningsComparisonPrevPeriod;

  /// No description provided for @labelDriverEarningsMetricEarnings.
  ///
  /// In es, this message translates to:
  /// **'Ganancias'**
  String get labelDriverEarningsMetricEarnings;

  /// No description provided for @labelDriverEarningsMetricTrips.
  ///
  /// In es, this message translates to:
  /// **'Viajes'**
  String get labelDriverEarningsMetricTrips;

  /// No description provided for @labelDriverEarningsMetricKilometers.
  ///
  /// In es, this message translates to:
  /// **'Kilómetros'**
  String get labelDriverEarningsMetricKilometers;

  /// No description provided for @titleDriverBonusesView.
  ///
  /// In es, this message translates to:
  /// **'Mis Bonificaciones'**
  String get titleDriverBonusesView;

  /// No description provided for @bodyDriverBonusesSummaryEarnings.
  ///
  /// In es, this message translates to:
  /// **'Resumen de mis Ganancias'**
  String get bodyDriverBonusesSummaryEarnings;

  /// No description provided for @labelDriverBonusesTotalEarnings.
  ///
  /// In es, this message translates to:
  /// **'Ganancias Totales'**
  String get labelDriverBonusesTotalEarnings;

  /// No description provided for @labelDriverBonusesBonuses.
  ///
  /// In es, this message translates to:
  /// **'Bonificaciones'**
  String get labelDriverBonusesBonuses;

  /// No description provided for @labelDriverBonusesTotal.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get labelDriverBonusesTotal;

  /// No description provided for @bodyDriverBonusesActive.
  ///
  /// In es, this message translates to:
  /// **'Bonificaciones Activas'**
  String get bodyDriverBonusesActive;

  /// No description provided for @statusDriverBonusesCompleted.
  ///
  /// In es, this message translates to:
  /// **'completados'**
  String get statusDriverBonusesCompleted;

  /// No description provided for @bodyDriverBonusesPerformanceRewards.
  ///
  /// In es, this message translates to:
  /// **'Recompensas por Desempeño'**
  String get bodyDriverBonusesPerformanceRewards;

  /// No description provided for @bodyDriverBonusesRating.
  ///
  /// In es, this message translates to:
  /// **'Calificación'**
  String get bodyDriverBonusesRating;

  /// No description provided for @bodyDriverBonusesFastTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo Rápido'**
  String get bodyDriverBonusesFastTime;

  /// No description provided for @bodyDriverBonusesTrips.
  ///
  /// In es, this message translates to:
  /// **'Viajes'**
  String get bodyDriverBonusesTrips;

  /// No description provided for @bodyDriverBonusesComments.
  ///
  /// In es, this message translates to:
  /// **'Comentarios'**
  String get bodyDriverBonusesComments;

  /// No description provided for @labelDriverBonusesThisMonth.
  ///
  /// In es, this message translates to:
  /// **'este mes'**
  String get labelDriverBonusesThisMonth;

  /// No description provided for @bodyDriverBonusesHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial de Bonificaciones'**
  String get bodyDriverBonusesHistory;

  /// No description provided for @titleCancelTripView.
  ///
  /// In es, this message translates to:
  /// **'Cancelar viaje'**
  String get titleCancelTripView;

  /// No description provided for @bodyCancelTripReasonIntro.
  ///
  /// In es, this message translates to:
  /// **'Indícanos el motivo de tu cancelación'**
  String get bodyCancelTripReasonIntro;

  /// No description provided for @bodyCancelTripQuestion.
  ///
  /// In es, this message translates to:
  /// **'¿Por qué deseas cancelar tu viaje?'**
  String get bodyCancelTripQuestion;

  /// No description provided for @labelCancelTripAddCommentOptional.
  ///
  /// In es, this message translates to:
  /// **'Añadir comentario (opcional)'**
  String get labelCancelTripAddCommentOptional;

  /// No description provided for @hintCancelTripAddComment.
  ///
  /// In es, this message translates to:
  /// **'Escribe un comentario adicional...'**
  String get hintCancelTripAddComment;

  /// No description provided for @labelCancelTripReasonVisibleTo.
  ///
  /// In es, this message translates to:
  /// **'El motivo seleccionado será visto por el conductor y TEXI'**
  String get labelCancelTripReasonVisibleTo;

  /// No description provided for @btnCancelTripConfirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar cancelación'**
  String get btnCancelTripConfirm;

  /// No description provided for @hintChatInputWriteMessage.
  ///
  /// In es, this message translates to:
  /// **'Escribe un mensaje...'**
  String get hintChatInputWriteMessage;

  /// No description provided for @statusPresenceOnline.
  ///
  /// In es, this message translates to:
  /// **'En línea'**
  String get statusPresenceOnline;

  /// No description provided for @btnCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get btnCancel;

  /// No description provided for @btnSelect.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar'**
  String get btnSelect;

  /// No description provided for @btnBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get btnBack;

  /// No description provided for @labelProfession.
  ///
  /// In es, this message translates to:
  /// **'Profesión'**
  String get labelProfession;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
