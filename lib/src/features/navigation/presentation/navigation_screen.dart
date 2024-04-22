import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:history_hub/src/features/home/presentation/home_screen.dart';
import 'package:history_hub/src/features/transaction/presentation/transaction_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 40.w,
          backgroundImage: const NetworkImage(
            'https://www.benarnews.org/indonesian/opini/opini-prabowo-ke-as-10152020224352.html/201015_ID_Prabowo_1000.jpg/@@images/a32d7d84-9c9e-4f74-b00e-b45ea75eb40f.jpeg',
          ),
        ),
        actions: [
          Image.asset(
            'assets/logos/colored_logo.webp',
            width: 36.w,
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: useCurrentIndex.value,
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed(HomeScreen.routeName);
              useCurrentIndex.value = 0;
              break;
            case 1:
              context.goNamed(TransactionScreen.routeName);
              useCurrentIndex.value = 1;
              break;
            default:
              context.goNamed(HomeScreen.routeName);
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
    );
  }
}
