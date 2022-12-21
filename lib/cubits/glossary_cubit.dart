import 'package:bloc/bloc.dart';
import 'package:glossary_app/data/repositories/glossary_repo.dart';

import 'glossary_state.dart';

class GlossaryCubit extends Cubit<GlossaryState> {
  final GlossaryRepo _repository;

  GlossaryCubit(this._repository) : super(GlossaryInitial());

  Future<void> fetchGlossary() async {
    emit(LoadingGlossaryState());

    try {
      final response = await _repository.getAll();
      emit(LoadedGlossaryState(response));
    } catch (err) {
      emit(ErrorGlossaryState(err.toString()));
    }
  }
}
