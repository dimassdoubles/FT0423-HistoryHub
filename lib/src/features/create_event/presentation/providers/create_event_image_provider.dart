import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_event_image_provider.g.dart';

@riverpod
class CreateEventImage extends _$CreateEventImage {
  @override
  File? build() {
    return null;
  }

  void set(File? file) {
    state = file;
  }
}
