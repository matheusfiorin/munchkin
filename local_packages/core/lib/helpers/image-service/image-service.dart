import 'package:munchkin/app/injection_container.dart';
import 'package:munchkin/app/settings/settings.dart';

class ImageService {
  static String getAsset(String assetName) {
    final baseFolder = Settings.current.baseFolder;
    final assetFolder = Settings.current.assetFolder;

    final path = '$baseFolder$assetFolder$assetName';

    return path;
  }
}
