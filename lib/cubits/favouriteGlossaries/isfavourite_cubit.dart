import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:glossary_app/cubits/favouriteGlossaries/isfavourite_state.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

class IsFavouriteCubit extends Cubit<IsfavouriteState> {
  final GlossaryRepo _repository;

  IsFavouriteCubit(this._repository) : super(IsfavouriteInitial());

  Future<List<GlossaryModel>?> fetchGlossaryFavourites() async {
    emit(IsfavouriteLoading());

    try {
      final response = await _repository.getFavourites();
      emit(IsfavouriteLoaded(response));
    } on DioError catch (err) {
      emit(IsfavouriteError(err.message.toString()));
    }
    return null;
  }

  Future toggleGlossaryFavourites(
      {required int id, required bool isFavourite}) async {
    emit(IsfavouriteLoading());

    try {
      final response =
          await _repository.updateFavourite(id: id, isFavourite: isFavourite);
      emit(IsfavouriteLoaded(response));
    } on DioError catch (err) {
      emit(IsfavouriteError(err.message.toString()));
    }
  }
}
