import 'package:flutter/material.dart';
class SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SocialIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
