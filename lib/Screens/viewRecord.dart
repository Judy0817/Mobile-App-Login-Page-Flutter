import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Reusable/reusable.dart';
import 'package:firebase_database/firebase_database.dart';


FirebaseDatabase database = FirebaseDatabase.instance;
User? user = FirebaseAuth.instance.currentUser;
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://your-realtime-database-url.firebaseio.com/');
final ref = FirebaseDatabase.instance.ref();

//final snapshot = await ref.child('User Data/$').get();

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
      drawer: MyDrawer(context,"judykaushalya3@gmail.com","Judy kaushalya"),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      // Text(
                      //   "${user?.uid}",
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}