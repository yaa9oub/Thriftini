import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thriftini/helpers/item.dart';
import 'package:thriftini/widgets/gridItemBuilder.dart';
import 'package:thriftini/widgets/itemBuilder.dart';

class GiveScreen extends StatefulWidget {
  @override
  _GiveScreenState createState() => _GiveScreenState();
}

class _GiveScreenState extends State<GiveScreen> {
  List<Item> _litems;
  File _image;
  final TextEditingController ctrl1 = new TextEditingController();
  final TextEditingController ctrl2 = new TextEditingController();

  Item a = new Item(null, "صبات جديد",
      "صبات فانس مازال جديد أما صغير عليا شوي أنا نلبس 48 و هو يرفع 39 برك");

  @override
  void initState() {
    super.initState();
    _litems = [
      a,
      a,
      a,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            addItem(context);
          },
          backgroundColor: Colors.blue[800],
          child: Icon(Icons.add, color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3))),
        ),
      ),
      body: Container(
        child: Padding(
          padding:
              EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 0.0),
          child: GridView.builder(
              itemCount: _litems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext ctxt, int index) {
                return GridItemBuilder(a: _litems[index], index: index);
              }),
        ),
      ),
    );
  }

  addItem(BuildContext context) {
    Widget cancelButton = FlatButton(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "نزيد نخمم",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget okButton = FlatButton(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          "مريقل",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        if (ctrl1.text.isNotEmpty && ctrl2.text.isNotEmpty) {
          Item item =
              new Item(_image == null ? null : _image, ctrl1.text, ctrl2.text);
          setState(() {
            _litems.add(item);
          });
        }

        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3),
      ),
      title: Text(
        "بشنية تحب تتبرع ليوم ؟",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.end,
      ),
      backgroundColor: Colors.blue[200],
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
        height: MediaQuery.of(context).size.height / 3,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: ctrl1,
                textAlign: TextAlign.end,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: false,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    hintText: "إسم الحاجة",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl2,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: false,
                autofocus: false,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    hintText: " أكثر معلومات عالحاجة الي بش تعطيها",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Icon(Icons.add_a_photo, color: Colors.black87)),
                  Text("أختار تصويرة للحويجة ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text(
                        'تصويرة من تليفونك',
                        textAlign: TextAlign.end,
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text(
                      'صورها توا',
                      textAlign: TextAlign.end,
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
