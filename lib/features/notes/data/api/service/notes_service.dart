import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/utils/constants/strings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../locator.dart';
import '../../../domain/model/note.dart';

class NotesService {
  Future<List<Note>> getNotes() async {
    final response = await locator<Dio>().get('/api/notes/');
    print(response.data);
    return [];
  }
}
