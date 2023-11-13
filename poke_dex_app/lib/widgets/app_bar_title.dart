import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_dex_app/constants/constants.dart';
import 'package:poke_dex_app/constants/ui_helper.dart';

class AppBarTitle extends StatefulWidget {
  const AppBarTitle({super.key});

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  @override
  Widget build(BuildContext context) {
    String pokeBallImageUrl = "assets/images/pokeball.png";

    return SizedBox(
      height: UIHelper.appTitleWidgetHeight,
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.appBarTitle,
                style: Constants.titleTextStyle(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              pokeBallImageUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.20.sh
                  : 0.15.sw,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
