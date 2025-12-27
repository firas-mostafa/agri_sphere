import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mobile_app/helpers/localization/app_localizations.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';
import 'package:mobile_app/widgets/custom_button.dart';

class PestImageUploader extends StatelessWidget {
  final VoidCallback? onCameraPressed;
  final VoidCallback? onGalleryPressed;

  const PestImageUploader({
    super.key,
    this.onCameraPressed,
    this.onGalleryPressed,
  });

  @override
  Widget build(BuildContext context) {
    final tertiary = context.colorScheme.tertiary;

    return DottedBorder(
      color: tertiary.withAlpha(40),
      strokeWidth: 3,
      dashPattern: const [7, 6],
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: tertiary.withAlpha(20),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: context.setMineSize(70),
              height: context.setMineSize(70),
              decoration: BoxDecoration(
                color: tertiary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.image,
                color: context.colorScheme.onTertiary,
                size: context.setMineSize(40),
              ),
            ),
            SizedBox(height: context.setHeight(6)),
            Text(
              'upload_pest_image'.tr(context),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: context.setHeight(6)),
            Text(
              'take_a_photo_or_upload_from_gallery'.tr(context),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.outline,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.setHeight(10)),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {},
                    text: "camera".tr(context),
                    icon: Icons.camera_alt_outlined,
                    titleColor: context.colorScheme.onTertiaryContainer,
                    color: context.colorScheme.tertiaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    onTap: () {},
                    text: "gallery".tr(context),
                    icon: Icons.photo,
                    titleColor: context.colorScheme.onTertiary,
                    color: context.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
