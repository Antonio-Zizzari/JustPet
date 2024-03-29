import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Categoria.dart';
import 'package:justpet/global/components/SideMenu.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/customer/screens/Corsi.dart';
import 'package:justpet/utils/search_bar_widget.dart';

class VideoCorsi extends StatefulWidget {
  @override
  State<VideoCorsi> createState() => _VideoCorsiState();
}

class _VideoCorsiState extends State<VideoCorsi> {
  final Function(String query) queryFunction = videocorsiSearchBarQuery;

  List<Color?> colors = [Colors.cyan[50], Colors.amber[50], Colors.red[50], Colors.green[50]];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey)/*AppBarVeterinario(
        title: 'Prenotazioni',
        showSearch: false,
      )*/,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Ciao Mario ",
                style: TextStyle(
                fontSize: 28,
                color: Color(0xFF0D1333),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Scopri un nuovo corso da imparare!",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0D1333),
                // fontWeight: FontWeight.bold,
              ),
            ),
            //AAAA
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 20),
            //   height: 50,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: Color(0xFFF5F5F7),
            //     borderRadius: BorderRadius.circular(40),
            //   ),
            //   child: SearchBarWidget(queryFunction: queryFunction, hintText: 'Cerca videocorso per categoria',)
            // ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categorie",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFA0A5BD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*Text(
                  "Vedi tutti",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0D1333),
                    // fontWeight: FontWeight.bold,
                  ).copyWith(color: Color(0xFF6E8AFA)),
                ),*/
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: MasonryGridView.count(
                crossAxisCount: 2,
                itemCount: categorie.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Corsi(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: colors[index],
                        image: DecorationImage(
                          image: AssetImage(categorie[index].immagine),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categorie[index].nome,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF0D1333),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${categorie[index].numeroCorsi} corsi',
                            style: TextStyle(
                              color: Color(0xFF0D1333).withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void videocorsiSearchBarQuery(String query){
  return;
}