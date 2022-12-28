import 'package:bloc/bloc.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

import 'glossary_state.dart';

class GlossaryCubit extends Cubit<GlossaryState> {
  final GlossaryRepo _repository;

  GlossaryCubit(this._repository) : super(GlossaryInitial());

  Future<void> fetchGlossary(String? query) async {
    emit(LoadingGlossaryState());

    try {
      final response = await _repository.getAll(query: query);
      emit(LoadedGlossaryState(response));
    } catch (err) {
      emit(ErrorGlossaryState(err.toString()));
    }
  }

  Future<void> fetchGlossaryFavourites() async {
    emit(LoadingGlossaryState());

    try {
      List<GlossaryModel> response = await _repository.getFavourites();
      emit(LoadedGlossaryState(response));
    } catch (err) {
      emit(ErrorGlossaryState(err.toString()));
    }
  }

  Future toggleGlossaryFavourites({id, title, description, isFavourite}) async {
    emit(LoadingGlossaryState());

    try {
      final response = await _repository.updateFavourite(
          id: id,
          title: title,
          description: description,
          isFavourite: isFavourite);
      emit(LoadedGlossaryState(response));
    } catch (err) {
      emit(ErrorGlossaryState(err.toString()));
    }
  }
}
