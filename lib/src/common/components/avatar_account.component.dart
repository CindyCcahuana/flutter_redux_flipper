import 'package:flutter/material.dart';

class AvatarAccountComponent extends StatelessWidget {
  final String image;
  final String fullname;

  const AvatarAccountComponent({
    super.key,
    required this.image,
    required this.fullname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          fullname,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
