import 'package:flutter/material.dart';
import 'package:sky_station/constant/text_style.dart';

class TextTileWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String value;

  const TextTileWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(208, 232, 255, 1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF029FE2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: AppStyle.font16weight500,
                ),
              ),
              Text(
                value,
                style: AppStyle.font16weight500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
