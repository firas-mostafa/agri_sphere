import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/presentation/pest_scanner/widgets/pest_history_list.dart';
import 'package:mobile_app/presentation/pest_scanner/widgets/pest_image_uploader.dart';
import 'package:mobile_app/presentation/pest_scanner/widgets/tips_for_scanning.dart';

class PestScanner extends StatelessWidget {
  const PestScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.surfaceContainer,
        actionsPadding: EdgeInsets.symmetric(horizontal: context.setWidth(10)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: context.colorScheme.surfaceContainerHighest,
            child: Icon(Icons.history, color: context.colorScheme.onSurface),
          ),
        ],
        title: Text(
          "pest_scanner".tr(context),
          style: context.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.setWidth(12),
            vertical: context.setHeight(50),
          ),
          child: Column(
            children: [
              PestImageUploader(),
              SizedBox(height: context.setHeight(20)),
              TipsForScanning(),
              SizedBox(height: context.setHeight(20)),
              PestHistoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
