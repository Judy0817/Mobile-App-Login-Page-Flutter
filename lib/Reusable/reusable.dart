import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Screens/home.dart';
import '../Screens/loginScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Screens/map.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(
    app: firebaseApp,
    databaseURL: 'https://your-realtime-database-url.firebaseio.com/');

Align SignInSignUpBtn(String text, Function() onTap) {
  return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.purple,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ));
}

AppBar MyappBar(String text) {
  return AppBar(
    title: Text(text),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      )
    ],
    backgroundColor: Color(0xFF43073c),
  );
}

Widget MyDrawer(BuildContext context, String email, String name) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF43073c),
          ),
          accountEmail: Text(email),
          accountName: Text(name),
          currentAccountPicture: CircleAvatar(
            foregroundImage: AssetImage("images/mySaree.jpg"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("My Profile"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        ListTile(
          leading: Icon(Icons.map),
          title: Text("Map"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Map()));
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text("Contact Us"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.login),
          title: Text("Sign In"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Sign Out"),
          onTap: () async {
            autherrorHandle("SignOut",context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const LoginScreen(),
            //     ));
          },
        ),
      ],
    ),
  );
}

void autherrorHandle(String subtitle,BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext ctx){
        return AlertDialog(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Image.asset(
                  'images/warning.png',
                  height: 22.0,
                  width: 22.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(subtitle),
              ),
            ],
          ),
          content: Text("Do you wanna signout?"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context as BuildContext);
              },
              child: Text("Cancel",style: TextStyle(
                color: Colors.black,
              ),),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      });
}



SnackBar errorMessage(String msg) {
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text(
              "ERROR",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
            Text(
              msg,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
    behavior: SnackBarBehavior.fixed,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Align SignInSignUpBtnearlier(String text, {required void Function() onTap}) {
  return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.purple,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ));
}

Widget ReusableTextField(TextInputType type, String hintText, IconData icontype, TextEditingController myController) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.black38,
      borderRadius: BorderRadius.circular(10),
    ),
    height: 60.0,
    child: TextField(
      controller: myController,
      keyboardType: type,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          icontype,
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
        ),
      ),
    ),
  );
}
