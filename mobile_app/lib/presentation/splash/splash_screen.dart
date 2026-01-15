import 'package:flutter/material.dart';
import 'package:mobile_app/core/api/end_ponits.dart';
import 'package:mobile_app/helpers/cache/cache_helper.dart';
import 'package:mobile_app/helpers/image/image_helper.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 5));
    final String? token = CacheHelper().getDataString(ApiKey.token);
    final bool isLoggedIn = token != null && token.isNotEmpty;
    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Center(
        child: Image.asset(ImageHelper.logo, width: context.setWidth(300)),
      ),
    );
  }
}
