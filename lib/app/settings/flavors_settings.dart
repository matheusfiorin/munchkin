import 'package:munchkin/app/settings/settings.dart';
import 'package:munchkin/flavors.dart';
import 'package:presentation/design/named_colors.dart';
import 'package:presentation/design/style.dart';

const Map<Flavor, AppSettings> flavorSettings = {
  Flavor.BASE: _baseSettings,
  Flavor.CATVERSION: _catVersionSettings,
  Flavor.DOGVERSION: _dogVersionSettings,
};

const _baseSettings = AppSettings(
  title: 'Base App',
  assetFolder: 'base/',
  apiSettings: _developmentApiSettings,
  buildStyle: _buildBaseStyle,
);
const _catVersionSettings = AppSettings(
  title: 'Cat Version',
  assetFolder: 'cat/',
  apiSettings: _developmentApiSettings,
  buildStyle: _buildCatVersionStyle,
);
const _dogVersionSettings = AppSettings(
  title: 'Dog Version',
  assetFolder: 'dog/',
  apiSettings: _developmentApiSettings,
  buildStyle: _buildDogVersionStyle,
);

const _developmentApiSettings = ApiSettings(
  baseUrl: 'http://localhost:3000',
);

FlavorStyle _buildBaseStyle() =>
    FlavorStyle(appBarColor: NamedColors.damagedTan);

FlavorStyle _buildCatVersionStyle() => FlavorStyle(
      appBarColor: NamedColors.invigoratingHazel,
      backgroundColor: NamedColors.compensatoryPearl,
    );

FlavorStyle _buildDogVersionStyle() =>
    FlavorStyle(appBarColor: NamedColors.compensatoryPearl);
