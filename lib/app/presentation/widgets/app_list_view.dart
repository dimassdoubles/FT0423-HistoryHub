import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AppListView<ItemType> extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final PagingController pagingController;
  final Widget Function(BuildContext context, dynamic item, int index)
      itemBuilder;
  final Widget? separator;
  final String errorDescription;
  final bool showLoading;

  /// error deskripsi biasanya
  /// 'Data \<nama_data> belum tersedia di masjid \<nama_masjid>'
  const AppListView({
    super.key,
    this.onRefresh,
    required this.pagingController,
    this.separator,
    required this.itemBuilder,
    this.errorDescription = 'Data belum tersedia',
    this.showLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primary500,
      onRefresh: onRefresh ?? () async => pagingController.refresh(),
      child: PagedListView.separated(
        key: key,
        padding: EdgeInsets.zero,
        pagingController: pagingController,
        separatorBuilder: (context, index) => separator ?? const Gap(10),
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            if (index == (pagingController.itemList?.length ?? -1) - 1) {
              return Column(
                children: [
                  itemBuilder(context, item, index),
                  const Gap(64),
                ],
              );
            }
            return itemBuilder(context, item, index);
          },
          firstPageProgressIndicatorBuilder: (context) =>
              showLoading ? const _Loading() : const SizedBox(),
          newPageProgressIndicatorBuilder: (context) => const SizedBox(),
          firstPageErrorIndicatorBuilder: (context) => const _Error(),
          noItemsFoundIndicatorBuilder: (context) => const _Empty(),
          newPageErrorIndicatorBuilder: (context) => const _NewPageError(),
        ),
      ),
    );
  }
}

class _NewPageError extends StatelessWidget {
  const _NewPageError();

  @override
  Widget build(BuildContext context) {
    return const Text('New Page Error');
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return const Text('');
  }
}

class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return const Text('Error');
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primary500,
      ),
    );
  }
}
