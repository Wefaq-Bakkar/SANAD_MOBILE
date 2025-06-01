import 'package:flutter/material.dart';


class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  final String image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8), // Less padding for larger image
            height: 72, // Increased height
            width: 72,  // Increased width
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain, // Use contain for better scaling
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 72, // Match the new card width
            child: Text(
              text,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
