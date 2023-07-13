import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_flutter/Screens/viewRecord.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Reusable/reusable.dart';
import 'DisplayRecord.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
User? user = FirebaseAuth.instance.currentUser;
String? email = user?.email;
String? username = user?.displayName;

final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(
    app: firebaseApp,
    databaseURL: 'https://your-realtime-database-url.firebaseio.com/');

class Home extends StatefulWidget {
  final Function()? onTap;

  const Home({Key? key, this.onTap}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget DisplayRecordBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DisplayRecord()));
      },
      child: Container(
        padding: EdgeInsets.all(25.0),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget ViewRecordsBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ViewRecord()));
      },
      child: Container(
        padding: EdgeInsets.all(25.0),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "View Profile Details",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar("Home page"),
      drawer: MyDrawer(context,"$email","$username"),
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
                      DisplayRecordBtn(),
                      SizedBox(
                        height: 50.0,
                      ),
                      ViewRecordsBtn(),
                      SizedBox(
                        height: 50.0,
                      ),
                      // Text(
                      //     'Email: $email',
                      // ),
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