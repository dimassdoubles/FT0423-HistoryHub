import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  Kabupaten? kabupaten;
  Kecamatan? kecamatan;
  Kelurahan? kelurahan;

  @override
  dynamic build() {
    return;
  }

  void setAddress(
    Kabupaten kabupaten,
    Kecamatan kecamatan,
    Kelurahan kelurahan,
  ) {
    kabupaten = kabupaten;
    kecamatan = kecamatan;
    kelurahan = kelurahan;
  }
}
