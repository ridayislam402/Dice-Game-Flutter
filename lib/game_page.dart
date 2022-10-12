import 'dart:math';

import 'package:flutter/material.dart';

class Game_Page extends StatefulWidget {
  @override
  State<Game_Page> createState() => _Game_PageState();
}

class _Game_PageState extends State<Game_Page> {
  //const Game_Page({Key? key}) : super(key: key);
  var total=0, hight=0, dicesum=0, index1=0,index2=0;

  bool isstart=true, isgameover=false, istryagain=false, isroll=false, iswin=false;
  final random= Random.secure();
  var imageList=['images/s1.png',
    'images/s2.png',
    'images/s3.png',
    'images/s4.png',
    'images/s5.png',
    'images/s6.png',];
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(child: Text('Simple Dice Game',style: TextStyle(
            fontSize: 40,
          ),)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Score : $total",style: TextStyle(fontSize: 20)),
                Text("Hight : $hight",style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageList[index1], height: 80,width: 80,),
              SizedBox(width: 35,),
              Image.asset(imageList[index2], height: 80,width: 80,)
            ],
          ),

          Center(child: Text('Dice Sum : $dicesum')),
          if(isgameover)Center(child: Text('Game Over',style: TextStyle(fontSize: 30),)),
          if(iswin)Center(child: Text('Congratulations You Won !!!',style: TextStyle(fontSize: 30))),

          if(isstart)ElevatedButton(
              onPressed: () {
                setState(() {
                  isstart=false;
                  isroll=true;

                },);

              },
              child: Text("Start",style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(100, 50))
              )
          ),
          if(isroll)ElevatedButton(
              onPressed: () {

                  rollTheDice();

              },
              child: Text("Roll",style: TextStyle(color: Colors.black)),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(10.0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              minimumSize: MaterialStateProperty.all(Size(100, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    )
                )
               )

            ),


          if(istryagain)ElevatedButton(
              onPressed: () {
                setState(() {
                  istryagain=false;
                  isstart=true;
                  total=0;
                  dicesum=0;
                  isgameover=false;
                  iswin=false;
                },);

              },
              child: Text("Try Again",style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(100, 50))
              )
          ),
        ],
      );

  }

  void rollTheDice() {
    setState(() {
    index1=random.nextInt(6);
    index2=random.nextInt(6);
    dicesum=index1+index2+2;

    if(dicesum==2||dicesum==3||dicesum==12){
      istryagain=true;
      isgameover=true;
      isroll=false;

    } else if(dicesum==7||dicesum==11){
      istryagain=true;
      isroll=false;
      iswin=true;
    }
    else{
      total += dicesum;
    }

    if(hight<=total){
      hight=total;
    }
    },);
  }

}
