import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';

class CreateEventButton extends StatelessWidget {
  final void Function() onTap;
  const CreateEventButton(this.onTap, {super.key});
  @override
  Widget build(BuildContext context) {
    // ref.listen(loadingStatusProvider, (previous, next) {
    //   if (next.$2 == ResultStatus.loading) {
    //     DialogHelper.showLoading();
    //   } else if (next.$2 == ResultStatus.success) {
    //     DialogHelper.dismiss();
    //     DialogHelper.showSuccess('Berhasil membuat event');
    //     context.router
    //         .popUntil((route) => route.settings.name == NavigationRoute.name);
    //   } else if (next.$2 == ResultStatus.error) {
    //     DialogHelper.dismiss();
    //     DialogHelper.showError(
    //       'Gagal membuat event: ${next.$2}',
    //     );
    //   }
    // });

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary500,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      child: const Text('Simpan'),
    );
  }
}
