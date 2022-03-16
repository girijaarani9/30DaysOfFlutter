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
  final _formKey = GlobalKey<FormState>();
  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User Name is Mandatory';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Mandatory';
                        } else if (value.length < 6) {
                          return 'Pass should be atleast 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => moveToHome(),
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
      ),
    );
  }
}
