import 'package:flutter/material.dart';
import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/kelurahan.dart';
import 'package:history_hub/src/features/register/presentation/controllers/select_address_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_kelurahan_provider.g.dart';

@riverpod
Future<List<Kelurahan>> listKelurahan(ListKelurahanRef ref) async {
  debugPrint('listKelurahanProvider');

  // TODO fix this later
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final datasource = ref.read(appRemoteDatasourcesProvider);
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final kecamatan = ref.watch(
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    selectAddressControllerProvider.select((value) => value.kecamatan),
  );

  if (kecamatan == null) {
    return [];
  }

  final (err, result) = await datasource.getListKelurahan(
    kecamatan.id,
  );

  if (err != null) {
    throw Exception();
  }

  return result!;
}
