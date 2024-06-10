part of 'add_note_cubit.dart';

@immutable
class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSucess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
  @override
  String toString() => 'AddNoteFailure: $errorMessage';
}
