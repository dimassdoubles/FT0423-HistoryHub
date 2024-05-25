import 'package:flutter/material.dart';
import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources.dart';
import 'package:history_hub/src/core/data/models/kecamatan.dart';
import 'package:history_hub/src/features/register/presentation/controllers/select_address_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_kecamatan_provider.g.dart';

@riverpod
Future<List<Kecamatan>> listKecamatan(ListKecamatanRef ref) async {
  debugPrint('listKecamatanProvider');

  // TODO fix this later
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final datasource = ref.read(appRemoteDatasourcesProvider);
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final kabupaten = ref.watch(
    selectAddressControllerProvider.select((value) => value.kabupaten),
  );

  if (kabupaten == null) {
    return [];
  }

  final (err, result) = await datasource.getListKecamatan(
    kabupaten.id,
  );

  if (err != null) {
    throw Exception();
  }

  return result!;
}
