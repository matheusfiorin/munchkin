import 'package:package_info/package_info.dart';

import 'build_info.dart';

abstract class BuildConfig {
  Future<void> init();

  BuildInfo get currentInfo;
}

class BuildConfigImpl extends BuildConfig {
  BuildConfigImpl([this._createPackageInfo = PackageInfo.fromPlatform]);

  final Future<PackageInfo> Function() _createPackageInfo;

  Future<PackageInfo> _packageInfo() async => await _createPackageInfo();

  BuildInfo _currentInfo;

  @override
  Future<void> init() async {
    final packageInfo = await _packageInfo();

    _currentInfo = BuildInfo(
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    );
  }

  @override
  BuildInfo get currentInfo => _currentInfo;
}
