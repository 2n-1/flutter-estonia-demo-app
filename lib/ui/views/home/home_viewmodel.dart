import 'package:eesti/app/app.locator.dart';
import 'package:eesti/services/giphy_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:share_plus/share_plus.dart';

class HomeViewModel extends BaseViewModel {
  final _giphyService = locator<GiphyService>();
  String? _gifUrl;

  String? get gifUrl => _gifUrl;

  Future<void> pickGif(
    BuildContext context,
  ) async {
    await _giphyService.pickGif(
      context,
    );
    rebuildUi();
  }

  Future<void> share() async {
    await Share.share('check out this gif lol $_gifUrl', subject: 'Look!');
  }

  Future runStartupLogic() async {
    _gifUrl = await _giphyService.getGif();
    rebuildUi();
  }
}
