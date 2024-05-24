import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TransactionScreen extends HookConsumerWidget {
  const TransactionScreen({super.key});
  static const routeName = 'transaction-screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Transaksi'),
    );
  }
}
