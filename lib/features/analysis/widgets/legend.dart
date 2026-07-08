import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';

class Legend extends StatelessWidget {
  final String title;
  final String? text;
  final Color color;
  final String value;
  final double? percent;

  const Legend({
    super.key,
    required this.title,
    this.text,
    required this.color,
    required this.value,
    this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              if (text != null && text!.isNotEmpty)
                Text(text!, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),

        if (percent != null)
          Text(percent!.percent, style: const TextStyle(color: Colors.grey)),

        const SizedBox(width: 12),

        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
        ),
      ],
    );
  }
}
