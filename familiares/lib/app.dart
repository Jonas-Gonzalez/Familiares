import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'core/i18n/locale_provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GetIt.I<LocaleProvider>(),
      builder: (context, _) {
        final localeProvider = GetIt.I<LocaleProvider>();
        return MaterialApp.router(
          title: 'Familiares',
          theme: appTheme(),
          routerConfig: appRouter,
          locale: localeProvider.locale,
          supportedLocales: const [
            Locale('es'),
            Locale('ca'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}