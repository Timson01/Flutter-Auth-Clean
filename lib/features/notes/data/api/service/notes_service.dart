import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../locator.dart';
import '../../../domain/model/note.dart';

class NotesService {
  Future<List<Note>> getNotes() async {
    String? accessToken =
        await locator<FlutterSecureStorage>().read(key: ACCESS_TOKEN);
    try {
      final response = await locator<Dio>().get('/api/notes/',
          options: Options(headers: {"Authorization": "JWT $accessToken"}));
      print(response.data);
    } catch (e) {
      print(e);
    }
    return [];
  }
}
