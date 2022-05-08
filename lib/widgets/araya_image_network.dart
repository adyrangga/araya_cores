import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/araya_image_model.dart';
import 'araya_hovered.dart';

class ArayaImageNetwork extends StatelessWidget {
  const ArayaImageNetwork({
    Key? key,
    this.data,
    this.onTap,
    this.visibled = true,
    this.disabled = false,
    this.readOnly = false,
    this.margin,
    this.padding,
  }) : super(key: key);

  final ArayaImageModel? data;
  final Function()? onTap;
  final bool visibled;
  final bool disabled;
  final bool readOnly;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (data == null && data!.url.isEmpty) return const SizedBox();

    return Container(
      margin: margin,
      child: ArayaHovered(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: data?.url ?? '',
              height: data?.height,
              placeholder: (context, url) => const Icon(Icons.photo),
              errorWidget: (context, url, error) => const Icon(Icons.photo),
            ),
            Text(
              data?.alt ?? '',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
