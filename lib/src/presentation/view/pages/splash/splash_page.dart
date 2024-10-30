import 'package:flutter/material.dart';
import 'package:micit_test/src/core/config/assets/assets.gen.dart';
import 'package:micit_test/src/core/config/injector.dart';
import 'package:micit_test/src/core/services/storage_service.dart';
import 'package:micit_test/src/core/utils/constant.dart';
import 'package:micit_test/src/core/utils/layout/responsive_layout.dart';
import 'package:micit_test/src/presentation/view/common/image_widget.dart';

import '../../../../core/utils/enums.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Durations.extralong4 * 1.5,
    );

    _animation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(
      Durations.extralong4 * 4,
      () {
        injector<StorageService>().getString(kUserData).then(
          (value) {
            Navigator.pushReplacementNamed(context, AppLocalRoute.home.route);
            // if (value != null) {
            //   Navigator.pushReplacementNamed(context, AppLocalRoute.home.route);
            // } else {
            //   Navigator.pushReplacementNamed(context, AppLocalRoute.login.route);
            // }
          },
        );
      },
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      showAppBar: false,
      isPadding: false,
      builder: (context, info) {
        return Center(
          child: ScaleTransition(
            scale: _animation,
            child: ImageWidget(image: Assets.man.path, width: 100, height: 100),
          ),
        );
      },
    );
  }
}
