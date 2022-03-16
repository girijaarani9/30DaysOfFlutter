import 'package:flutter/material.dart';
import 'package:flutter_days/utils/MyRoutes.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String name = '';
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login.png"),
            SizedBox(
              height: 20,
            ),
            Text("Welcome $name",
                style: TextStyle(
                  fontSize: 25,
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password")),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, MyRoutes.home);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: Alignment.center,
                width: changeButton ? 50 : 150,
                height: 50,
                child: changeButton
                    ? Icon(Icons.done)
                    : Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: changeButton
                        ? BorderRadius.circular(50)
                        : BorderRadius.circular(8)),
              ),
            )
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, MyRoutes.home);
            //     },
            //     child: Text("Log In"),
            //     style: TextButton.styleFrom(minimumSize: Size(120, 40))
            //     // style: TextStyle(fontSize: 15),
            //     )
          ],
        ),
      ),
    );
  }
}
