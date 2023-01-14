import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glossary_app/data/models/user_model.dart';
import 'package:glossary_app/data/repositories/firebase_service.dart';
import 'package:glossary_app/ui/admin_panel/admin_panel.dart';
import 'package:glossary_app/ui/drawer_page/drawer_pages/history_page.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final userUid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 200,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.6,
                  colorFilter: ColorFilter.srgbToLinearGamma(),
                  image:
                      AssetImage('assets/Glossary-of-Banking-Terms-RVR-1.jpg'),
                ),
              ),
              child: Text(
                'Глоссарий информатика',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('История'),
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(HistoryPage.route);
              },
            ),

            /// получаем данные пользователя из firestore по id
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance.doc('users/$userUid').get(),
              builder: (context, snapshot) {
                /// проверяем получили ли данные
                if (snapshot.hasData) {
                  // for fix: data() == null
                  if (snapshot.data?.data() == null) {
                    return SizedBox.shrink();
                  }
                  final firestoreDocJson = snapshot.data!.data()!;
                  final userModel = UserModel.fromJson(firestoreDocJson);
                  final role = userModel.role;

                  /// это админ ?
                  if (role == UserRole.admin) {
                    return ListTile(
                      title: const Text('Admin Panel'),
                      onTap: () {
                        Navigator.of(
                          context,
                          rootNavigator: true,
                        ).pushNamed(AdminPanel.route);
                        setState(() {});
                      },
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }

                /// иначе загрузка
                return SizedBox.shrink();
              },
            ),

            FirebaseAuth.instance.currentUser?.email == null
                ? SizedBox.shrink()
                : Stack(alignment: Alignment.bottomCenter, children: [
                    TextButton(
                      onPressed: () =>
                          context.read<FirebaseService>().signOut(),
                      child: Text('Выйти'),
                    ),
                  ]),
          ],
        ),
      ),
    );
  }
}
