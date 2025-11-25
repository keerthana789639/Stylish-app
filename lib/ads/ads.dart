import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ads extends StatefulWidget {
  const Ads({super.key});

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  late BannerAd _bannerAd;
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      size: AdSize.mediumRectangle,
      adUnitId: "ca-app-pub-3940256099942544/9214589741",
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => isloading = true),
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('inline banner failed:$error');
        },
      ),
      request: const AdRequest(),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isloading) return const SizedBox(height: 60);
    return Center(
      child: SizedBox(
        height: _bannerAd.size.height.toDouble(),
        width: _bannerAd.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd),
      ),
    );
  }
}
