import 'package:bloc/bloc.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_state.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class IsFavouriteCubit extends Cubit<IsfavouriteState> {
  final GlossaryRepo _repository;

  IsFavouriteCubit(this._repository) : super(IsfavouriteInitial());

  Future fetchGlossaryFavourites() async {
    emit(IsfavouriteLoading());

    try {
      List<GlossaryModel> response = await _repository.getFavourites();
      emit(IsfavouriteLoaded(response));
    } catch (err) {
      emit(IsfavouriteError(err.toString()));
    }
  }

  Future toggleGlossaryFavourites({id, title, description, isFavourite}) async {
    emit(IsfavouriteLoading());

    try {
      List<GlossaryModel> response = await _repository.updateFavourite(
          id: id,
          title: title,
          description: description,
          isFavourite: isFavourite);
      emit(IsfavouriteLoaded(response));
    } catch (err) {
      emit(IsfavouriteError(err.toString()));
    }
  }
}
