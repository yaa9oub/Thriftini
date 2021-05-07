import 'package:flutter/material.dart';
import 'package:thriftini/helpers/item.dart';

class ItemBuilder extends StatelessWidget {
  Item a;
  int i;

  ItemBuilder({this.a, this.i});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.lightBlue.shade900),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.0, top: 3.0, right: 10.0, bottom: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    a.itemName,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.indigo),
                  ),
                  Text(
                    a.itemDesc,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.indigo[400],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset("images/item.JPG", fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
