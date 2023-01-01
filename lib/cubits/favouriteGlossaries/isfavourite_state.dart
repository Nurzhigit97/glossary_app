abstract class IsfavouriteState {}

class IsfavouriteInitial extends IsfavouriteState {}

class IsfavouriteLoading extends IsfavouriteState {}

class IsfavouriteLoaded extends IsfavouriteState {
  final glossaryFavourite;
  IsfavouriteLoaded(this.glossaryFavourite);
}

class IsfavouriteError extends IsfavouriteState {
  final String errMsg;
  IsfavouriteError(this.errMsg);
}
