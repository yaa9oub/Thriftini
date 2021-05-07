import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thriftini/Layouts/signup.dart';

class IntroScreen extends StatelessWidget {

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset('images/1.png'),
        title: "الفكرة بسيطة أما تنجم تعاون برشا عباد",
        body:
            "  .كان عندك كتب ولا أدوات, لعب ولا دبش ماعاش تسحقهم ما عليك كان تعطيهم تفرح و تفرًح برشا ناس مستحقة",
        footer: Text("كون سبب للتبسيمة"),
      ),
      PageViewModel(
        image: Image.asset('images/2.png'),
        title: "كل شيء بنفس السوم",
        body:
            ".ماكش بش تستعمل فلوس حقيقية أكثر من أنك نوعا ما تعطي بش تاخد, مالا كل ماتعطي حويجة تزيد فرصتك بش تاخد الحاجة الي حاجتك بيها",
        footer: Text("كون سبب للفرحة"),
      ),
      PageViewModel(
        image: Image.asset('images/3.png'),
        title: "الكلنا محميين",
        body:
            ". على خاطر مافما حد يعرف حد بش نكونوا محميين من عدم قبول الإختلاف و من العنصرية و من أي نوع من أنواع اللاإنسانية وهدا إلي يخلينا الناس كل كيف كيف",
        footer: Text("كون سبب للأمل"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: IntroductionScreen(
          done: Text(
            "تعدى",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onDone: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          pages: getPages(),
        ),
      ),
    );
  }
}
