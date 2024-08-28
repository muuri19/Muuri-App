import 'package:flutter/material.dart';

class TabBarProject extends StatelessWidget {
const TabBarProject({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Center(child: Text('Project List'),),
    );
  }
}