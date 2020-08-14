import 'package:core/platform/build_config/build_config.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:presentation/design/style.dart';
import 'package:presentation/navigation/navigation_stack.dart';

final GetIt sl = GetIt.instance;

Future<void> init(BuildConfig b) async {
  // Settings
  sl.registerLazySingleton<BuildConfig>(() => b);
  // Style
  sl.registerLazySingleton<Style>(() => Style());

  // Navigation
  sl.registerLazySingleton<NavigationStack>(() => NavigationStack());

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
