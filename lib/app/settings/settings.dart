import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:presentation/design/style.dart';

class Settings {
  static AppSettings _current;

  static final _defaultAppSettings = AppSettings();

  static AppSettings get current => _current ?? _defaultAppSettings;

  static set current(AppSettings value) => _current = value;
}

@immutable
class AppSettings {
  static FlavorStyle _defaultBuildStyle() => FlavorStyle();
  static const _defaultApiSettings = ApiSettings(
    baseUrl: 'http://localhost:3000',
  );

  const AppSettings({
    String title,
    String assetFolder,
    ApiSettings apiSettings,
    FlavorStyle Function() buildStyle,
  })  : title = title ?? 'Base App',
        assetFolder = assetFolder ?? 'base',
        apiSettings = apiSettings ?? _defaultApiSettings,
        buildStyle = buildStyle ?? _defaultBuildStyle;

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
