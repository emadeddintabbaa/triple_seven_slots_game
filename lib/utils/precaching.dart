import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:triple_seven_slots_game/assets.dart';

class Precaching {
  Future<bool> loadGraphics(BuildContext context) async {
    await _precacheImages(context);
    await _loadComposition();
    return true;
  }

  Future<void> _precacheImages(BuildContext context) async {
    await Future.wait([
      precacheImage(Image.asset(wheelBorder).image, context),
      precacheImage(Image.asset(spinningPointer).image, context),
      precacheImage(Image.asset(star).image, context),
      precacheImage(Image.asset(wheelTitleIc).image, context),
      svg.cache.putIfAbsent(SvgAssetLoader(boardIc).cacheKey(null), () => SvgAssetLoader(boardIc).loadBytes(null)),

      svg.cache.putIfAbsent(SvgAssetLoader(playButton).cacheKey(null), () => SvgAssetLoader(playButton).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(arrowLeftIc).cacheKey(null), () => SvgAssetLoader(arrowLeftIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(arrowRightIc).cacheKey(null), () => SvgAssetLoader(arrowRightIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(seventhIc).cacheKey(null), () => SvgAssetLoader(seventhIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(appleIc).cacheKey(null), () => SvgAssetLoader(appleIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(barIc).cacheKey(null), () => SvgAssetLoader(barIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(lemonIc).cacheKey(null), () => SvgAssetLoader(lemonIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(coinIc).cacheKey(null), () => SvgAssetLoader(coinIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(watermelonIc).cacheKey(null), () => SvgAssetLoader(watermelonIc).loadBytes(null)),
      svg.cache.putIfAbsent(SvgAssetLoader(crownIc).cacheKey(null), () => SvgAssetLoader(crownIc).loadBytes(null)),

      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, boardIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, playButton), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, arrowLeftIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, arrowRightIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, seventhIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, appleIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, barIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, lemonIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, coinIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, watermelonIc), null),
      // precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, crownIc), null),
    ]);
  }

  Future<void> _loadComposition() async {
    await Future.wait([
      AssetLottie(confettiLottie).load(),
      AssetLottie(goldenConfettiLottie).load(),
      AssetLottie(coinsLottie).load(),
    ]);
  }
}
