import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../features/notifications/data/datasources/notification_remote_datasource.dart';
import '../../features/notifications/data/repositories/notification_repository_impl.dart';
import '../../features/notifications/domain/repositories/notification_repository.dart';
import '../../features/notifications/domain/usecases/get_patient_notifications.dart';
import '../../features/notifications/presentations/bloc/notifications_cubit.dart';
import '../env/environment.dart';
import '../i18n/locale_provider.dart';
import '../network/api_client.dart';
import '../storage/local_storage.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  final env = GetIt.I<Environment>();

  getIt.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => ApiClient(env));
  getIt.registerLazySingleton(() => LocaleProvider(getIt<LocalStorage>()));

  getIt.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(getIt<NotificationRemoteDataSource>()),
  );
  getIt.registerLazySingleton(
    () => GetPatientNotifications(getIt<NotificationRepository>()),
  );
 
}