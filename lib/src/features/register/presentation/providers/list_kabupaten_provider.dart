import 'package:history_hub/src/core/data/datasources/remote/app_remote_datasources_provider.dart';
import 'package:history_hub/src/core/data/models/kabupaten.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_kabupaten_provider.g.dart';

@riverpod
Future<List<Kabupaten>> listKabupaten(ListKabupatenRef ref) async {
  // TODO fix this later
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final datasource = ref.read(appRemoteDatasourcesProvider);

  final (err, result) = await datasource.getListKabupaten();
  await datasource.getListKecamatan(4);
  if (err != null) throw Exception();

  return result!;
}
