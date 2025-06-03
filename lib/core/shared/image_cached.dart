import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCached extends StatelessWidget {
  final String imageUrl;
  final double? width, height;
  final BoxFit? fit;
  final VoidCallback? onTap;

  const ImageCached({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        progressIndicatorBuilder:
            (BuildContext context, String url, DownloadProgress progress) =>
                OverflowBox(
          maxHeight: 2,
          minHeight: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LinearProgressIndicator(
              value: progress.progress,
              color: Colors.black,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
