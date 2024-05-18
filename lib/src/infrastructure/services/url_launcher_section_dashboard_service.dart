import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_opservapp/lib.dart';

@Injectable(as: ISectionDashboardService)
class UrlLauncherSectionDashboardService implements ISectionDashboardService {
  final IUrlLauncher _urlLauncher;

  UrlLauncherSectionDashboardService(this._urlLauncher);
  @override
  Future<void> showSectionDashboard(SubSection section) {
    var dashboardURL =
        "http://24.199.78.175/metabase/public/dashboard/${section.dashboardUrl}";
    if (kDebugMode) {
      print(dashboardURL);
    }
    Uri uri = Uri.parse(dashboardURL);
    return _urlLauncher.launchUrl(uri);
  }
}
