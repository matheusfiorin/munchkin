import 'package:munchkin/app/settings/settings.dart';
import 'package:munchkin/flavors.dart';
import 'package:presentation/design/named_colors.dart';
import 'package:presentation/design/style.dart';

const Map<Flavor, AppSettings> flavorSettings = {
  Flavor.BASE: _baseSettings,
};

const _baseSettings = AppSettings(
  title: 'Base App',
  assetFolder: 'base/',
  apiSettings: _developmentApiSettings,
  buildStyle: _buildBaseStyle,
);

const _developmentApiSettings = ApiSettings(
  baseUrl: 'http://localhost:3000',
);

FlavorStyle _buildBaseStyle() =>
    FlavorStyle(appBarColor: NamedColors.damagedTan);
