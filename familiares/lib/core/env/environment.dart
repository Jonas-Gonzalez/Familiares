import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, prod }

class Environment {
  final Flavor flavor;
  final String apiBaseUrl;
  final String? authUser;
  final String? authPassword;

  const Environment._({
    required this.flavor,
    required this.apiBaseUrl,
    this.authUser,
    this.authPassword,                           
  });

  bool get isProduction => flavor == Flavor.prod;
  bool get isDevelopment => flavor == Flavor.dev;

  static Environment get dev => Environment._(
        flavor: Flavor.dev,
        apiBaseUrl: dotenv.env['APIBASEURL']!,
      );

  static Environment get prod => const Environment._(
        flavor: Flavor.prod,
        apiBaseUrl:
            'https://wsm.ics.gencat.cat/gtct/appfamiliarshj23/api/v1',
        authUser: String.fromEnvironment('API_USER'),
        authPassword: String.fromEnvironment('API_PASSWORD'),
      );
}