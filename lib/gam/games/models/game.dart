import 'package:flutter/material.dart';
import 'package:zizu/gam/gen/assets.gen.dart';

enum Version {
  ps4,
  ps5,
}

extension Versionextension on Version {
  String get asset {
    switch (this) {
      case Version.ps4:
        return Assets.svg.ps4;

      case Version.ps5:
        return Assets.svg.ps5;
    }
  }
}

class Game {
  const Game({
    this.image,
    this.name,
    this.versions,
  });

  final ImageProvider image;

  final String name;

  final List<Version> versions;
}
