import 'package:glossary_app/data/models/glossary_model.dart';

abstract class GlossaryState {}

class GlossaryInitial extends GlossaryState {}

class LoadingGlossaryState extends GlossaryState {}

class LoadedGlossaryState extends GlossaryState {
  final List<GlossaryModel> glossary;
  LoadedGlossaryState(this.glossary);
}

class ErrorGlossaryState extends GlossaryState {
  final String errMsg;
  ErrorGlossaryState(this.errMsg);
}
