import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Reusable/reusable.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
User? user = FirebaseAuth.instance.currentUser;
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(
    app: firebaseApp,
    databaseURL: 'https://your-realtime-database-url.firebaseio.com/');
final ref = FirebaseDatabase.instance.ref('Users/${user?.uid}');


class ViewRecord extends StatefulWidget {
  const ViewRecord({Key? key}) : super(key: key);

  @override
  State<ViewRecord> createState() => _ViewRecord();
}

class _ViewRecord extends State<ViewRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar("View Record"),
      drawer: MyDrawer(context, "judykaushalya3@gmail.com", "Judy kaushalya"),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Expanded(
                  child: FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Column(
                        children: [
                          Text(
                            snapshot.child('Users/${user?.uid}').value.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
