import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class MyCustomInputBox extends StatefulWidget {
  String label;
  String inputHint;

  MyCustomInputBox({this.label, this.inputHint});
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50.0,left : 50.0, bottom: 8),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.label,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontSize: 15,
                color: Colors.blue[300],
              ),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextFormField(
            obscuringCharacter: "¤",
            textAlign: TextAlign.end,
            obscureText: widget.label == 'الرمز السري' ? true : false,
            style: TextStyle(
                fontSize: 17,
                decoration: TextDecoration.none,
                color: Colors.blue[300],
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: widget.inputHint,
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
          //
        ),
      ],
    );
  }
}
