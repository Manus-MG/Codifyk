import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:rive/rive.dart';
import 'package:endproject1/screens/OnBoarding/SignUp.dart';
import 'package:endproject1/utilities/themes.dart';
import 'package:endproject1/utilities/assets.dart' as app_assets;

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key, this.closeModal}) : super(key: key);

  final Function? closeModal;

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  // Animation controller that shows the sign up modal as well as translateY boarding content together
  AnimationController? _signUpAnimController;

  // Control touch effect animation for the "Start the Course" button
  late RiveAnimationController _btnController;

  @override
  void initState() {
    super.initState();
    _signUpAnimController = AnimationController(
        duration: const Duration(milliseconds: 300),
        upperBound: 1,
        vsync: this);

    _btnController = OneShotAnimation("active", autoplay: false);

    const springDesc = SpringDescription(
      mass: 0.1,
      stiffness: 40,
      damping: 5,
    );

    _btnController.isActiveChanged.addListener(() {
      if (!_btnController.isActive) {
        final springAnim = SpringSimulation(springDesc, 0, 1, 0);
        _signUpAnimController?.animateWith(springAnim);
      }
    });
  }

  @override
  void dispose() {
    _signUpAnimController?.dispose();
    _btnController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Stack(children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Center(
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Transform.translate(
                offset: const Offset(200, 60),
                child: Image.asset(app_assets.spline, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const RiveAnimation.asset(app_assets.shapesRiv),
        ),
        AnimatedBuilder(
          animation: _signUpAnimController!,
          builder: (context, child) {
            return Transform(
                transform: Matrix4.translationValues(
                    0, -50 * _signUpAnimController!.value, 0),
                child: child);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:

                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 260,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: const Text(
                              "Learn Collab & Code",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 60),
                            ),
                          ),
                          Text(
                            "Learning code is now more easy. Are you ready to code in a new fun way ?",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontFamily: "Inter",
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // const Spacer(),
                  GestureDetector(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 236,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            RiveAnimation.asset(
                              app_assets.buttonRiv,
                              fit: BoxFit.cover,
                              controllers: [_btnController],
                            ),
                            Center(
                              child: Transform.translate(
                                offset: const Offset(4, 4),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.arrow_forward_rounded),
                                    SizedBox(width: 4),
                                    Text(
                                      "Get Started"
                                      "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      _btnController.isActive = true;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontFamily: "Inter",
                        fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
        RepaintBoundary(
          child: AnimatedBuilder(
            animation: _signUpAnimController!,
            builder: (context, child) {
              return Stack(
                children: [
                  // Positioned(
                  //     top: 100 - (_signInAnimController!.value * 200),
                  //     right: 20,
                  //     child: SafeArea(
                  //       child: CupertinoButton(
                  //         padding: EdgeInsets.zero,
                  //         borderRadius: BorderRadius.circular(36 / 2),
                  //         minSize: 36,
                  //         child: Container(
                  //           width: 36,
                  //           height: 36,
                  //           decoration: BoxDecoration(
                  //             color: Colors.black,
                  //             borderRadius: BorderRadius.circular(36 / 2),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                   color: Colors.black.withOpacity(0.3),
                  //                   blurRadius: 10,
                  //                   offset: const Offset(0, 10))
                  //             ],
                  //           ),
                  //           child: Container(
                  //             color: Colors.transparent,
                  //           ),
                  //         ),
                  //         onPressed: () {
                  //           widget.closeModal!();
                  //         },
                  //       ),
                  //     )
                  // ),
                  Positioned.fill(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Opacity(
                        opacity: 0.4 * _signUpAnimController!.value,
                        child: Container(color: RiveAppTheme.shadow),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      0,
                      -MediaQuery.of(context).size.height *
                          (1 - _signUpAnimController!.value),
                    ),
                    child: child,
                  ),
                ],
              );
            },
            child: SignUpView(
              closeModal: () {
                _signUpAnimController?.reverse();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
