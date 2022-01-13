/// 接種証明書
class InoculationProof {
  /// 名前
  String name;
  /// 備考
  String? description;
  /// 接種証明書の画像
  String? imageURL;
  /// 接種日時
  DateTime timestamp;

  InoculationProof(this.name, this.timestamp);
}
