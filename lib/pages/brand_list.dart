import 'constants.dart';
import 'package:flutter/material.dart';


class BrandList extends StatefulWidget {
  const BrandList({super.key});

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {

  int _brandCategoryindex=0;

  var brandList=[
    {
      "name" : "all",
      "icon" : "",
    },
    {
      "name" : "opel",
      "icon" : "assets/logos/opel logo.png",
    },
    {
      "name" : "toyota",
      "icon" : "assets/logos/toyota logo.png",
    },
    {
      "name" : "mercedes",
      "icon" : "assets/logos/Mercedes logo.png",
    },
    {
      "name" : "bmw",
      "icon" : "assets/logos/bmw logo.png",
    },

  ] ;

  void setBrandIndex(int currentIndex){
    setState(() {
      _brandCategoryindex=currentIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Brands',
              style: TextConstants.titleSection,

            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
                itemCount: brandList.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index){
                  if(index == 0){
                    return GestureDetector(
                      onTap: (){
                        setBrandIndex(index);
                        print(brandList[index]["name"]);
                      },
                      child: BrandItem(
                        imgAsset: brandList[index]["icon"]!,
                        index: 0,
                        isSelected: (_brandCategoryindex == index)? true : false,
                      ),
                    );

                  }
                  else{
                    return GestureDetector(
                      onTap: (){
                        setBrandIndex(index);
                        print(brandList[index]["name"]);
                      },
                      child: BrandItem(
                        imgAsset: brandList[index]["icon"]!,
                        index: index,
                        isSelected: (_brandCategoryindex == index)? true : false,
                      ),
                    );
                  }

                }),
          ),
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final String imgAsset;
  final int index;
  final bool isSelected;

  const BrandItem({
    super.key, required this.imgAsset, required this.index, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (index == 0)
          ? EdgeInsets.fromLTRB(20, 12, 10, 12)
          : EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      padding: (index == 0)
          ? EdgeInsets.symmetric(horizontal: 25, vertical: 20)
          : EdgeInsets.symmetric(horizontal: 20, vertical: 20) ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (isSelected) ? Color.fromARGB(255, 0, 99, 124): (index==0) ? Colors.white : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 0.5,
            )
          ]
      ),
      child: (index == 0)? Center(
        child: Text(
            "All",
            style: TextConstants.titleSection

        ),
      ) : Image.asset(
        imgAsset,
        width: 70,
        height: 70,
      ),
    );
  }
}