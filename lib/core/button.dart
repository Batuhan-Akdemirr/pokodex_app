import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';

class ButtonCoreWidget extends StatelessWidget {
  const ButtonCoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIHelper.getIconPadding(),
      child: IconButton(
          iconSize: ButtonSize().buttonSize,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
    );
  }
}

class ButtonSize {
  final double buttonSize = 18.w;
}
