import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glossary_app/data/models/user_model.dart';

class UserService {
  // List<TodoModel> todos = [];
  //! start use FireBase
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  /// get user todos collection ref
  CollectionReference<Map<String, dynamic>> _userTodosRef() {
    final ref = FirebaseFirestore.instance.collection('users');
    return ref;
  }

  Stream<List<UserModel>> readTodo() {
    return _userTodosRef().snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .toList(),
        );
  }

  Future addUser(
    UserModel todoModel,
  ) async {
    //! local todosList
    // todos.add(todoModel);
    final docTodo = _userTodosRef().doc(todoModel.id);

    final json = todoModel.toJson();
    await docTodo.set(json);
  }

  Future removeTodo(String idTodo) async {
    //! local todosList
    /* var index = todos.indexWhere((element) => element.id == idTodo);
    todos.removeAt(index); */

    final docTodo = _userTodosRef().doc(idTodo);
    await docTodo.delete();
  }
}
