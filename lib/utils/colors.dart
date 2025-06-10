import 'package:flutter/material.dart';

class ColorConstant {
  static Color primaryDark = const Color(0xff045880);
  static Color primaryLightBlue = const Color(0xff068BCA);
  static Color labelColor = const Color(0xff181818);
  static Color hintColor = const Color(0xff6B6B6B);
  static Color bgColorBody = const Color(0xffEAEAEA);
  static Color menuBGColor = const Color(0xffffffff);
  static Color hoverColor = const Color(0xfff18800);
  static Color selectColor = const Color(0xff0575E6);
  static Color menuHeaderTextColor = const Color(0xff686868);
  static Color tabSelectedColor = const Color(0xff045880);
  static Color fieldFilledColor = const Color(0xffF7F8F9);
  static Color fieldBorderColor = const Color(0xffC6C6C6);
  static Color greyIconColor = const Color(0xff545454);
  static Color greylightBorderColor = const Color(0xff979797);
  static const Color darkGrey = Color(0xff5B5B5B);

  static Color bgColorbody = const Color(0xffEAEAEA);

  // for Custom Frame widget
  static Color frameBorderColor = const Color(0xffC6C6C6);
  static Color frameGreenColor = const Color(0xff1EAE69);
  static Color lightGray = const Color(0xffC6C6C6);
  static Color editBtnColor = const Color(0xff0A0A0A);

  static Color subTitleDark = const Color(0xff5B5B5B);

  static Color reportItemViewBg = const Color(0xffEEEEEE);

  static Color yellow = const Color(0xfff7c844);
  static Color bgColor = const Color(0xfff8f7f3);
  static Color bgSideMenu = const Color(0xff131e29);
  static Color searchBorderColor = const Color(0xffE0E0E0);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color pureRed = const Color(0xffFF0000);

  static Color deepOrangeA200 = fromHex('#ff6332');

  static Color lightBlue300 = fromHex('#5fcfff');

  static Color lightGreenA400 = fromHex('#67ea00');

  static Color red600 = fromHex('#f22929');

  static Color blueA700 = fromHex('#0061ff');

  static Color lightGreenA700 = fromHex('#4ec306');

  static Color green600 = fromHex('#349765');

  static Color gray50 = fromHex('#f9fbff');

  static Color red100 = fromHex('#ffe1cc');

  static Color black90087 = fromHex('#87000000');

  static Color yellow500 = fromHex('#ffee37');

  static Color black900 = fromHex('#000000');

  static Color pinkA700 = fromHex('#b20d78');

  static Color deepPurpleA400 = fromHex('#7031fc');

  static Color deepPurpleA200 = fromHex('#9a4afe');

  static Color deepOrange400 = fromHex('#f78a3b');

  static Color blueGray900 = fromHex('#262b35');

  static Color deepOrangeA400 = fromHex('#ff4b00');

  static Color gray70011 = fromHex('#11555555');

  static Color black90026 = fromHex('#26000000');

  static Color blueGray200 = fromHex('#bac1ce');

  static Color gray400 = fromHex('#c4c4c4');

  static Color blueGray100 = fromHex('#d6dae2');

  static Color blueGray400 = fromHex('#74839d');

  static Color blueGray300 = fromHex('#9ea8ba');

  static Color amber500 = fromHex('#feb909');

  static Color blue600 = fromHex('#228aed');

  static Color orange900 = fromHex('#d55600');

  static Color black9000c = fromHex('#0c000000');

  static Color gray300 = fromHex('#e3e4e5');

  static Color blue50 = fromHex('#e0ebff');

  static Color gray100 = fromHex('#f3f4f5');

  static Color black90075 = fromHex('#75000000');

  static Color cyan100 = fromHex('#c1fdff');

  static Color black90033 = fromHex('#33000000');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static const approveColor = Color(0xff1EAE69);

  static Color red = Colors.red;

  static Color orangeColor = const Color(0xfff18800);

  static Color reportEvenColor = const Color(0xffEEEEEE);
  // ignore: deprecated_member_use
  static Color reportOddColor = const Color(0xffEAEAEA).withOpacity(0.2);

  static const Color blueishCard = Color(0xffD1E9FF);

  static const Color lightFontColor = Color(0xff6B6B6B);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
