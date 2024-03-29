import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/ecommerce/petshop_card.dart';

import '../../global/components/SideMenu.dart';
import '../../global/components/appbar.dart';
import '../../utils/search_bar_widget.dart';
import '../models/petshop_class.dart';

class PetShop extends StatefulWidget {
  const PetShop({Key? key}) : super(key: key);

  @override
  State<PetShop> createState() => _PetShopState();
}

class _PetShopState extends State<PetShop> {
  final Function(String query) queryFunction = petshopSearchBarQuery;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //AAAA
          // Container(
          //   margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          //   //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          //   height: 50,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Color(0xFFF5F5F7),
          //     borderRadius: BorderRadius.circular(40),
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 10.0),
          //     child: SearchBarWidget(queryFunction: queryFunction, hintText: 'Cerca un petshop')
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 0.0, 10.0),
            child: Text(
              petshops.length == 1 ? '${petshops.length} petshop trovato' : '${petshops.length} petshops trovati',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children:
                petshops.map((petshop) => PetShopCard(data: petshop)).toList()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void petshopSearchBarQuery(String query){
  return;
}
