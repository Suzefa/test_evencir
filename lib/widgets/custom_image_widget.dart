import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_evencir/test_evencir.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageAddress;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final Color? color;
  final bool isColorBlendMode;
  final bool isForThumbnail;
  final Widget? errorWidget;

  const CustomImageWidget({
    super.key,
    required this.imageAddress,
    this.height,
    this.width,
    this.boxFit,
    this.isColorBlendMode=false,
    this.color,
    this.errorWidget,
    this.isForThumbnail = true,
  });

  @override
  Widget build(BuildContext context) {
    if(imageAddress.isEmpty) {
      return Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(10.0.sp,),
        child: FittedBox(
          child: errorWidget ??  const Icon(Icons.error_outline),
        ),
      );
    } else if(imageAddress.endsWith(".svg")) {
      return SvgPicture.asset(
        imageAddress,
        height: height,
        width: width,
        fit: boxFit ?? BoxFit.contain,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }
    return Image.asset(
      imageAddress,
      height: height,
      width: width,
      fit: boxFit,
      color: color,
      errorBuilder: (ctx,err,stc) {
        return Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(10.0.sp,),
          child: FittedBox(
            child: errorWidget ??  const Icon(Icons.error_outline),
          ),
        );
      },
    );
  }
}
