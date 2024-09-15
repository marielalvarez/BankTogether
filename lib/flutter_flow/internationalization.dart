import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Identificación',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'Inicia sesión',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Correo Electrónico',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Ingresa tu correo electrónico...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Ingresa tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'cy672f8m': {
      'en': 'Face ID',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fkc4esp8': {
      'en': 'Biometria',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qbmoi1av': {
      'en': 'Continuar',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'No tienes cuenta?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Regístrate',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // registerAccount
  {
    'oitrrwgg': {
      'en': 'Registrate',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'gcwdqm4g': {
      'en': 'Correo Electrónico',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Ingresa tu correo...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Contraseña',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Crea una contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'rzpiwq9p': {
      'en': 'Contraseña',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'eyfkffka': {
      'en': 'Confirma tu contraseña...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '3twynvfz': {
      'en': '¿Ya tienes cuenta?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '9ssznj0g': {
      'en': 'Inicia Sesión',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '3ugmx2zp': {
      'en': 'Iniciar Sesión',
      'ar': 'تواصل كضيف',
      'de': 'Als Gast fortfahren',
      'es': 'Continua como invitado',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Completa tu perfil',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Sube una foto para poder identifcarte ',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Nombre completo',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Edad',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'ejemplo: 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Tu puesto',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': '¿Cuál es tu puesto?',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'hbhd3bdt': {
      'en': 'Completar perfil',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'w75dikic': {
      'en': 'Saltar por ahora',
      'ar': 'تخطي في الوقت الراهن',
      'de': 'Für jetzt überspringen',
      'es': 'Saltar por ahora',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Olvidé mi contraseña',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Correo electrónico',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Escribe tu correo electrónico...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Enviar enlace de reinicio',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Crear presupuesto',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en':
          'Cree presupuestos que también pueda vincular transacciones para facilitar el seguimiento.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    'uf9k1spp': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'q30ina4f': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Creaar presupuesto',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createBudgetBegin
  {
    'xod9iwab': {
      'en': 'Crear Presupuesto',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'wih71x51': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'qk15nsmc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'biih9fl5': {
      'en': 'Título',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iphvcuwc': {
      'en': 'Descripción',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    '79au6dyg': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'cs1cy7tg': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_Card
  {
    'xn2so8km': {
      'en': 'Mi tarjeta',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    '9b0j67se': {
      'en': 'Ingresos',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'axrvkhrv': {
      'en': '+\$7,500',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    '0d7w9e0i': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'mggh8wu7': {
      'en': 'Gastos',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'c5bszisf': {
      'en': '-\$3,331',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    '85pb8msl': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    '8bnd6lco': {
      'en': 'Transferir',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'bh7qvhl1': {
      'en': 'Button',
      'ar': '',
      'de': '',
      'es': '',
    },
    '27pb7ji4': {
      'en': 'Historial de transacciones',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'xs4cn7uk': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'm8rhanhc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_Budgets
  {
    'cd0zp71n': {
      'en': 'Mi presupuesto',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'hfwbiivj': {
      'en': 'Ingreso',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'jjj3ydb1': {
      'en': '+\$12,402',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    'ns4vt604': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'wcsc04wg': {
      'en': 'Gasto',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'a5zzlh8f': {
      'en': '-\$8,392',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    'lp255jsc': {
      'en': '2.5% ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c81i1ybg': {
      'en': 'Gasto total',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'ah4t7cpx': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '0tsohlub': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '5y1u9kxg': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '4jknsif6': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o9rmbnd7': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'fn6kvat8': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '6uht91yb': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '1qm6rhod': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '65tvvjcw': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'c03678eq': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'de': 'Einzelheiten',
      'es': 'Detalles',
    },
    'zv72ekdw': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '0rjyjwed': {
      'en': 'Proveedor',
      'ar': 'بائع',
      'de': 'Verkäufer',
      'es': 'Vendedor',
    },
    'eeyn6dk2': {
      'en': 'Fecha',
      'ar': 'متى',
      'de': 'Wann',
      'es': 'Cuándo',
    },
    'lccxx6eu': {
      'en': 'Motivo',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'jzyax4hn': {
      'en': 'Gastado por',
      'ar': 'أنفقه',
      'de': 'Verbracht von',
      'es': 'gastado por',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'Mi Cuenta',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Editar Perfil',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Cambiar Contraseña',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Configuración de Notificaciones',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    '9aogde79': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'eojlfs66': {
      'en': 'Políticas de Privacidad',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // budgetDetails
  {
    'p0gf1lfy': {
      'en': 'Por mes',
      'ar': 'كل شهر',
      'de': 'Pro Monat',
      'es': 'Por mes',
    },
    'ti7ipegi': {
      'en': 'Gasto total',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'ifi6fmsa': {
      'en': 'Transacciones',
      'ar': 'المعاملات',
      'de': 'Transaktionen',
      'es': 'Actas',
    },
    'ak9m8szp': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferComplete
  {
    '2w0zzysg': {
      'en': 'Transferencia Exitosa',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a0l2ep2i': {
      'en':
          'Gran trabajo, transfiriste fondos con éxito. Es posible que los fondos tarden algunos días en salir de su cuenta.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zzmj59iy': {
      'en': 'Okay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transferir fondos',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Cambiar cuenta',
      'ar': 'تغير الحساب',
      'de': 'Account wechseln',
      'es': 'Cambiar cuenta',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'التحويل الداخلي',
      'de': 'Interner Transfer',
      'es': 'Transferencia interna',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'uxo87fjc': {
      'en': 'Tipo de transferencia',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد حساب',
      'de': 'Konto auswählen',
      'es': 'Seleccionar cuenta',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب **** 2010',
      'de': 'Konto ****2010',
      'es': 'Cuenta ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب **** 2011',
      'de': 'Konto ****2011',
      'es': 'Cuenta ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب **** 2012',
      'de': 'Konto ****2012',
      'es': 'Cuenta ****2012',
    },
    'ok5xluvk': {
      'en': 'Seleccionar cuenta',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wngoi0v4': {
      'en': 'Tu estado actualizado es de:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'xaw2jdst': {
      'en': 'Enviar Transferencia',
      'ar': 'أرسل حوالة',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
    },
    'xku4zxbe': {
      'en': 'Haz click para completar',
      'ar': 'اضغط أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Añadir Transacción',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'wgk0b6m8': {
      'en': 'Adaptar un presupuesto',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3170k9n1': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    'abz6nm8z': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    '3y95vtb6': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    '861el4k4': {
      'en': 'Seleccionar presupuesto',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    'swxms7ln': {
      'en': 'Motivo',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uqfgu088': {
      'en': 'Añadir transacción',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    '9stmpsf0': {
      'en': 'Haz click para completar',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'en': 'Editar Transaction',
      'ar': 'تحرير المعاملة',
      'de': 'Transaktion bearbeiten',
      'es': 'Editar transacción',
    },
    '5xgwlwjj': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '720k2d98': {
      'en': 'Gastado en',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'df1ingy2': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    '5kzmka3y': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'nvtz0bpd': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'l3bqo3oh': {
      'en': 'Seleccionar presupuesto',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    '0lw03w43': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'pk4vne1g': {
      'en': 'Hacer transacción',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pg18rcyu': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '12if11ss': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Editar perfil',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    'zoxan2gi': {
      'en': 'Cambiar foto',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Nombre Completo',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Correo electrónico',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'Edad',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Título',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Guardar cambios',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Cambiar Contraseña',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Correo electrónico',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Enviar enlace de reinicio',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notificaciones',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'gjygkr0n': {
      'en': 'Activar Notificaciones',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'en':
          'Reciba notificaciones push de nuestra aplicación de forma semiregular.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
    },
    '1ytebj35': {
      'en': 'Notificaciones de Correo',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
    },
    '9lvh5nst': {
      'en':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    '69d2j74u': {
      'en': 'Localicación de Servicos',
      'ar': 'خدمات الموقع',
      'de': 'Standortdienste',
      'es': 'Servicios de localización',
    },
    '3k8cuv0d': {
      'en':
          'Permítanos rastrear su ubicación, esto le ayuda a realizar un seguimiento de sus gastos y lo mantiene seguro.fe.',
      'ar':
          'اسمح لنا بتتبع موقعك ، فهذا يساعد على تتبع الإنفاق ويحافظ على سلامتك.',
      'de':
          'Erlauben Sie uns, Ihren Standort zu verfolgen, dies hilft, die Ausgaben im Auge zu behalten und schützt Sie.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de los gastos y lo mantiene seguro.',
    },
    'isgrgbfs': {
      'en': 'Guardar Cambios',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Políticas de Privacidad',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    'fvsfg5on': {
      'en': 'Cómo utilizamos tus datos',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
    },
    'nbiyrnzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage
  {
    'ucqlrrlk': {
      'en': 'Hola,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'c10wb3ot': {
      'en': 'Los detalles de su cuenta se\n encuentran a continuación.',
      'ar': 'تفاصيل حسابك أدناه.',
      'de': 'Ihre Kontodetails sind unten.',
      'es': 'Los detalles de su cuenta se encuentran a continuación.',
    },
    '6z1sm34j': {
      'en': 'Saldo disponible',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'c0dls4u5': {
      'en': '\$25,202',
      'ar': '25202 دولار',
      'de': '25.202 \$',
      'es': '\$25,202',
    },
    '30yef7fj': {
      'en': 'Nómina vencida',
      'ar': 'الرواتب المستحقة',
      'de': 'Gehaltsabrechnung fällig',
      'es': 'Vencimiento de nómina',
    },
    'zrx9e6tv': {
      'en': '\$12,245',
      'ar': '12245 دولارًا',
      'de': '12.245 \$',
      'es': '\$12,245',
    },
    '1cjqanzg': {
      'en': 'Fecha de débito',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    '726vrs60': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    '4dgbx46t': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'n87v5tth': {
      'en': 'Presupuesto de marketing',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    'l5pw5c8c': {
      'en': '\$4,000',
      'ar': '4000 دولار',
      'de': '4.000 \$',
      'es': '\$4,000',
    },
    '7i0a44qa': {
      'en': 'Total gastado',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '9a2ya1la': {
      'en': '\$3,402',
      'ar': '3،402 دولار',
      'de': '\$3.402',
      'es': '\$3,402',
    },
    'n1o498d9': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'nb29ps2o': {
      'en': '1 Nueva alerta',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'vgt9s153': {
      'en': 'View Now',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'pnvkw3b7': {
      'en':
          'Notamos un pequeño cargo que no es típico de esta cuenta; revíselo',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage_alt
  {
    'xdh0z8qh': {
      'en': 'Hola,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'v74pa882': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    'rzpg3cvh': {
      'en': 'Sus últimas actualizaciones están\n a continuación.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'flto6ti8': {
      'en': 'Saldo Total',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'g07h0azf': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'v9ghmn0y': {
      'en': 'Saldo total',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    '7vf40ybo': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'a33ldz0h': {
      'en': 'Próxima Nómina',
      'ar': 'كشوف المرتبات التالية',
      'de': 'Nächste Gehaltsabrechnung',
      'es': 'Nómina siguiente',
    },
    '3dgzzz79': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'hp28r17l': {
      'en': 'Fecha de débito',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    'k04gl6sz': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    'd5tcdo3w': {
      'en': 'quedan 4 días',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '7zcrtqx6': {
      'en':
          'Notamos un pequeño cargo que no es típico de esta cuenta; revíselo.',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    '23yxoc9m': {
      'en': 'Ver ahora',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'a86mwddx': {
      'en': 'Presupuesto de marketing',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    '6c2o39hz': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    'bp9d56pc': {
      'en': 'quedan 4 días',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'jzfejglt': {
      'en': 'Jefe ejecutivo',
      'ar': 'رئيس قسم التصميم',
      'de': 'Leiter Design',
      'es': 'Jefe de Diseño',
    },
    '87ospwsq': {
      'en': '\$5,000',
      'ar': '5000 دولار',
      'de': '5.000 \$',
      'es': '\$5,000',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'ar': '[الطابع الزمني]',
      'de': '[Zeitstempel]',
      'es': '[Marca de tiempo]',
    },
    '8hu2v2im': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'en': 'Hola,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'izgc0c6r': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    '30kx6e5v': {
      'en': 'Sus últimas actualizaciones están \na continuación.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'syy689nt': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'hhyb9x4x': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'kg2tmby7': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'y7zomzzp': {
      'en': 'Servicios rápidos',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    'rfozud9v': {
      'en': 'Transferir',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'pcrarg0a': {
      'en': 'Actividad',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'zmjsfzgg': {
      'en': 'Mi banco',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'dfjtbkbo': {
      'en': 'Transacción',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'Reclamar Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'vupu5y5p': {
      'en': 'Ingreso',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'bj5qnrj5': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '2thn73jc': {
      'en': 'Reclamar Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    '1fjdiibo': {
      'en': 'Ingreso',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'ld7s2fpn': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '8t6ddwco': {
      'en': 'Reclamar Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'td15kjsa': {
      'en': 'Ingreso',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'qmjqp9a6': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '8pdmehj2': {
      'en': 'Reclamar Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'krrhjgc4': {
      'en': 'Ingreso',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '53m2u0s2': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // profilepage
  {
    'hhb6veym': {
      'en': 'Mis metas financieras',
      'ar': 'رصيد المحفظة',
      'de': 'Wallet-Guthaben',
      'es': 'Saldo de la cartera',
    },
    'fgf8icmv': {
      'en': '\$23,000',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    '2rrr446m': {
      'en': '3 metas',
      'ar': '3 عملات',
      'de': '3 Währungen',
      'es': '3 monedas',
    },
    'vewa5op5': {
      'en': 'Ahorro mensual',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '9oun2uok': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    'yla7uncg': {
      'en': '32% del portafolio',
      'ar': '32٪ من المحفظة',
      'de': '32 % des Portfolios',
      'es': '32% de la cartera',
    },
    '7hsm7t9z': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'opob20j8': {
      'en': 'Ahorro educativo',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'fi3cleyj': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '606emxw1': {
      'en': '40% del portafolio',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2io5lul': {
      'en': 'Despensa',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'krsyyttw': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '4mvfe3pe': {
      'en': '40% del portafolio',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    '6cm4jjje': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // counselor
  {
    'yw1x346q': {
      'en': 'Consejero Financiero de IA',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h5d1mx6s': {
      'en': 'Tu consejo personalizado en base a tus metas',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hl6cf02i': {
      'en': 'Enter your message',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2gjj0xwc': {
      'en': 'Type your message here...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3u5lvmxt': {
      'en': 'Send',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qixrc5a0': {
      'en': 'Upcoming Appointments',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ufqpzggu': {
      'en': 'Appointment with John Doe',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tt2hvf6l': {
      'en': 'Mon. July 3rd, 10:00 AM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qe07l1t8': {
      'en': 'View Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yx05vy0v': {
      'en': 'Appointment with Jane Smith',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y44ajbva': {
      'en': 'Tue. July 4th, 2:00 PM',
      'ar': '',
      'de': '',
      'es': '',
    },
    '42qm2eef': {
      'en': 'View Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'psj2d9g4': {
      'en': 'Recent Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u65r2d7b': {
      'en': 'Transaction Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rke7u6vz': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4sadrr8j': {
      'en': '\$1.50',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l06ow1vn': {
      'en': 'Transaction Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gycyfqvj': {
      'en': 'Tue. July 4th',
      'ar': '',
      'de': '',
      'es': '',
    },
    '215v0y11': {
      'en': '\$2.50',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pczl6x55': {
      'en': 'Budget Overview',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd5qao4c7': {
      'en': 'Monthly Budget',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hazuzwyn': {
      'en': 'July 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x0q9s8kt': {
      'en': '\$500.00',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Retos_Rewards
  {
    '031hlzxf': {
      'en': 'Estás a 20 puntos de alcanzar tu meta',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0wh75qaf': {
      'en': '80%',
      'ar': '',
      'de': '',
      'es': '',
    },
    'njcvvrfg': {
      'en': 'Tus próximas Rewards, Mariel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xjavhs5g': {
      'en': '10% menos en \nconciertos (Estadio Banorte)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bprh4xy5': {
      'en': 'Acceso exclusivo a productos\nfinancieros',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dhjffrhs': {
      'en': 'Bonificaciones por metas de\nahorro',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5y21nu8q': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // chat_ai_Screen
  {
    '76j46a6b': {
      'en': 'Ai Chat',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3gl62saq': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // emptyList
  {
    'c72gbpqh': {
      'en': 'Ai Chat Active!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3s7bx3jw': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tpw4u7xw': {
      'en': 'https://platform.openai.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'spbzd151': {
      'en': 'Watch Tutorial',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // emptyList_1
  {
    'gydxrz0k': {
      'en': 'Ai Chat Active!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fl1mtwpe': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i8ba0l01': {
      'en': 'https://platform.openai.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bpl8b9u4': {
      'en': 'Watch Tutorial',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // aiChat_Component
  {
    'qumccz4a': {
      'en': 'Copy response',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yt70dn8g': {
      'en': 'Type something...',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xnriwyp7': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
