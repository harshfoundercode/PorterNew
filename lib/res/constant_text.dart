import 'package:flutter/material.dart';

import 'constant_color.dart';

Widget elementsBold({
  required String text,
  Color color = PortColor.black,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 10,
    ),
  );
}

Widget elementsMedium({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 10,
    ),
  );
}

Widget elementsSmall({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 10,
    ),
  );
}

Widget titleBold({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 12,
    ),
  );
}

Widget titleMedium({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 12,
    ),
  );
}

Widget titleSmall({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
  );
}

Widget headingBold({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 14,
    ),
  );
}

Widget headingMedium({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  );
}

Widget headingSmall({
  required String text,
  Color color = PortColor.white,
  TextAlign textAlign = TextAlign.start,
  bool strikethrough = false,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
  );
}

// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
//
// class ConstText extends StatelessWidget {
//   const ConstText({
//     super.key,
//     required this.title,
//     this.fontSize,
//     this.fontWeight,
//     required this.color,
//     this.overflow, this.fontFamily, this.maxLine, this.textAlign,
//   });
//   final String title;
//   final int?  maxLine;
//   final String? fontFamily;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color color;
//   final TextOverflow? overflow;
//   final TextAlign? textAlign;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       title,
//       maxLines: maxLine,
//       textAlign:textAlign??TextAlign.start ,
//       style: TextStyle(
//         fontSize: fontSize??12,
//         fontWeight: fontWeight??FontWeight.w400,
//         color: color,
//         fontFamily: fontFamily??"poppins",
//         overflow: overflow,
//
//
//
//       ),
//     );
//   }
// }


