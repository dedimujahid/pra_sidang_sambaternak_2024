import 'package:flutter/material.dart';
import 'package:sambaternak_baru_2024/themes/theme.dart';

class TableCellSettings extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const TableCellSettings({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.6,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0))),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(color: ArgonColors.text)),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                    child: Icon(Icons.arrow_forward_ios,
                        color: ArgonColors.text, size: 14),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
