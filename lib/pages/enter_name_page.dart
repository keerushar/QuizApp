import 'package:flutter/material.dart';

class EnterNamePage extends StatelessWidget {
  const EnterNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? inputNameController;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/get_started.png"),
            ),

            Text("Enter your name to get start"),
            TextField(
              cursorColor: Theme.of(context).primaryColor,
              controller: inputNameController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Enter your name",
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.only(top: 14),
              ),
            ),

            ElevatedButton(onPressed: (){
              
            }, child: Text("Let's play"))
          ],
        ),
      ),
    );
  }
}
