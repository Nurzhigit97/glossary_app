import 'package:glossary_app/data/models/glossary_model.dart';

abstract class IsfavouriteState {}

class IsfavouriteInitial extends IsfavouriteState {}

class IsfavouriteLoading extends IsfavouriteState {}

class IsfavouriteLoaded extends IsfavouriteState {
  List<GlossaryModel> glossaryFavourite;
  IsfavouriteLoaded(this.glossaryFavourite);
}

class IsfavouriteError extends IsfavouriteState {
  final String errMsg;
  IsfavouriteError(this.errMsg);
}
