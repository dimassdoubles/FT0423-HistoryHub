import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_colors.dart';
import 'package:history_hub_v2/app/core/constants/styles/app_texts.dart';
import 'package:history_hub_v2/app/core/constants/styles/text_weights.dart';
import 'package:history_hub_v2/app/core/extensions/date_time_extension.dart';
import 'package:history_hub_v2/app/data/models/post/post_model.dart';
import 'package:history_hub_v2/app/modules/home/home_controller.dart';
import 'package:history_hub_v2/app/modules/post/post_controller.dart';
import 'package:history_hub_v2/app/modules/post/widgets/comment_button.dart';
import 'package:history_hub_v2/app/modules/post/widgets/like_button.dart';
import 'package:history_hub_v2/app/modules/profile/profile_page.dart';
import 'package:history_hub_v2/app/presentation/widgets/user_avatar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:readmore/readmore.dart';

class PostListItem extends StatelessWidget {
  final PostModel post;
  final int index;
  const PostListItem(this.post, this.index, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.w, right: 16.w, left: 16.w),
      child: Column(
        children: [
          if (post.isPinned)
            Row(
              children: [
                const Icon(
                  Icons.push_pin_rounded,
                  size: 16,
                  color: AppColors.neutral400,
                ),
                Gap(4.w),
                Text(
                  'Disematkan',
                  style: AppTexts.primary.copyWith(
                    color: AppColors.neutral400,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          Gap(16.w),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  await Get.toNamed(ProfilePage.routeName,
                      arguments: post.userId);
                  try {
                    Get.find<PostController>().onPageRefresh();
                  } catch (_) {}
                },
                child: UserAvatar(
                  post.avatarUser,
                  size: 45.w,
                ),
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                post.namaUser,
                                style: AppTexts.primary.copyWith(
                                  fontWeight: TextWeights.black,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                ),
                              ),
                              Gap(4.w),
                              Text(
                                ' ${post.tanggal.timeAgo()}',
                                style: AppTexts.primary.copyWith(
                                  fontSize: 10,
                                  fontWeight: TextWeights.semiBold,
                                  color: AppColors.neutral300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (Get.find<
                                          HomeController>()
                                      .currentUser!
                                      .isSuperAdmin ||
                                  Get.find<HomeController>()
                                      .currentUser!
                                      .isSuperAdmin ||
                                  Get.find<HomeController>().currentUser!.id ==
                                      post.userId)
                              ? () {
                                  Get.bottomSheet(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: Get.back,
                                                icon: const Icon(
                                                  Icons.clear_rounded,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(4),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xffDFE6E8),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Gap(10),
                                                if ((Get.find<HomeController>()
                                                            .currentUser!
                                                            .isSuperAdmin ||
                                                        Get.find<
                                                                HomeController>()
                                                            .currentUser!
                                                            .isSuperAdmin) &&
                                                    post.isPinned) ...[
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                      Get.find<PostController>()
                                                          .removePinned();
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffDFE6E8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Hapus sematan postingan'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    child: Divider(
                                                        color: AppColors.white),
                                                  ),
                                                ],
                                                if ((Get.find<HomeController>()
                                                            .currentUser!
                                                            .isSuperAdmin ||
                                                        Get.find<
                                                                HomeController>()
                                                            .currentUser!
                                                            .isSuperAdmin) &&
                                                    !post.isPinned) ...[
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                      Get.find<PostController>()
                                                          .pinNewPost(post.id);
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffDFE6E8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Sematkan postingan'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    child: Divider(
                                                        color: AppColors.white),
                                                  ),
                                                ],
                                                if (Get.find<HomeController>().currentUser!.isSuperAdmin ||
                                                    Get.find<HomeController>()
                                                        .currentUser!
                                                        .isSuperAdmin ||
                                                    Get.find<HomeController>()
                                                            .currentUser!
                                                            .id ==
                                                        post.userId)
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                      Get.find<PostController>()
                                                          .deletePost(post.id);
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 16,
                                                        vertical: 8,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffDFE6E8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              'Hapus postingan'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                const Gap(10),
                                              ],
                                            ),
                                          ),
                                          const Gap(16),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          child: const Icon(
                            Icons.more_vert_rounded,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    ReadMoreText(
                      post.content,
                      trimMode: TrimMode.Line,
                      trimLines: 6,
                      trimCollapsedText: 'Selengkapnya',
                      trimExpandedText: 'Tampilkanlebih sedikit',
                      moreStyle: AppTexts.primary.copyWith(
                        fontWeight: TextWeights.semiBold,
                        color: AppColors.primary500,
                      ),
                      lessStyle: AppTexts.primary.copyWith(
                        fontWeight: TextWeights.semiBold,
                        color: AppColors.primary500,
                      ),
                      style: AppTexts.primary.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                    Gap(4.w),
                    if (post.imageUrl.isNotEmpty)
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            SafeArea(
                              child: Stack(
                                children: [
                                  PhotoView(
                                    imageProvider: NetworkImage(post.imageUrl),
                                  ),
                                  IconButton(
                                    onPressed: Get.back,
                                    style: IconButton.styleFrom(
                                      backgroundColor:
                                          AppColors.black.withOpacity(0.1),
                                    ),
                                    icon: const Icon(
                                      Icons.clear_rounded,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            persistent: false,
                            isScrollControlled: true,
                            ignoreSafeArea: false,
                          );
                        },
                        child: Container(
                          width: 1.sw,
                          height: (3 / 4).sw,
                          decoration: BoxDecoration(
                            color: AppColors.neutral200,
                            borderRadius: BorderRadius.circular(15.w),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.w),
                            child: Image.network(
                              post.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                child: Icon(
                                  Icons.image_not_supported_rounded,
                                  size: 56,
                                  color: AppColors.neutral300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LikeButton(post, index),
                        Gap(0.2.sw),
                        Expanded(child: CommentButton(post, index)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(4.w),
          const Divider(
            color: AppColors.neutral200,
          ),
        ],
      ),
    );
  }
}
