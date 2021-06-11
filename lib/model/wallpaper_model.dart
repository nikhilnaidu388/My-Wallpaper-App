class WallpaperModel {
  WallpaperModel(
      {this.photographer = "",
      this.photographerUrl = "",
      this.photographerId = 0,
      required this.src});
  late String photographer;
  late String photographerUrl;
  late int photographerId;

  late SrcModel src = SrcModel();

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonMap) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonMap["src"]),
        photographerUrl: jsonMap["photographer_url"],
        photographerId: jsonMap["photographer_id"],
        photographer: jsonMap["photographer"]);
  }
}

class SrcModel {
  SrcModel({
    this.original = "",
    this.small = "",
    this.portrait = "",
  });
  late String original;
  late String small;
  late String portrait;

  factory SrcModel.fromMap(Map<String, dynamic> jsonMap1) {
    return SrcModel(
        portrait: jsonMap1["portrait"],
        original: jsonMap1["original"],
        small: jsonMap1["small"]);
  }
}
