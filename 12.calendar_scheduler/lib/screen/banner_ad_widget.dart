import "dart:io";
import "package:flutter/material.dart";
import "package:google_mobile_ads/google_mobile_ads.dart";


class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget ({Key? key}) : super(key : key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}


class _BannerAdWidgetState extends State<BannerAdWidget> {
  late final BannerAd banner;

  @override
  void initState() {
    super.initState();

    final adUnitId = Platform.isIOS ? "IOS banner ID" : "Android banner ID";

    banner = BannerAd(
      size : Adsize.banner,
      adUnitId : adUnitId,
      listener : BannerAdListener(onAdFailedToLoad : (ad, error) { ad.dispose(); }),
      request : AdRequest(),
    );

    banner.load();
  }

  @override
  void dispose() {
    banner.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return SizedBox(
      height : 75,
      child : AdWidget(ad : banner),
    );
  }
}