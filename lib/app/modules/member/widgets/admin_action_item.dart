import 'package:flutter/material.dart';

class AdminActionItems extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const AdminActionItems({
    super.key,
    required this.label,
    this.onTap,
  });

  static const bgColor = Color(0xffDFE6E8);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label),
          ],
        ),
      ),
    );
  }
}
