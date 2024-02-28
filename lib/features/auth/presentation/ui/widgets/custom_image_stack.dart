import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageStack extends StatelessWidget {
  const CustomImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          child: Icon(
            Icons.person,
            size: 50.sp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Icon(
            Icons.add_circle_outlined,
            size: 20.sp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
