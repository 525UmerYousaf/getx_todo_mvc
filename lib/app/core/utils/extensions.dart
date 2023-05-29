import 'package:flutter/material.dart';
import 'package:get/get.dart';

//  With following i'm gonna made my app widget's height
//  & width responsive based on different device sizes.
extension PercentSized on double {
  double get hp => (Get.height * (this / 100));
  double get hw => (Get.width * (this / 100));
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}

//  Reason for below color conversion is bcz we're gonna store
//  color and icon in the app, bcz each task has it's color.
//  As, in model class "color" is an instance variable of class
//  "Task".
extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    /*
    The if statement checks the length of the hex string. 
    If it is 6 characters long, then the ff is prepended to the string. 
    This is because a 6-character hex string represents an RGB color with 
    an alpha value of 255. If the hex string is 7 characters long, 
    then no prefix is needed.
    The buffer.write method appends the specified string to the buffer. 
    In this case, the hex string is appended to the buffer.
    */
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    /*
    The int.parse method converts the string to an integer. The radix 
    parameter specifies the radix of the string. In this case, 
    the radix is 16. The Color constructor creates a new Color
    instance with the specified value.
    */
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // String toHex({bool leadingHashSign = true}) => '${leadingHashSign}';
  // '${alpha.toRadixString(16).padLeft(2, '0)}'
  // '${red.toRadixString(16).padLeft(2, '0)}'
  // '${green.toRadixString(16).padLeft(2, '0)}'
  // '${blue.toRadixString(16).padLeft(2, '0)}';
  String toHex({bool leadingHashSign = true}) {
    final buffer = StringBuffer();
    if (leadingHashSign) {
      buffer.write('#');
    }
    //  Above, I prepended to the String "#".

    //  Below I append the "alpha", "red", "green", and "blue
    //  values to the StringBuffer.
    buffer.write(alpha.toRadixString(16).padLeft(2, '0'));
    buffer.write(red.toRadixString(16).padLeft(2, '0'));
    buffer.write(green.toRadixString(16).padLeft(2, '0'));
    buffer.write(blue.toRadixString(16).padLeft(2, '0'));

    //  last line is use to returns contents of buffer as a String.
    return buffer.toString();
  }
}
