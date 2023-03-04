part of 'exhibit_cubit.dart';

@immutable
abstract class ExhibitState {}

class ExhibitLoading extends ExhibitState {}

class ExhibitLoaded extends ExhibitState {
  final List<Exhibit> exhibits;

  ExhibitLoaded(this.exhibits);
}

class ExhibitError extends ExhibitState {
  final String errorMessage;

  ExhibitError(this.errorMessage);
}
