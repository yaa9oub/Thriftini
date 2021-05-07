import 'dart:io';

class Item{
  String  itemName , itemDesc ;
  File imgSrc ;
  
  Item(imgSrc,itemName,itemDesc){
    this.imgSrc = imgSrc;
    this.itemName = itemName;
    this.itemDesc = itemDesc;
  }

}