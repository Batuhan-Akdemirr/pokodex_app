import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);
  final String title = 'Pokodex';
  final String pokemonLogoPath = 'assets/images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.gettAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(alignment: Alignment.centerLeft, child: textTitle(context)),
          ),
          Align(alignment: Alignment.topRight, child: pokemonLogo()),
        ],
      ),
    );
  }

  Text textTitle(context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Image pokemonLogo() {
    return Image.asset(
      pokemonLogoPath,
      width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,
      fit: BoxFit.fitWidth,
    );
  }
}
