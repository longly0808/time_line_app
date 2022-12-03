import 'package:get_it/get_it.dart';

import 'auth/google_auth_provider.dart';
import 'service.dart';

class ServiceDependencies{
  static void init(GetIt injector){
      injector.registerLazySingleton<GoogleProvider>(() => GoogleProvider(injector()));
    injector.registerFactory<AppPreferences>(() => AppPreferences());

  }
}