import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.university,
  });

  final String name;
  final String university;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Image.asset('assets/images/profile.png', width: 160, height: 160),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 4),
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Profile',
              fontSize: 28,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        Text(university, style: TextStyle(color: colorScheme.onSurfaceVariant)),
      ],
    );
  }
}
