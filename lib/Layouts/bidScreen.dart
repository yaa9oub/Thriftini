import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thriftini/Layouts/takeScreen.dart';
import 'package:thriftini/widgets/CustomButton.dart';

import 'menu.dart';

class BidScreen extends StatefulWidget {
  File img;
  String itemName, itemDesc;
  BidScreen({this.img, this.itemName, this.itemDesc});

  @override
  _BidScreenState createState() => _BidScreenState();
}

class _BidScreenState extends State<BidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("مطلب أخد"),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: Colors.black87,
                    )),
                child: widget.img == null
                    ? Image.asset(
                        "images/item.JPG",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        widget.img,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  widget.itemName,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.indigo),
                ),
              ),
              Text(
                widget.itemDesc,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.indigo[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              TextFormField(
                autofocus: false,
                minLines: 5,
                maxLines: 8,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText:
                      "إكتب لهنا علاه تحب عالحاجة إلي أخترتها من غير ما تدكر حتى معلومة شخصية",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w200),
                  focusColor: Colors.blue[300],
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(color: Colors.blue[300]),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Menu()));
                  },
                  child: CustomButton(txt: "توكل")),
            ],
          ),
        ),
      ),
    );
  }
}
