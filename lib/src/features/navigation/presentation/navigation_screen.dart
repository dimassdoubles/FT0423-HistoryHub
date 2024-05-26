import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:history_hub/src/core/router/app_router.gr.dart';
import 'package:history_hub/src/core/constants/styles/app_colors.dart';
import 'package:history_hub/src/core/constants/styles/app_texts.dart';
import 'package:history_hub/src/features/home/presentation/home_screen.dart';
import 'package:history_hub/src/features/navigation/presentation/widgets/navigation_app_bar.dart';
import 'package:history_hub/src/features/transaction/presentation/transaction_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NavigationScreen extends HookConsumerWidget {
  final Widget? body;
  const NavigationScreen({
    super.key,
    required this.body,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useCurrentIndex = useState(0);

    return Scaffold(
      appBar: const NavigationAppBar(),
      body: body,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.neutral200,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: useCurrentIndex.value,
          fixedColor: AppColors.primary500,
          selectedLabelStyle: AppTexts.primary,
          unselectedLabelStyle: AppTexts.primary,
          onTap: (index) {
            switch (index) {
              case 0:
                context.pushRoute(NavigationRoute(body: const HomeScreen()));
                useCurrentIndex.value = 0;
                break;
              case 1:
                context.pushRoute(
                  NavigationRoute(body: const TransactionScreen()),
                );
                useCurrentIndex.value = 1;
                break;
              default:
                context.pushRoute(NavigationRoute(body: const HomeScreen()));
                useCurrentIndex.value = 0;
            }
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Transaksi',
              icon: Icon(
                Icons.airplane_ticket,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
