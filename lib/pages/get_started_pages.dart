import 'package:flutter/material.dart';

class GetStartedPages extends StatelessWidget {
  const GetStartedPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/get_started.png"),
            ),
            Text("Welcome to quiz app"),
        
            ElevatedButton(onPressed: (){}, child: Text("Let's get started"))
          ],
          
        ),
      ),
    );
  }
}