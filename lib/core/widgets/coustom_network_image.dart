import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double? radius ;
  const CoustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
     this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0.r),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(const Color.fromARGB(255, 25, 179, 102), BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
