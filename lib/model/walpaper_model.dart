class WalpaperModel {
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  WalpaperModel(
      {required this.photographer,
      required this.photographerUrl,
      required this.photographerId,
      required this.src});

  factory WalpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WalpaperModel(
        photographer: jsonData["photographer"] ?? "Unknown Photographer",
        photographerUrl: jsonData["photographer_url"] ?? "",
        photographerId: jsonData["photographer_id"] ?? 0,
        src: SrcModel.fromMap(jsonData["src"] ?? {}));
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel(
      {required this.original, required this.small, required this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        original: jsonData["original"] ?? "",
        small: jsonData["small"] ?? "",
        portrait: jsonData["portrait"] ?? "");
  }
}
