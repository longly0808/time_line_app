import 'package:get_it/get_it.dart';

import 'service.dart';
class ServiceDependencies{
  static void init(GetIt injector){
    injector.registerFactory<GmailFirebase>(() => GmailFirebase());
    injector.registerFactory<AccountFirebase>(() => AccountFirebase());
  }
}