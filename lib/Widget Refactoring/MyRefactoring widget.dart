import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRefactoringWidget extends StatelessWidget{
  final Color? bgcolor;
  final Image? rimage;
  VoidCallback? onClick;
  Widget? label;
  Widget? ricon;

  MyRefactoringWidget({
    this.bgcolor,
    required this.rimage,
    this.label,
    this.onClick,
    this.ricon
});

  @override
  Widget build(BuildContext context) {

    return Card(
      color: bgcolor,
      child: Center(
        child: ListTile(
          title: label,
          leading: rimage,
          onTap: onClick,
          trailing: ricon,
        ),
      ),
    );
  }

}