import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

class BackButtonComponent extends StatelessWidget{
  final String text;
  final Widget backScreen;

  BackButtonComponent(this.text, this.backScreen);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: ScreenParams.width(5, context)),
        ElevatedButton(
          onPressed: () =>
          {Navigator.push(context, Routes.backRoute(context, backScreen))},
          style: AppDecorations.toMenuButtonStyle(context),
          child: Row(children: [
            Icon(AppIcons.leftMenu),
            Text(text)
          ]),
        ),
      ],
    );
  }
}
