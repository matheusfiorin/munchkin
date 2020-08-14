import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:presentation/design/style.dart';

class Settings {
  static AppSettings _current;

  static final _defaultAppSettings = AppSettings(
    title: 'Base App',
    assetFolder: 'base',
    apiSettings: ApiSettings(
      baseUrl: 'http://localhost:3000',
    ),
    buildStyle: () => FlavorStyle(),
  );

  static AppSettings get current => _current ?? _defaultAppSettings;

  static set current(AppSettings value) => _current = value;
}

@immutable
class AppSettings {
  const AppSettings({
    @required this.title,
    @required this.assetFolder,
    @required this.apiSettings,
    @required this.buildStyle,
  });

  final baseFolder = 'assets/';
  final String title;
  final String assetFolder;
  final ApiSettings apiSettings;
  final FlavorStyle Function() buildStyle;
}

@immutable
class ApiSettings {
  const ApiSettings({
    this.baseUrl = '',
  });

  final String baseUrl;
}
