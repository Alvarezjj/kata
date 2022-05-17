import 'package:flutter/material.dart';
import 'package:parsing3/signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late Animation<Offset> animation1;
  late AnimationController _controller2;
  late Animation<Offset> animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeIn));

    _controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    animation2 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
        CurvedAnimation(parent: _controller2, curve: Curves.elasticInOut));
    _controller1.forward();
    _controller2.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.green,
            ],
            begin: const FractionalOffset(0.0, 8.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 50,
          ),
          child: Column(
            children: [
              SlideTransition(
                position: animation1,
                child: Text(
                  'Alvarez Group',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      fontSize: 38),
                ),
              ),
              SizedBox(height: 100),
              SlideTransition(
                position: animation1,
                child: Text(
                  'A place where legends are born',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              boxContainer(
                  'assets/images/g_blog.png', 'Continue with Google', null),
              SizedBox(
                height: 20,
              ),
              boxContainer(
                  'assets/images/f_blog.png', 'Continue with Facebook', null),
              SizedBox(
                height: 20,
              ),
              boxContainer('assets/images/e_blog.png', 'Continue with Email',
                  onEmailClick()),
              SizedBox(
                height: 20,
              ),
              SlideTransition(
                position: animation2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account? ',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onEmailClick()  {
   Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUppage()));
  }

  Widget boxContainer(String path, String text, onclick) {
    return SlideTransition(
      position: animation2,
      child: InkWell(
        onTap: onclick,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Image.asset(
                    path,
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(text,
                      style: TextStyle(fontSize: 16, color: Colors.black87)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
