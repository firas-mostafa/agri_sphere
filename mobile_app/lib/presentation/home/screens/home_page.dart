import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('home'.tr(context))));
  }
}
