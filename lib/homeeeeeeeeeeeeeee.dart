import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

//List of Cards with size
List<StaggeredTile>  _cardTile = <StaggeredTile> [
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2),
];

List<Map<String, dynamic>> newsList2 = [
  {"image": "assets/imgs/Recharge.png", "title": "Recharge",},
  {"image": "assets/imgs/Electricity.png", "title": "Electricity",},
  {"image": "assets/imgs/Water Bill.png", "title": " Water Bill",},
  {"image": "assets/imgs/Gas Bill.png", "title": "Gas Bil",},
  {"image": "assets/imgs/Recharge.png", "title": "Dth",},
  {"image": "assets/imgs/See all.png", "title": "See all",},
  // {"image": "assets/imgs/Awareness inputs.png", "title": "Awareness Inputs",},
];


//List of Cards with color and icon
List<Widget>_listTile = <Widget>[
  BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.blue, icondata: Icons.access_alarms,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.indigo, icondata: Icons.satellite_outlined, text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.cyan, icondata: Icons.search_sharp,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.yellowAccent, icondata: Icons.adjust_rounded,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
  BackGroundTile(backgroundColor: Colors.deepOrange, icondata: Icons.attach_money,text: Text("Ankit"), img: Image.asset("assets/imgs/Recharge.png"),),
];

class  ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GFG App"),
      ),
      body: Container(
        // Staggered Grid View starts here
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _cardTile,
          children: _listTile,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;
  final Text  text;
  final Image img;

  BackGroundTile({required this.backgroundColor,required this.icondata,required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
    ),
      color: Colors.cyan,
      // backgroundColor,
      child: Column(
        children: [
          Image.asset("assets/imgs/Recharge.png"),
          Icon(icondata, color: Colors.white),
        ],
      ),

    );

  }
}