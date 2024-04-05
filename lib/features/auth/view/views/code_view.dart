import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_task/core/routes/extensions.dart';
import 'package:messenger_task/features/auth/view/widgets/code_view_body.dart';

class CodeView extends StatelessWidget {
  final String verificationId;

  const CodeView({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: CodeViewBody(
          verificationId: verificationId,
        ),
      ),
    );
  }
}
