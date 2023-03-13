import 'package:flutter_auth_clean/features/notes/domain/model/note.dart';
import 'package:flutter_auth_clean/features/notes/domain/repository/notes_repository.dart';

import '../notes_api_util.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesApiUtil _notesApiUtil;

  NotesRepositoryImpl(this._notesApiUtil);
  @override
  Future<List<Note>> getNotes() async {
    return _notesApiUtil.getNote();
  }
}
