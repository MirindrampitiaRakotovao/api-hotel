import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moi/widget/Icon_and_text_widget.dart';
import 'package:flutter_moi/widget/small_text.dart';

import '../utils/dimensions.dart';
import '../widget/big_text.dart';

class HotelPageBody extends StatefulWidget {
  const HotelPageBody({super.key});

  @override
  State<HotelPageBody> createState() => _HotelPageBodyState();
}

class _HotelPageBodyState extends State<HotelPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position){
                return _buildPageItem(position);
              }),
        ),

        //newDots
        new DotsIndicator(
            dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
              //activeColor: Colors.indigo,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
          )
        ),

        //Popular text
        SizedBox(height: Dimensions.height30,),

        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Populaires"),
              SizedBox(width: Dimensions.width10,),
              //Point
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color:Colors.grey),
              ),
              SizedBox(width: Dimensions.width10,),
              //SmallText
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Hôtel de luxe",color:Colors.grey),
              )
            ],
          ),
        ),

        //list hotel et images
        Container(
          height: 900,
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: Row(
                    children: [
                      Container(
                        width:120,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white38,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/image/pop01.jpg"
                                )
                            )
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      
    } else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //Assets Container//
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xe26558a5):Color(0xe428294c),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/hotel00.jpg"
                    )
                )
            ),
          ),

          //Box Container//
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  ),
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    BigText(text:"Pietra Hotel"),
                    SizedBox(height: Dimensions.height10,),

                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.green, size: 15)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 10,),
                        SmallText(text: "commentaires"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: Colors.amberAccent),

                        IconAndTextWidget(icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: Colors.indigo),

                        IconAndTextWidget(icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: Colors.redAccent)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
