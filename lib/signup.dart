import 'package:flutter/material.dart';

class SignUppage extends StatefulWidget {
  const SignUppage({Key? key}) : super(key: key);

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  bool vis = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.white,
            ],
            begin: FractionalOffset(0.0, 1.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign up with email',
              style: TextStyle(
                  fontSize: 35, letterSpacing: 2, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            userTextField(),
            emailTextField(),
            passwordTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print('Validated');
                }
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff00A86B),
                ),
                child: Center(
                    child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('Username'),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Username cannot be empty';
                }
                return null;
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        children: [
          Text('Email'),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Email cannot be empty ';
              }
              return 'Invalid email';
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        children: [
          Text('Password'),
          TextFormField(
            obscureText: vis,
            validator: (value) {
              if (value!.isEmpty || value.length <= 8) {
                return 'Password cannot be Empty';
              } 
              return 'Password is too Long';
        
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      vis = !vis;
                    });
                  }),
              helperText: 'Password length should not be greater than 8',
              helperStyle: TextStyle(
                fontSize: 13,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
