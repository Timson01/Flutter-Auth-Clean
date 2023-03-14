import 'package:flutter_auth_clean/features/notes/domain/model/note.dart';
import 'package:flutter_auth_clean/features/notes/domain/repository/notes_repository.dart';

import '../api/service/notes_service.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesService _notesService;

  NotesRepositoryImpl(this._notesService);
  @override
  Future<List<Note>> getNotes() async {
    return _notesService.getNotes();
  }
}
