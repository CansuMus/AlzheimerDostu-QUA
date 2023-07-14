import 'package:circular_countdown/circular_countdown.dart';
import 'package:ff_55/model/Tile_Model.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:ff_55/widgets/celebration.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../../../../data/data2.dart';



class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<TileModel> gridViewTiles = <TileModel>[];
  List<TileModel> questionPairs = <TileModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart();
  }
  void reStart() {

    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 10), () {
// Here you can write your code
      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }



  String description = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor:Utils.mainThemeColor,
        appBar: AppBar(
          title: Text("Hafıza Oyunu",style: TextStyle(
              fontFamily: "Roboto",fontSize: 20
          ),
          ),
          backgroundColor: Utils.mainThemeColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                  children: <Widget>[
        
                    SizedBox(
                      height: 1
                      ,
                    ),
                    points != 800 ? Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$points/800",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500,color: Colors.white,fontFamily: "Roboto"),
                        ),
                        Text(
                          "Puan",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 24, fontWeight: FontWeight.w300,color: Colors.white),
                        ),
                        GridView(
                          shrinkWrap: true,
                          //physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 0.0, maxCrossAxisExtent: 90.0),
                          children: List.generate(gridViewTiles.length, (index) {
                            return Tile(
                              imagePathUrl: gridViewTiles[index].getImageAssetPath(),
                              tileIndex: index,
                              parent: this,
                            );
                          }),
                        ),TimeCircularCountdown(
                          unit: CountdownUnit.second,
        
                          countdownTotal: 120,
                          diameter: 160,
                          countdownCurrentColor: Colors.amber,
        
        
        
                          onFinished: () {
                            description = ' Süreniz Bitmiştir ve Puanınız:${points}';
                            setState(() {});
                          },
        
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontFamily: "Roboto"
        
                          ),
                        ),
        
        
        
        
        
                      ],
                    ) : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 300,),
                          Celebration(),
                          SizedBox(height: 50,),
        
        
                          NiceButtons(
                            height: 80,
                            width: 300,
                            borderColor: Utils.mainThemeColor,
                            startColor: Utils.mainThemeColor,
                            endColor: Utils.secondaryColor,
                            stretch: false,
                            gradientOrientation: GradientOrientation.Horizontal,
                            onTap: (finish) {
                              setState(() {
                                points=0;
                                reStart();
                              });
                            },
                            child: Text(
                              'Tekrar Oynamak İçin Bana Tıkla',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
        
                        ],
                      ),
        
                    ),
                    SizedBox(
                      height: 4,
                    ),
        
        
        
        
        
        
        
        
        
        
        
                  ]
              )
        
          ),
        )
    );

  }
}

class Tile extends StatefulWidget {
  String imagePathUrl;
  int tileIndex;
  _Home2State parent;

  Tile({required this.imagePathUrl, required this.tileIndex, required this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex].setIsSelected(true);
          });
          if (selectedTile != "") {
            /// testing if the selected tiles are same
            if (selectedTile == myPairs[widget.tileIndex].getImageAssetPath()) {
              print("add point");
              points = points + 100;
              print(selectedTile + " thishis" + widget.imagePathUrl);

              TileModel tileModel = new TileModel(imageAssetPath: '', isSelected:false,);
              print(widget.tileIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex] = tileModel;
                print(selectedIndex);
                myPairs[selectedIndex] = tileModel;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              print(selectedTile +
                  " thishis " +
                  myPairs[widget.tileIndex].getImageAssetPath());
              print("wrong choice");
              print(widget.tileIndex);
              print(selectedIndex);
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                this.widget.parent.setState(() {
                  myPairs[widget.tileIndex].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex].getImageAssetPath();
              selectedIndex = widget.tileIndex;
            });

            print(selectedTile);
            print(selectedIndex);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex].getIsSelected()
            ? myPairs[widget.tileIndex].getImageAssetPath()
            : widget.imagePathUrl)
            : Container(
          color: Colors.white,
          child: Image.asset("assets/correct.png"),
        ),
      ),
    );
  }
}