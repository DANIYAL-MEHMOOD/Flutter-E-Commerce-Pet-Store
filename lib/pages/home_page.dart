import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;

  //document IDs
  List<String> docIds = [];

  //get DocIds
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text('Sign in as :' " " + user.email!),
            ),
            // SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Icon(
                Icons.logout,
              ),
            )
            // MaterialButton(
            //   onPressed: () {
            //     FirebaseAuth.instance.signOut();
            //   },
            //
            //   color: Colors.deepPurple,
            //   child: const Text("Sign out"),
            // ),
          ],
        ),
      ),
      body: Center(
        child: Expanded(
          child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: docIds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(docIds[index]),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
