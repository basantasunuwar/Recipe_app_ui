import 'dart:ui';

import 'package:flutter/material.dart';

class RecipeHome extends StatefulWidget {
  @override
  _RecipeHomeState createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 250.0,
              color: Color(
                getColorHexFromStr('#fff5ea'),
              ),
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(15.0, 65.0, 15.0, 10.0),
                    child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(25.0),
                        child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 40.0, top: 15.0, bottom: 15.0),
                                hintText: "Search for Recipes and Channels",
                                hintStyle: TextStyle(color: Colors.grey))))),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                        color: Colors.orange,
                        style: BorderStyle.solid,
                        width: 3.0,
                      ))),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'POPULAR RECIPES',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Timesroman',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'THIS WEEK',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Timesroman',
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Container(
                        padding: EdgeInsets.only(top: 15.0, left: 15.0),
                        height: 125.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _foodCard(
                                'assets/images/balanced.jpeg',
                                'Grilled Chiken',
                                'with Fruit Salad',
                                'assets/images/chris.jpeg',
                                'Jamie Oliver'),
                            SizedBox(width: 20),
                            _foodCard(
                                'assets/images/balanced.jpeg',
                                'Grilled Chiken',
                                'with Fruit Salad',
                                'assets/images/chris.jpeg',
                                'Hari Bahadur'),
                            SizedBox(width: 20),
                            _foodCard(
                                'assets/images/balanced.jpeg',
                                'Grilled Chiken',
                                'with Fruit Salad',
                                'assets/images/chris.jpeg',
                                'Hari Bahadur'),
                            SizedBox(width: 20),
                            _foodCard(
                                'assets/images/balanced.jpeg',
                                'Grilled Chiken',
                                'with Fruit Salad',
                                'assets/images/chris.jpeg',
                                'Hari Bahadur'),
                          ],
                        ))),
                SizedBox(height: 15.0),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text('July 21',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 14.0,
                          color: Colors.grey)),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text('TODAY',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      // child: BackdropFilter(
                      //     filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/breakfast.jpeg'),
                                fit: BoxFit.cover)),

                        // child: Container(
                        //   color: Colors.white.withOpacity(0.0),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 230.0, left: 60.0),
                        child: Column(
                          children: [
                            Text('BEST OF',
                                style: TextStyle(
                                    fontFamily: 'Timesroman',
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('THE DAY',
                                style: TextStyle(
                                    fontFamily: 'Timesroman',
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10.0),
                            Container(
                                height: 3.0, width: 50.0, color: Colors.orange)
                          ],
                        ))
                  ],
                )
              ],
            ),
          ],
        )
      ],
    ));
  }

  Widget _foodCard(String foodImgPath, String foodName, String foodType,
      String userImgPath, String userName) {
    return Container(
        height: 125.0,
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(image: AssetImage(foodImgPath)),
              ),
              height: 125.0,
              width: 100.0,
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(foodName, style: TextStyle(fontFamily: 'Quicksand')),
                Text(foodType, style: TextStyle(fontFamily: 'Quicksand')),
                SizedBox(height: 10),
                Container(height: 2.0, width: 75.0, color: Colors.orange),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            image: DecorationImage(
                              image: AssetImage(userImgPath),
                            ))),
                    SizedBox(width: 10.0),
                    Text(userName, style: TextStyle(fontFamily: 'Quicksand'))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
