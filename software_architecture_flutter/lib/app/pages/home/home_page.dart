import 'package:flutter_test/flutter_test.dart';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:software_architecture_flutter/app/pages/home/components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return /*SingleChildScrollView(
      // * Used to avoid app rendering errors on phones with small screens.
      //padding: EdgeInsets.all(8.0),
      child:*/
        Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: CustomSwitchWidget(),
      ),
      //),
    );
  }
}
