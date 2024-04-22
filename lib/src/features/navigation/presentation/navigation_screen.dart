import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
