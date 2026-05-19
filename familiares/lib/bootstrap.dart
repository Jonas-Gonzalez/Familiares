import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'core/di/injection.dart';
import 'core/env/environment.dart';
import 'core/logger/app_logger.dart';
import 'app.dart';

Future<void> bootstrap(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  // await Firebase.initializeApp(); //

  GetIt.I.registerSingleton<Environment>(env);

  configureDependencies();

  AppLogger.info('App starting in ${env.flavor.name} mode');


  runApp(const App());
}