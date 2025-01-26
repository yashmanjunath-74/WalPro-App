import 'package:flutter/material.dart';
import 'package:walpro/widget.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandname(),
        elevation: 0.0,
      ),
    );
  }
}
