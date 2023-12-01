import 'package:flutter/material.dart';

class AsetScreen extends StatefulWidget {
  const AsetScreen({super.key});

  @override
  State<AsetScreen> createState() => _AsetScreenState();
}

class _AsetScreenState extends State<AsetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "Aset"
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        
      ),
    );
  }
}