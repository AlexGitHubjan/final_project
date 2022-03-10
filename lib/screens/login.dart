import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var login = 'Неправильный логин';
    var pass = 'Неправильный пароль';
    final formKey = GlobalKey<FormState>();

    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(color: Colors.red, width: 4),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Image.asset('assets/umbrella.png'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      child: Image.asset('assets/umbrellatext.png'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Image.asset(
                            'assets/umbrella.png',
                            height: 20,
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            validator: (value) {
                              if (value != '+79110000000') {
                                return login;
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '+79110000000',
                              hintStyle: TextStyle(fontFamily: 'Umbrella'),
                              enabledBorder: borderStyle,
                              focusedBorder: borderStyle,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Image.asset(
                            'assets/biohazard.png',
                            height: 20,
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            validator: (value) {
                              if (value != 'umbrella') {
                                return pass;
                              }
                              return null;
                            },
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                                enabledBorder: borderStyle,
                                focusedBorder: borderStyle,
                                filled: true,
                                hintText: 'umbrella',
                                hintStyle: TextStyle(fontFamily: 'Umbrella'),
                                fillColor: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: const Text(
                        'Войти',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Umbrella',
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Ваше счастье - наша забота!',
                      style: TextStyle(
                          fontFamily: 'Umbrella',
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
