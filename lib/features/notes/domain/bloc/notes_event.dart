part of 'notes_bloc.dart';

abstract class NotesEvent {}

class ClearNotes extends NotesEvent {}

class GetNoteEvent extends NotesEvent {}
