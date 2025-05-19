

import 'package:flutter/material.dart';

class Github extends StatelessWidget {
  const Github({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Git Hub"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Git Hub",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Git Hub",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}