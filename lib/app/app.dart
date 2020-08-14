import 'package:core/platform/build_config/build_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munchkin/app/settings/flavors_settings.dart';
import 'package:munchkin/app/settings/settings.dart';
import 'package:munchkin/app/injection_container.dart' as di;
import 'package:munchkin/flavors.dart';
import 'package:presentation/design/style.dart';
import 'package:presentation/design/theme.dart';
import 'package:presentation/features/old_architecture/pages/home_page.dart';
import 'package:presentation/widgets/application.dart';
import 'package:presentation/widgets/components/splash_screen.dart';

class App extends StatelessWidget {
  App(this.flavor);

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    final _settings = flavorSettings[flavor];
    final _buildConfig = BuildConfigImpl();
    final _navigatorKey = GlobalKey<NavigatorState>();

    Style.current = _settings.buildStyle();
    Settings.current = _settings;

    return application(
      materialThemeData: materialThemeData(),
      cupertinoThemeData: cupertinoThemeData(),
      title: _settings.title,
      navigatorKey: _navigatorKey,
      home: _home(_buildConfig),
    );
  }

  Widget _home(BuildConfig b) => FutureBuilder<Widget>(
        future: _init(b),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          }

          return SplashScreen();
        },
      );

  Future<Widget> _init(BuildConfig b) async {
    await b.init();
    await di.init(b);

    await Future.delayed(Duration(seconds: 3));

    return HomePage();
  }
}
