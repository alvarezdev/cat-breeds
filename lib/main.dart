import 'package:cat_breeds/di/dependency_injection.dart';
import 'package:cat_breeds/l10n-generated/l10n.dart';
import 'package:cat_breeds/presentation/landing/landing_screen.dart';
import 'package:cat_breeds/shared/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  configureInjection();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Breeds',
      theme: ThemeData(fontFamily: 'Poppins'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
      initialRoute: LandingScreen.routeName,
      //initialRoute: SplashScreen.routeName,
      //Dejo el comentario anterior para que se pueda probar la pantalla de splash en caso de ser necesario,
      //ademas dejo la screen creada como la exige la prueba.
      //Pero se debe tener que estoy haciendo las pruebas con un emulador android 14
      //y desde Android 12 el sistema SIEMPRE muestra un ic_launcher en el splash.
      //Por tal razon decidi dejar la pantalla de splash como opcional para no afectar la experiencia de usuario en el emulador.
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
