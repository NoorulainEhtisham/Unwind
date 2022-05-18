

import 'package:unwind_project/entities/user.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {

// Alternatively you could write it if you don't like global variables
  GetIt.instance.registerSingleton<NewUser>(NewMember());
}