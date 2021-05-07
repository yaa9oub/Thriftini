import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thriftini/Layouts/bidScreen.dart';
import 'package:thriftini/helpers/item.dart';
import 'package:thriftini/widgets/itemBuilder.dart';

class TakeScreen extends StatefulWidget {
  @override
  _TakeScreenState createState() => _TakeScreenState();
}

class _TakeScreenState extends State<TakeScreen> {
  List<Item> litems;

  Item a = new Item(null, "صبات جديد",
      "صبات فانس مازال جديد أما صغير عليا شوي أنا نلبس 48 و هو يرفع 39 برك");

  @override
  void initState() {
    super.initState();
    litems = [a, a, a, a, a, a, a, a, a];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Color(0xff0962ff),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: Text(
                          "لوج",
                          style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * 0.63,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: TextFormField(
                          textAlign: TextAlign.end,
                          decoration: InputDecoration(
                            hintText: "لوج بإسم الحاجة الي تحب عليها",
                            hintStyle: TextStyle(
                                fontSize: 14,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height-240,
              child: ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BidScreen(img : litems[index].imgSrc,itemName : litems[index].itemName,itemDesc : litems[index].itemDesc)));
                      },
                      child: ItemBuilder(a: litems[index], i: index));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
