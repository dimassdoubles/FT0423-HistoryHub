import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_address_controller.g.dart';

class SelectAddressState {
  final Kabupaten? kabupaten;
  final Kecamatan? kecamatan;
  final Kelurahan? kelurahan;

  SelectAddressState({
    required this.kabupaten,
    required this.kecamatan,
    required this.kelurahan,
  });

  SelectAddressState copyWith({
    Kabupaten? kabupaten,
    Kecamatan? kecamatan,
    Kelurahan? kelurahan,
  }) {
    return SelectAddressState(
      kabupaten: kabupaten ?? this.kabupaten,
      kecamatan: kecamatan ?? this.kecamatan,
      kelurahan: kelurahan ?? this.kelurahan,
    );
  }
}

@riverpod
class SelectAddressController extends _$SelectAddressController {
  @override
  SelectAddressState build() {
    return SelectAddressState(
      kabupaten: null,
      kecamatan: null,
      kelurahan: null,
    );
  }

  void selectKabupaten(Kabupaten kabupaten) {
    state = state.copyWith(kabupaten: kabupaten);
  }

  void selectKecamatan(Kecamatan kecamatan) {
    state = SelectAddressState(
      kabupaten: state.kabupaten,
      kecamatan: kecamatan,
      kelurahan: null,
    );
  }

  void selectKelurahan(Kelurahan kelurahan) {
    state = state.copyWith(kelurahan: kelurahan);
  }

  void save() {
    
  }
}
