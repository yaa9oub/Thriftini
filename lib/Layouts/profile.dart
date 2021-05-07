import 'package:flutter/material.dart';
import 'package:thriftini/widgets/CustomButton.dart';
import 'package:thriftini/widgets/CustomInputBox.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Line> _profileData, _dourrosData, _biddersData, _bidsData;

  @override
  void initState() {
    _profileData = generateLines(_ProfileSettingsBuilder(), "إعدادات البروفيل");
    _dourrosData = generateLines(_DurroSettingsBuilder(), "إشري دورو");
    _biddersData = generateLines(_BiddersBuilder(), "قائمة المزايدين");
    _bidsData = generateLines(_BidsBuilder(), "قائمة الطلبات");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("جوك و بروفيلك"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _profileData[index].isExpanded = !isExpanded;
                });
              },
              children: _profileData.map<ExpansionPanel>((Line line) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(line.headerValue),
                    );
                  },
                  body: line.expandedValue,
                  isExpanded: line.isExpanded,
                );
              }).toList(),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _dourrosData[index].isExpanded = !isExpanded;
                });
              },
              children: _dourrosData.map<ExpansionPanel>((Line line) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(line.headerValue),
                    );
                  },
                  body: line.expandedValue,
                  isExpanded: line.isExpanded,
                );
              }).toList(),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _biddersData[index].isExpanded = !isExpanded;
                });
              },
              children: _biddersData.map<ExpansionPanel>((Line line) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(line.headerValue),
                    );
                  },
                  body: line.expandedValue,
                  isExpanded: line.isExpanded,
                );
              }).toList(),
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _bidsData[index].isExpanded = !isExpanded;
                });
              },
              children: _bidsData.map<ExpansionPanel>((Line line) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(line.headerValue),
                    );
                  },
                  body: line.expandedValue,
                  isExpanded: line.isExpanded,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _ProfileSettingsBuilder() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          MyCustomInputBox(
            label: "الرمز السري",
            inputHint: "تحب تبدل المودباس ؟",
          ),
          MyCustomInputBox(
            label: "الترقيم البريدي",
            inputHint: "تنجم تبدل زادة الترقيم البريدي",
          ),
          CustomButton(txt: "تسجيل"),
        ],
      ),
    );
  }

  Widget _DurroSettingsBuilder() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          MyCustomInputBox(
            label: "تبعث دورو على 85696 و تكتب لهنا الكود الي يوصلك",
            inputHint: "تكتب الكود باش تاخد 5 دورو",
          ),
          CustomButton(txt: "مريقل"),
        ],
      ),
    );
  }

  Widget _BiddersBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: Text("لهنا تلقى قائمة الناس الي تحب تاخو الحاجة الي انت بش تتبرع بيها و انت عليك أنك تختار لشكون بش تعطي",textAlign: TextAlign.right,)
      ),
    );
  }

  Widget _BidsBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: Text("لهنا قائمة الحاجات الي انت تقدمت بش تاخدهم",textAlign: TextAlign.right,)
      ),
    );
  }

  List<Line> generateLines(Widget expandedValue, String headerValue) {
    return List.generate(1, (int index) {
      return Line(
        headerValue: headerValue,
        expandedValue: expandedValue,
      );
    });
  }
}

class Line {
  Line({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}
