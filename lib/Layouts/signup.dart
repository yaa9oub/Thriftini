import 'package:flutter/material.dart';
import 'package:thriftini/Layouts/signin.dart';
import 'package:thriftini/widgets/CustomButton.dart';
import 'package:thriftini/widgets/CustomInputBox.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {},
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 40),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Cardo',
                            fontSize: 35,
                            color: Color(0xff0C2551),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        //
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, top: 5),
                        child: Text(
                          'أعمل كونت',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    //
                    SizedBox(
                      height: 60,
                    ),
                    //
                    MyCustomInputBox(
                      label: 'الإسم',
                      inputHint: 'فولان بن فولان',
                    ),
                    //
                    SizedBox(
                      height: 8,
                    ),
                    //
                    MyCustomInputBox(
                      label: 'التاليفون',
                      inputHint: '99 101 001',
                    ),
                    //
                    SizedBox(
                      height: 8,
                    ),
                    //
                    MyCustomInputBox(
                      label: 'الرمز السري',
                      inputHint: 'استعمل متع الفايسبوك',
                    ),
                    //
                    SizedBox(
                      height: 8,
                    ),
                    //
                    MyCustomInputBox(
                      label: 'الترقيم البريدي',
                      inputHint: '4011',
                    ),
                    //
                    SizedBox(
                      height: 8,
                    ),
                    //
                    Container(
                      width: scrWidth * 0.7,
                      child: Text(
                        "بعد ما تصنع الحساب متعك لازمك تشري دورو بش تاخد الحاجات الي مستحقها",
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8f9db5).withOpacity(0.45),
                        ),
                        textAlign: TextAlign.end,
                        //
                      ),
                    ),
                    //
                    InkWell(
                      onTap : ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: CustomButton(txt: "أصنع كونت ")),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            'تسجيل دخول',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff90b7ff),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'صار عندك كونت من قبل؟',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8f9db5).withOpacity(0.45),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ClipPath(
                  clipper: OuterClippedPart(),
                  child: Container(
                    color: Color(0xff0962ff),
                    width: scrWidth,
                    height: scrHeight,
                  ),
                ),
                //
                ClipPath(
                  clipper: InnerClippedPart(),
                  child: Container(
                    color: Color(0xff0c2551),
                    width: scrWidth,
                    height: scrHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
