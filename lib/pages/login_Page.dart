import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset("assets/images/login.png"),
          SizedBox(
            height: 20,
          ),
          Text("Welcome",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter UserName", labelText: "UserName"),
                ),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Password", labelText: "Password")),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 15),
              ))
        ],
      ),
    );
  }
}
