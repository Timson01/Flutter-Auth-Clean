import 'package:bloc/bloc.dart';
import 'package:flutter_auth_clean/features/notes/domain/repository/notes_repository.dart';
import 'package:meta/meta.dart';

import '../model/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository notesRepository;

  NotesBloc({required this.notesRepository}) : super(NotesInitial()) {
    on<GetNoteEvent>(getNote);
    on<ClearNotes>(clearNotes);
  }

  Future<void> getNote(GetNoteEvent event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    List<Note> notesList = await notesRepository.getNotes();
    if (notesList.isNotEmpty) {
      emit(NotesLoaded(notes: notesList));
    } else {
      emit(NotesLoadingError());
    }
  }

  Future<void> clearNotes(ClearNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoaded(notes: []));
  }
}
