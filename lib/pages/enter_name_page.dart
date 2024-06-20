import 'package:flutter/material.dart';
import 'package:quiz_app/pages/quiz_play_page.dart';

class EnterNamePage extends StatelessWidget {
  const EnterNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController? inputNameController;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/get_started.png"),
              ),
              Text("Enter your name to get start"),
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                controller: inputNameController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter your name",
                  prefixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.only(top: 14),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const QuizPlayPage()));
                    }
                  },
                  child: Text("Let's play"))
            ],
          ),
        ),
      ),
    );
  }
}
