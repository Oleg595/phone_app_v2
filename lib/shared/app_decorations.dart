import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app_v2/models/indicator_model.dart';
import 'package:phone_app_v2/screen/help_screen.dart';
import 'package:phone_app_v2/screen/params_screen.dart';
import 'package:phone_app_v2/shared/screen_params.dart';

import 'data_params.dart';

class SizesInputScreen {
  static int fontSize = 10;
  static int heightTextField = 13;
  static int widthTextField = 50;
  static int heightTextFieldContainer = 8;
  static double withoutSelectedFont = 0;
}

class SizesDataScreen {
  static int heightRows = 6;
  static int widthParamCell = 45;
  static int widthValueCell = 40;
}

class SizesMenu {
  static int widthMenuButtons = 70;
}

class SizesData{
  static int widthLeftComponent = 25;
  static int widthMeasure = 15;
}

class SizesHelpScreen {
  static int widthScrollView = 90;
  static int highBottomButton = 10;
}

class AppColors {
  static Color buttonColor = CupertinoColors.activeBlue;
  static Color disableButtonColor = CupertinoColors.inactiveGray;
  static Color defaultScreenColor = CupertinoColors.white;
  static Color textColor = CupertinoColors.black;
  static Color lowLevel = CupertinoColors.activeGreen;
  static Color midLevel = CupertinoColors.systemYellow;
  static Color highLevel = CupertinoColors.destructiveRed;
}

class AppIcons {
  static IconData nextButtonIcon = Icons.arrow_forward_ios_outlined;
  static IconData prevButtonIcon = Icons.arrow_back_ios_outlined;
  static IconData upMenu = Icons.arrow_drop_up;
  static IconData downMenu = Icons.arrow_drop_down;
  static IconData leftMenu = Icons.arrow_left;
}

class AppDecorations {
  static BoxDecoration decorationTextField = const BoxDecoration(
      border: Border.symmetric(),
      borderRadius: BorderRadius.all(Radius.circular(10)));

  static BoxDecoration decorationTextRowComponent = const BoxDecoration(
      border: Border(
        top: BorderSide(width: 1.0, color: Colors.grey),
        left: BorderSide(width: 1.0, color: Colors.grey),
        right: BorderSide(width: 1.0, color: Colors.grey),
        bottom: BorderSide(width: 1.0, color: Colors.grey),
      ),
      borderRadius: BorderRadius.all(Radius.circular(9)));

  static BoxDecoration dataTextContainerDecoration(Color color) {
    return BoxDecoration(
      color: color, //CupertinoColors.white,
      border: Border.all(color: CupertinoColors.inactiveGray, width: 1),
      borderRadius: BorderRadius.circular(5),
    );
  }

  static BoxDecoration menuContainerDecoration() {
    return BoxDecoration(
      color: AppColors.buttonColor, //CupertinoColors.white,
      border: Border.all(color: CupertinoColors.inactiveGray, width: 1),
      borderRadius: BorderRadius.circular(10),
    );
  }

  static SizedBox afterTextInputScreen(BuildContext context) => SizedBox(
        height: ScreenParams.height(3, context),
      );

  static SizedBox dataScreenIndentHeight(BuildContext context) {
    return SizedBox(height: ScreenParams.height(1, context));
  }

  static SizedBox dataScreenIndentWidth(BuildContext context) {
    return SizedBox(width: ScreenParams.width(2, context));
  }

  static SizedBox betweenDataScreenComponents(BuildContext context) {
    return SizedBox(
      width: ScreenParams.width(5, context),
    );
  }

  static SizedBox betweenMenuButtons(BuildContext context) {
    return SizedBox(
      height: ScreenParams.heightSafeArea(3, context),
    );
  }

  static SizedBox betweenHelpScreenComponents(BuildContext context) {
    return SizedBox(
      height: ScreenParams.heightSafeArea(2, context),
    );
  }

  static TextStyle defaultTextStyle =
      TextStyle(color: AppColors.textColor, decoration: TextDecoration.none);

  static TextStyle valueTextStyle =
      TextStyle(color: AppColors.defaultScreenColor, fontSize: 15);

