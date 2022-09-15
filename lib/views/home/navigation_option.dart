

import 'package:flutter/material.dart';
class  NavigationOption extends StatelessWidget{

  String title;
  bool isSelected;
  Function onSelected;

  NavigationOption({
    required this.title,
    required this.isSelected,
    required this.onSelected
});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:(){
        onSelected();
      },
      child: Column(
        children: [
           Text(title,style: TextStyle(color: isSelected?Colors.blue:Colors.black.withOpacity(0.65)),),
          SizedBox(height: 5,),
          isSelected?
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
            ),
          )

              :Container()


        ],
      ),
    );
  }

}