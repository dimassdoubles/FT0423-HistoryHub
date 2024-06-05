import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final double paddingSize;
  final String url;
  final double size;
  final File? file;
  const UserAvatar(
    this.url, {
    super.key,
    required this.size,
    this.paddingSize = 0,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.neutral200,
        ),
      ),
      child: ClipOval(
        child: file == null
            ? Image.network(
                fit: BoxFit.cover,
                url,
                errorBuilder: (context, error, stackTrace) => SvgPicture.asset(
                  'assets/icons/user.svg',
                  fit: BoxFit.cover,
                ),
              )
            : Image.file(
                file!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
