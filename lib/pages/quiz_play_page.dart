import 'package:flutter/material.dart';

class QuizPlayPage extends StatefulWidget {
  final String name;
  final String topicName;
  final List<dynamic> questionsLength;

  const QuizPlayPage(
      {super.key,
      required this.name,
      required this.topicName,
      required this.questionsLength});

  @override
  State<QuizPlayPage> createState() => _QuizPlayPageState();
}

class _QuizPlayPageState extends State<QuizPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, ${widget.name}"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text("Questions: 1/2"),
          PageView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                Text("Wow"),
              ],
            );
          }),
          ElevatedButton(onPressed: () {}, child: Text("Next"))
        ],
      )),
    );
  }
}
