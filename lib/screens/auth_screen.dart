import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '/widgets/login_form.dart';
import '/widgets/sign_up_form.dart';
import '/widgets/social_buttons.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: defaultDuration,
    );

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            children: [
              //Login
              AnimatedPositioned(
                duration: defaultDuration,
                width: _size.width * 0.88, // 88% signup bar
                height: _size.height,
                left: _isShowSignUp ? -_size.width * 0.76 : 0, // 76% login bar
                child: Container(
                  color: login_bg,
                  child: LoginForm(),
                ),
              ),

              //Sign up
              AnimatedPositioned(
                duration: defaultDuration,
                height: _size.height,
                width: _size.width * 0.88,
                left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                child: Container(
                  color: signup_bg,
                  child: SignUpForm(),
                ),
              ),

              //Logo
              AnimatedPositioned(
                duration: defaultDuration,
                top: _size.height * 0.1,
                left: 0,
                right: _isShowSignUp
                    ? -_size.width * 0.06
                    : _size.width * 0.06, //centering logo
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white60,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: _isShowSignUp
                        ? Image.asset(
                            "assets/notsappicon.png",
                            color: signup_bg,
                          )
                        : Image.asset(
                            "assets/notsappicon.png",
                            color: login_bg,
                          ),
                  ),
                ),
              ),
              // Social buttons
              AnimatedPositioned(
                duration: defaultDuration,
                width: _size.width,
                bottom: _size.height * 0.1, // 10%
                right: _isShowSignUp
                    ? -_size.width * 0.06
                    : _size.width * 0.06, //centering
                child: SocalButtns(),
              ),
              //login text
              //login text animation
              AnimatedPositioned(
                duration: defaultDuration,
                //when sign up shows we want our login text to left center
                bottom: _isShowSignUp ? _size.height / 2 : _size.height * 0.3,
                left: _isShowSignUp
                    ? 0
                    : _size.width * 0.44 - 80, //80 is width of container
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _isShowSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white : Colors.white70,
                  ),
                  child: Transform.rotate(
                    angle: -_animationTextRotate.value * pi / 180,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          updateView();
                        } else {
                          //login
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defpaultPadding * 0.75,
                        ),
                        width: 160,
                        child: Text(
                          "Log In".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //signup text animation
              AnimatedPositioned(
                duration: defaultDuration,
                //when sign up shows we want our login text to left center
                bottom:
                    !_isShowSignUp ? _size.height / 2 - 80 : _size.height * 0.3,
                right: _isShowSignUp
                    ? _size.width * 0.44 - 80
                    : 0, //80 is width of container
                child: AnimatedDefaultTextStyle(
                  duration: defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: !_isShowSignUp ? 20 : 32,
                    fontWeight: FontWeight.bold,
                    color: _isShowSignUp ? Colors.white70 : Colors.white,
                  ),
                  child: Transform.rotate(
                    angle: (90 - _animationTextRotate.value) * pi / 180,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          //sign up
                        } else {
                          updateView();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: defpaultPadding * 0.75,
                        ),
                        width: 160,
                        child: Text(
                          "Sign up".toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
