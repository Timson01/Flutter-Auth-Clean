import 'package:dio/dio.dart';

import '../../../../../locator.dart';
import '../../../domain/model/note.dart';

class NotesService {
  Future<List<Note>> getNotes() async {
    final response = await locator<Dio>().get('/api/notes/');
    print(response.data);
    return [];
  }
}
