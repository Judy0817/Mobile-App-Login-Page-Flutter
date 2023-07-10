import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:login_flutter/Screens/viewRecord.dart';
import '../Reusable/reusable.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://your-realtime-database-url.firebaseio.com/');
DatabaseReference ref = FirebaseDatabase.instance.ref("User Data/");

class DisplayRecord extends StatefulWidget {
  const DisplayRecord({Key? key}) : super(key: key);

  @override
  State<DisplayRecord> createState() => _DisplayRecordState();
}

class _DisplayRecordState extends State<DisplayRecord> {

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _birthdayTextController = TextEditingController();
  final TextEditingController _indexNoTextController = TextEditingController();
  final TextEditingController _campusNameTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar("Profile"),
      drawer: MyDrawer(context, "judykaushalya3@gmail.com", "Judy kaushalya"),
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
                    horizontal: 30.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ReusableTextField(
                        TextInputType.text,
                        "Full Name",
                        Icons.person,
                        _fullNameTextController,
                      ),
                      SizedBox(height: 10.0),
                      ReusableTextField(
                        TextInputType.emailAddress,
                        "Email",
                        Icons.email,
                          _emailTextController
                      ),
                      SizedBox(height: 10.0),
                      ReusableTextField(
                        TextInputType.datetime,
                        "Date of Birth",
                        Icons.calendar_month,
                          _birthdayTextController
                      ),
                      SizedBox(height: 10.0),
                      ReusableTextField(
                        TextInputType.text,
                        "Index No",
                        Icons.document_scanner,
                          _indexNoTextController
                      ),
                      SizedBox(height: 10.0),
                      ReusableTextField(
                        TextInputType.text,
                        "Campus Name",
                        Icons.school,
                          _campusNameTextController
                      ),
                      SizedBox(height: 10.0),
                      SignInSignUpBtn(
                        "Save Changes",
                        () async {
                          if(_fullNameTextController.text=="" || _emailTextController.text=="" || _birthdayTextController.text=="" || _indexNoTextController.text=="" || _fullNameTextController.text=="" || _campusNameTextController.text=="" ){
                            ScaffoldMessenger.of(context).showSnackBar(
                                errorMessage("Please Fill all details."));
                          }else{
                            await ref.set({

                              "FullName":_fullNameTextController.text,
                              "Email":_emailTextController.text,
                              "Date Of Birth":_birthdayTextController.text,
                              "Index No":_indexNoTextController.text,
                              "Campus Name":_campusNameTextController.text,
                            }
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewRecord(),
                              ),
                            );
                          }

                        }),
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
