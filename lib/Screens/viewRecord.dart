import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Reusable/reusable.dart';

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