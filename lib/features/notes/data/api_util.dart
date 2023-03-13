import 'package:flutter_auth_clean/features/notes/data/api/service/notes_service.dart';
import 'package:flutter_auth_clean/features/notes/domain/model/note.dart';

class ApiUtil {
  final NotesService _notesService;

  ApiUtil(this._notesService);

  Future<List<Note>> getNote() async {
    return _notesService.getNotes();
  }
}
