import 'package:wanlog/shared_models/biological_sex.dart';
import 'package:wanlog/shared_models/inoculation_proof.dart';

/// 犬
class Dog {
  /// 名前
  String name;
  /// 生物学的性別
  BiologicalSex biologicalSex;
  /// 誕生日
  DateTime birthDate;
  /// 接種履歴
  List<InoculationProof> inoculationProofs;

  Dog(this.name, this.biologicalSex, this.birthDate, this.inoculationProofs);
}