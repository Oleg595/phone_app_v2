import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

import 'back_forward_button.dart';

class NavigationBarComponent extends StatelessWidget {
  final int number;

  NavigationBarComponent(this.number);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: SizesInputScreen.withoutSelectedFont,
      backgroundColor: AppColors.buttonColor,
      items: [
        BottomNavigationBarItem(
          icon: ValueListenableBuilder(
            valueListenable: DataParams.toDefault,
            builder: (context, dynamic, widget) =>
                BackForwardButton(false, number),
          ),
          label: TextConstants.prev,
        ),
        BottomNavigationBarItem(
          icon: ValueListenableBuilder(
            valueListenable: DataParams.toDefault,
            builder: (context, dynamic, widget) =>
                BackForwardButton(true, number),
          ),
          label: TextConstants.next,
        )
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
