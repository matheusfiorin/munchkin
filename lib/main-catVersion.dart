import 'package:flutter/material.dart';
import 'package:munchkin/app/app.dart';

import 'flavors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App(Flavor.CATVERSION));
}
