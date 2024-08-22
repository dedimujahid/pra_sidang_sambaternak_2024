import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sambaternak_baru_2024/app/routes/app_pages.dart';
import 'package:sambaternak_baru_2024/themes/theme.dart';
import 'package:sambaternak_baru_2024/utils/utils.dart';

import '../../bottom_nav_bar/views/bottom_nav_bar_view.dart';
import '../components/table_cell.dart';

class Profile extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil informasi user yang sedang login
    final currentUser = _auth.currentUser;

    // Jika user belum login, Anda dapat menampilkan widget lain, misalnya tampilan login
    // atau memberi tahu pengguna untuk login terlebih dahulu.

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
      bottomNavigationBar: const BottomNavBarView(),
      backgroundColor: ArgonColors.bgColorScreen,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/images/backgroundsapi.jpeg"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: .0,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 85.0, bottom: 20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Align(
                                            child: Text(
                                              // Tampilkan nama user yang sedang login
                                              currentUser?.displayName ??
                                                  "Guest",
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 28.0,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Align(
                                            child: Text(
                                              // Tampilkan email user yang sedang login
                                              currentUser?.email ??
                                                  "guest@example.com",
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    50, 50, 93, 1),
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            height: 10.0,
                                            thickness: 1.5,
                                            indent: 32.0,
                                            endIndent: 32.0,
                                          ),
                                          TableCellSettings(
                                            title: "Notifikasi",
                                            onTap: () => Dialogs().dialogEmpty,
                                          ),
                                          const Divider(
                                            height: 10.0,
                                            thickness: 1.5,
                                            indent: 32.0,
                                            endIndent: 32.0,
                                          ),
                                          TableCellSettings(
                                            title: "Riwayat Transaksi",
                                            onTap: () => Dialogs().dialogEmpty,
                                          ),
                                          const Divider(
                                            height: 10.0,
                                            thickness: 1.5,
                                            indent: 32.0,
                                            endIndent: 32.0,
                                          ),
                                          TableCellSettings(
                                            title: "Kelola Langganan",
                                            onTap: () => Dialogs().dialogEmpty,
                                          ),
                                          const Divider(
                                            height: 10.0,
                                            thickness: 1.5,
                                            indent: 32.0,
                                            endIndent: 32.0,
                                          ),
                                          TableCellSettings(
                                            title: "Keluar",
                                            onTap: () {
                                              _auth.signOut();
                                              Get.toNamed(Routes.LOGIN);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const FractionalTranslation(
                            translation: Offset(0.0, -0.5),
                            child: Align(
                              alignment: FractionalOffset(0.5, 0.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/images/blank-profile.png"),
                                radius: 65.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
