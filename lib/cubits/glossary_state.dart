part of 'glossary_cubit.dart';

@immutable
abstract class GlossaryState {}

class GlossaryInitial extends GlossaryState {}

class LoadingGlossaryState extends GlossaryState {}

class LoadedGlossaryState extends GlossaryState {
  final GlossaryModel glossary;
  LoadedGlossaryState(this.glossary);
}

class ErrorGlossaryState extends GlossaryState {
  final String errMsg;
  ErrorGlossaryState(this.errMsg);
}
