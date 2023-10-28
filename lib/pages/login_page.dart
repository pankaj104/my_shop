import 'package:flutter/material.dart';
import 'package:my_shop/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/heyy.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                // ignore: prefer_const_constructors
                Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password should atleast 6 letter";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Material(
                        child: InkWell(
                          hoverColor: Colors.green,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            decoration: BoxDecoration(
                                // shape: changeButton
                                //     ? BoxShape.circle
                                //     : BoxShape.rectangle,
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(
                                    changeButton ? 50 : 8)),
                          ),
                        ),
                      )

                      // ElevatedButton(
                      //     onPressed: (() {
                      //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //     }),
                      //     child: Text("Login"),
                      //     style: TextButton.styleFrom(
                      //         backgroundColor: Colors.blue,
                      //         foregroundColor: Colors.white,
                      //         minimumSize: Size(130, 40)))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
