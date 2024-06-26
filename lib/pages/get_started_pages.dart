import 'package:flutter/material.dart';
import 'package:quiz_app/pages/enter_name_page.dart';

class GetStartedPages extends StatelessWidget {
  const GetStartedPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
              child: Center(
                  child: Text(
            "Welcome to Quiz App",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ))),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const EnterNameScreen()));
              },
              child: const Text("Let's get Started"))
        ],
      ),
    );
  }
}