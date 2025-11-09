import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final int? maxLines;
  final bool isExpanded;
  final bool? softWrap;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? fontColor;
  final String? fontFamily;
  final Alignment? alignment;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final double? lineHeight;
  final TextDecoration textDecoration;
  final TextDirection textDirection;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.fontStyle,
    this.maxLines,
    this.alignment = Alignment.center,
    this.isExpanded = false,
    this.fontFamily,
    this.softWrap,
    this.textOverflow,
    this.lineHeight,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: isExpanded ? MediaQuery.of(context).size.width : null,
      child: Text(
        text,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          fontFamily: fontFamily,
          fontStyle: fontStyle,
          decoration: textDecoration,
          decorationColor: fontColor,
          height: lineHeight,
        ),
        textDirection: textDirection,
        overflow: textOverflow,
        maxLines: maxLines,
        softWrap: softWrap,
      ),
    );
  }
}