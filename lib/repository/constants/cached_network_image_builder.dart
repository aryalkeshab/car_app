import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_app/repository/constants/ui_assets.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final String? localImagePath;
  final BoxFit? fit;
  final double? aspectRatio;

  const CustomCachedNetworkImage(this.imageUrl,
      {this.localImagePath, Key? key, this.fit, this.aspectRatio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // imageUrl!
      imageUrl: UIAssets.appLogo,
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: aspectRatio ?? 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          UIAssets.appLogo,
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (context, url, error) => AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          localImagePath ?? UIAssets.appLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
