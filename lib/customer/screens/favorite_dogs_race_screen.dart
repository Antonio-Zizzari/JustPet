import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/dog_race_card.dart';
import 'package:justpet/customer/screens/search_ideal_dog.dart';
import 'package:justpet/theme/color.dart';
import '../../global/components/SideMenu.dart';
import '../../global/components/appbar.dart';
import '../../global/models/color.dart';
import '../models/dog_race_class.dart';

class FavoriteDogsRace extends StatefulWidget {
  const FavoriteDogsRace({Key? key}) : super(key: key);

  @override
  State<FavoriteDogsRace> createState() => _FavoriteDogsRaceState();
}

class _FavoriteDogsRaceState extends State<FavoriteDogsRace> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green.withOpacity(0.7),
        label: Text("Trova la razza ideale"),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchIdealDog()
              )
          );
        },
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Le mie razze preferite",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          dogRaces.isNotEmpty ? Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 10.0),
                    child: Text(
                      dogRaces.length == 1 ? '${dogRaces.length} razza' : '${dogRaces.length} Razze',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: Column(
                      children: dogRaces.map((race) =>
                        DogRaceCard(
                          dogRace: race,
                          buttonType: MaterialButton(
                            color: kPrimaryColor,
                            minWidth: 50,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                            //DA MODIFICARE
                            onPressed: () {},
                            padding: EdgeInsets.all(5),
                            child: Center(child: Icon(Icons.delete_forever_rounded, color: Colors.white, size: 30,)),
                          ))
                        ).toList(),
                    ),
                  ),
                ],
              )
            ),
          ) : Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                const Icon(Icons.pets_sharp, size: 80),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,40),
                  child: Text("Non è presente alcuna razza nella lista.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
