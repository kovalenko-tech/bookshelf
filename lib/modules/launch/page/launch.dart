import 'package:bookshelf/generated/assets.gen.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/modules/launch/cubit/launch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  LaunchCubit get cubit => getIt<LaunchCubit>();

  @override
  void initState() {
    super.initState();

    cubit.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.logo.image(
          width: 240.w,
        ),
      ),
    );
  }
}
