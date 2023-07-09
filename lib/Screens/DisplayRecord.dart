import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Reusable/reusable.dart';

class DisplayRecord extends StatefulWidget {
  const DisplayRecord({Key? key}) : super(key: key);

  @override
  State<DisplayRecord> createState() => _DisplayRecordState();
}

class _DisplayRecordState extends State<DisplayRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyappBar("Add Record"),
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