  static TextStyle menuTextStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w500);

  static TextStyle helpModuleNameStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle helpButtonNameStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle helpTextStyle = TextStyle(fontSize: 15);

  static ButtonStyle paramsButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      primary: AppColors.buttonColor,
      textStyle: AppDecorations.valueTextStyle,
      fixedSize: Size(
          ScreenParams.width(SizesDataScreen.widthParamCell, context),
          ScreenParams.height(SizesDataScreen.heightRows, context)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  static ButtonStyle toMenuButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        primary: AppColors.buttonColor,
        onPrimary: AppColors.defaultScreenColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
  }

  static ButtonStyle homeButtonsStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      primary: AppColors.buttonColor,
      textStyle: AppDecorations.valueTextStyle,
      fixedSize: Size(
          ScreenParams.width(70, context), ScreenParams.height(8, context)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  static InputDecoration textFieldDecoration(String data) => InputDecoration(
        border: OutlineInputBorder(),
        labelText: data,
      );

  static InputDecoration textFieldMenuDecoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  static CupertinoNavigationBar topNavigationBar(BuildContext context,
          String moduleName, String backRouteName, Widget screen) =>
      CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(moduleName),
        trailing: ElevatedButton(
          onPressed: () => {
            Navigator.push(
                context,
                Routes.toHelpRoute(
                    context, HelpScreen(screen, backRouteName, moduleName)))
          },
          style: ElevatedButton.styleFrom(
              primary: AppColors.buttonColor, shape: CircleBorder()),
          child: Icon(Icons.help),
        ),
        backgroundColor: AppColors.defaultScreenColor,
        transitionBetweenRoutes: false,
      );
}

class TextConstants {
  static String prev = 'Назад';
  static String next = 'Далее';
  static String inputData = 'Ввод данных';
  static String enterData = 'Ввести данные';
  static String deleteData = 'Сбросить данные';
  static String getResults = 'Получить результаты';
  static String invalidData = 'Некорректные данные';
  static String maleWomen = 'Женский';
  static String maleMen = 'Мужской';
  static String toMainMenu = 'В главное меню';
  static String none = '';
}

class NameModules {
  static String menuModule = 'Меню';
  static String dataModule = 'Просмотр данных';
  static String indicatorsModule = 'Показатели';
  static String resultModule = 'Результаты';
  static String homeModule = 'Данные';
  static String helpModule = 'Справка';
}

class BackRouteNames {
  static String menuModule = 'В меню';
  static String dataModule = 'К просмотру данных';
  static String indicatorsModule = 'К показателям';
  static String resultModule = 'К результатам';
  static String homeModule = 'К данным';
  static String helpModule = 'К руководству';
}

class Routes {
  static Route toDataRoute(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DataParams.dataScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final toMenu = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
        final offsetAnimation = animation.drive(toMenu);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route toMenuRoute(BuildContext context) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DataParams.menuScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final toMenu = Tween(begin: Offset(-1.0, 0.0), end: Offset.zero);
          final offsetAnimation = animation.drive(toMenu);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );

  static Route backRoute(BuildContext context, Widget screen) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final toMenu = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
          final offsetAnimation = animation.drive(toMenu);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );

  static Route toHelpRoute(BuildContext context, Widget screen) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final toMenu = Tween(begin: Offset(-1.0, 0.0), end: Offset.zero);
          final offsetAnimation = animation.drive(toMenu);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );

  static Route toHomeRoute(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DataParams.screens.last,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final toMenu = Tween(begin: Offset(-1.0, 0.0), end: Offset.zero);
        final offsetAnimation = animation.drive(toMenu);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route toInputScreen(BuildContext context, int number) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DataParams.screens[number]);
  }

  static Route toResultScreen(BuildContext context) => MaterialPageRoute(
        builder: (BuildContext context) => DataParams.resultScreen,
      );

  static Route backForwardRoute(
      BuildContext context, bool isForward, int number) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DataParams.screens[(isForward) ? number + 1 : number - 1],
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final toMenu = Tween(
            begin: Offset((isForward) ? 1.0 : -1.0, 0.0),
            end: Offset(0.0, 0.0));
        final offsetAnimation = animation.drive(toMenu);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route toParamScreen(BuildContext context, IndicatorModel param) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ParamsScreen(param),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final toMenu = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
        final offsetAnimation = animation.drive(toMenu);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
