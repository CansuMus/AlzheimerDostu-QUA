import '../model/Tile_Model.dart';



String selectedTile = "";
late int selectedIndex ;
bool selected = true;
int points = 0;

List<TileModel> myPairs = <TileModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked(){

  List<bool> yoClicked = <bool>[];
  List<TileModel> myairs = <TileModel>[];
  myairs = getPairs();
  for(int i=0;i<myairs.length;i++){
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel>  getPairs(){

  List<TileModel> pairs = <TileModel>[];

  TileModel tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //1
  tileModel.setImageAssetPath("assets/hayvan1.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //2
  tileModel.setImageAssetPath("assets/hayvan2.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //3
  tileModel.setImageAssetPath("assets/hayvan3.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //4
  tileModel.setImageAssetPath("assets/hayvan4.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);
  //5
  tileModel.setImageAssetPath("assets/hayvan5.jpg");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);





  return pairs;
}

List<TileModel>  getQuestionPairs(){

  List<TileModel> pairs = <TileModel>[];

  TileModel tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //1
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //2
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //3
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);

  //4
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);
  //5
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = new TileModel(imageAssetPath: '', isSelected: false);





  return pairs;
}