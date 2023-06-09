part of 'notes_bloc.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<Note> notes;

  NotesLoaded({required this.notes});
}

class NotesLoadingError extends NotesState {}
