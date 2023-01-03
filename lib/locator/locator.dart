import 'package:get_it/get_it.dart';

import '../services/user_api_services.dart';

final locator = GetIt.instance;


void setup() {
  //User api services
  locator.registerLazySingleton<UserApiServices>(() => UserApiServices());

}