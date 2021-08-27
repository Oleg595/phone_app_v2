import 'package:flutter/cupertino.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

class BackForwardButton extends StatefulWidget {

  IconData icon;
  bool canContinue;
  final bool isForward;
  final int number;

  BackForwardButton(this.isForward, this.number) {
    if (isForward) {
      if ((number >= DataParams.screens.length - 1) || (DataParams.data[number].toString().isEmpty)) {
        canContinue = false;
      }
      else {
        canContinue = true;
      }
      icon = AppIcons.nextButtonIcon;
    }
    else {
      if ((number <= 0) || (DataParams.data[number - 1].toString().isEmpty)) {
        canContinue = false;
      }
      else {
        canContinue = true;
      }
      icon = AppIcons.prevButtonIcon;
    }
  }

  @override
  _BackForwardButtonState createState() => _BackForwardButtonState();
}

class _BackForwardButtonState extends State<BackForwardButton> {

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(widget.icon,
          color: (widget.canContinue) ? AppColors.defaultScreenColor : AppColors.disableButtonColor),
      onPressed: (widget.canContinue)
          ? () => {
      Navigator.push(
      context,
      Routes.backForwardRoute(context, widget.isForward, widget.number))
      } : null,
    );
  }
}
