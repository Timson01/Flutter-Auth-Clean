import 'package:flutter_auth_clean/features/notes/domain/model/note.dart';
import 'package:flutter_auth_clean/features/notes/domain/repository/notes_repository.dart';

import '../api_util.dart';

class NotesRepositoryImpl implements NotesRepository {
  final ApiUtil _apiUtil;

  NotesRepositoryImpl(this._apiUtil);
  @override
  Future<List<Note>> getNotes() async {
    return _apiUtil.getNote();
  }
}
