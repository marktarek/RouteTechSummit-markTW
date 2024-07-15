import 'package:flutter/material.dart';
import 'package:route_job_fair_flutter/GUI/widgets/my_colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.appColor,
      ),
    );
  }
}
