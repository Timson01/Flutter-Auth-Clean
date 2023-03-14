import 'package:flutter_auth_clean/features/notes/domain/model/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
}
