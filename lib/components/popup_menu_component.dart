import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/data_model.dart';
import 'package:phone_app_v2/shared/app_decorations.dart';
import 'package:phone_app_v2/shared/data_params.dart';

class PopupMenuComponent extends StatelessWidget {
  final int number;
  static final ValueNotifier<String> text = new ValueNotifier<String>('Пол');

  PopupMenuComponent(this.number, String data);

  static void _selected(Male result, int number) {
    PopupMenuComponent.text.value = result.name;
    DataParams.data[number].value = result;
    DataParams.updateScreens();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Male>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Male>>[
        PopupMenuItem<Male>(
          value: Male.Women,
          child: Text(Male.Women.name),
        ),
        PopupMenuItem<Male>(
          value: Male.Men,
          child: Text(Male.Men.name),
        ),
      ],
      initialValue: DataParams.data[number].value as Male,
      onSelected: (result) => _selected(result, number),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppDecorations.betweenDataScreenComponents(context),
        ValueListenableBuilder(
          builder: (context, value, child) => Text(
            text.value,
            style: AppDecorations.defaultTextStyle,
          ),
          valueListenable: text,
        ),
        Icon(AppIcons.downMenu),
      ]),
    );
  }
}
