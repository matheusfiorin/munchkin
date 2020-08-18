import 'package:flutter_test/flutter_test.dart';
import 'package:munchkin/app/settings/settings.dart';
import 'package:presentation/design/named_colors.dart';
import 'package:presentation/design/style.dart';

void main() {
  group('Settings', () {
    test('should statically get default app settings', () {
      expect(Settings.current.title, AppSettings().title);
      expect(Settings.current.assetFolder, AppSettings().assetFolder);
      expect(Settings.current.apiSettings, AppSettings().apiSettings);
      expect(
        Settings.current.apiSettings.baseUrl,
        AppSettings().apiSettings.baseUrl,
      );
    });

    test('should statically get a custom setted app settings', () {
      final _customAppSettings = AppSettings(
        title: 'Custom App',
        assetFolder: 'custom',
        apiSettings: ApiSettings(
          baseUrl: 'http://my.api.com',
        ),
        buildStyle: () => FlavorStyle(
          appBarColor: NamedColors.compensatoryPearl,
        ),
      );

      Settings.current = _customAppSettings;

      expect(Settings.current, _customAppSettings);
    });
  });
}
