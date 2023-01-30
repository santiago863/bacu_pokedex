import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:skeletons/skeletons.dart';

class PokemonImageWidget extends StatelessWidget {
  final String url;
  final Size mediaQuery;
  const PokemonImageWidget({
    super.key,
    required this.url,
    required this.mediaQuery,
  });

  @override
  Widget build(BuildContext context) {
    double size = mediaQuery.width / 4;
    return ShakeWidget(
      duration: const Duration(seconds: 10),
      shakeConstant: ShakeSlowConstant1(),
      autoPlay: true,
      enableWebMouseHover: true,
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const SkeletonAvatar(),
        height: size,
        width: size,
      ),
    );
  }
}
