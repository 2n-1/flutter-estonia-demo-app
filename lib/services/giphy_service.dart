import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:hive/hive.dart';

class GiphyService {
  Future<void> pickGif(
    BuildContext context,
  ) async {
    var box = await Hive.openBox('gifBox');
    GiphyGif? gif = await GiphyPicker.pickGif(
      context: context,
      apiKey: '4LW4OBgBUYPeGxx3YRH4q44ia4XV0yuU',
    );
    if (gif != null) {
      await box.put('gif', gif.images.original!.url);
    }
  }

  Future<String?> getGif() async {
    var box = await Hive.openBox('gifBox');
    return box.get('gif');
  }
}
