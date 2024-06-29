import 'package:flutter/material.dart';
import 'package:flutter_moi/widget/small_text.dart';

import '../../widget/big_text.dart';
import '/pages/home/hotel_page_body.dart';

class MainHotelPage extends StatefulWidget {
  const MainHotelPage({super.key});

  @override
  State<MainHotelPage> createState() => _MainHotelPageState();
}

class _MainHotelPageState extends State<MainHotelPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is"+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top:45, bottom:15),
              padding: EdgeInsets.only(left: 20, right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Madagascar", color: const Color(0xb0281961)),
                      Row(
                        children: [
                          SmallText(text: "Fianarantsoa"),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                      child:Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.search, color:Colors.white),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xb0281961),
                        ),
                      ),
                  )
                ],
              ),
            ),
          ),
          //show the body
          Expanded(child: SingleChildScrollView(
            child: HotelPageBody(),
            )),
        ],
      ),
    );
  }
}