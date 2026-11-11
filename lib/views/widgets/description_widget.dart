import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  final bool showHeader;

  const DescriptionWidget({
    super.key,
    required this.description,
    this.showHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader) ...[
            const Text(
              'About the Destination',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 8.0),
          ],
          Text(
            description,
            softWrap: true,
            style: const TextStyle(
              height: 1.5,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}