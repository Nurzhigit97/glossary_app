import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:glossary_app/data/models/glossary_model.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

import 'glossary_state.dart';

class GlossaryCubit extends Cubit<GlossaryState> {
  final GlossaryRepo _repository;

  GlossaryCubit(this._repository) : super(GlossaryInitial());

  Future<void> fetchGlossary(String? query) async {
    emit(LoadingGlossaryState());

    try {
      List<GlossaryModel> response = await _repository.getAll(query: query);
      emit(LoadedGlossaryState(response));
    } on DioError catch (err) {
      emit(ErrorGlossaryState(err.message.toString()));
    }
  }
}
