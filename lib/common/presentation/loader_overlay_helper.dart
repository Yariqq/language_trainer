import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

abstract class ShowGlobalLoader {
  void setLoaderVisible(
    BuildContext context,
    bool isVisible, [
    double? progress,
  ]);
}

mixin GlobalLoaderHelper implements ShowGlobalLoader {
  @override
  void setLoaderVisible(
    BuildContext context,
    bool isVisible, [
    double? progress,
  ]) {
    if (context.loaderOverlay.visible == isVisible && progress == null) {
      return;
    }
    if (isVisible) {
      context.loaderOverlay.show(
        widget: Center(
          child: PlatformCircularProgressIndicator(),
        ),
      );
    } else if (progress != null && _isValidProgress(progress)) {
      context.loaderOverlay.show(
        widget: Center(
          child: PlatformCircularProgressIndicator(),
        ),
      );
    } else {
      context.loaderOverlay.hide();
    }
  }

  void hideLoader(BuildContext context) => setLoaderVisible(context, false);

  bool _isValidProgress(double? progress) {
    if (progress == null) {
      return false;
    }

    return progress >= 0.0 && progress <= 1.0;
  }
}
