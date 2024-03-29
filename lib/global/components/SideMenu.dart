import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/models/Veterinario.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';
import 'package:justpet/global/models/mainFunction_class.dart';
import 'package:justpet/global/models/utenteClass.dart';
// import 'package:justpet/global/models/utenteClass.dart';
import 'package:justpet/global/screens/login_page.dart';
import 'dart:convert';

import '../../customer/models/cliente.dart';


class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final user = FirebaseAuth.instance.currentUser!;

  /*dynamic readUsers() => FirebaseFirestore.instance
      .collection('Cliente')
      .snapshots()
      .map((snapshot) =>
        snapshot.docs.map((doc) => Cliente.fromJson(doc.data())).toList());

  Future<String> utente() async{
    final user = FirebaseFirestore.instance.collection("Cliente").doc("giovanniverdi@gmail.com");
    final result = await user.get();
    print(result.data()?['nome']);
    return result.data()!['nome'];
  }*/
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getClienteOrVeterinarioFromFirestore(user.email!),
      initialData: Utente(email:"Caricamento...",),
      builder: (BuildContext context, AsyncSnapshot<dynamic> utente){
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(foregroundImage: AssetImage('assets/images/user.png',), radius: 50,),
                    Text(
                      utente.data.runtimeType==Utente ? "Caricamento..." : utente.data!.nome,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Funzioni', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Column(
                children: utente.data.runtimeType.toString().contains('Cliente') ? funzioniCliente.map((funzioni) =>
                  menuItem(context, funzioni.colore, funzioni.titolo, funzioni.nextRoute, funzioni.icona)
                ).toList()
                    :
                    utente.data.runtimeType.toString().contains('Veterinario') ? funzioniVeterinario.map((funzioni) =>
                    menuItem(context, funzioni.colore, funzioni.titolo, funzioni.nextRoute, funzioni.icona)
                ).toList()
                        :
                    utente.data.runtimeType.toString().contains('PetShop') ? funzioniPetShop.map((funzioni) =>
                        menuItem(context, funzioni.colore, funzioni.titolo, funzioni.nextRoute, funzioni.icona)
                    ).toList()
                        :
                    []
              ),
              /*Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
              child: Material(
                elevation: 5,
                color: Colors.red[100],
                child: MaterialButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.pets),
                      Text('Scheda animali'),
                      Spacer(),
                      Icon(Icons.navigate_next, size: 30,),
                    ],
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
              child: Material(
                elevation: 5,
                color: Colors.red[100],
                child: MaterialButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.search_sharp),
                      Text('Cerca veterinari'),
                      Spacer(),
                      Icon(Icons.navigate_next, size: 30,),
                    ],
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
              child: Material(
                elevation: 5,
                color: Colors.red[100],
                child: MaterialButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.video_collection),
                      Text('Video corsi'),
                      Spacer(),
                      Icon(Icons.navigate_next, size: 30,),
                    ],
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
              child: Material(
                elevation: 5,
                color: Colors.red[100],
                child: MaterialButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag),
                      Text('Acquista Prodotti'),
                      Spacer(),
                      Icon(Icons.navigate_next, size: 30,),
                    ],
                  ),),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),

             */
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Altro', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 20.0, 4.0),
                child: Material(
                  elevation: 5,
                  color: Colors.red[100],
                  child: MaterialButton(
                    onPressed: (){
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Login()
                      ));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        Text('Logout'),
                        Spacer(),
                        Icon(Icons.navigate_next, size: 30,),
                      ],
                    ),),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 20.0, 4.0),
                child: Material(
                  elevation: 5,
                  color: Colors.red[100],
                  child: MaterialButton(
                    onPressed: () async {
                      final user = FirebaseFirestore.instance.collection("Cliente").doc("scarano@gmail.com");
                      final result = await user.get();
                      print(result.data()?["nome"]);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        Text('bottone a caso'),
                        Spacer(),
                        Icon(Icons.navigate_next, size: 30,),
                      ],
                    ),),
                ),
              ),*/
            ],
          ),
        );
      }

    );
  }
}

Widget menuItem(BuildContext context, Color colore, String titolo, String nextRoute, IconData icona){
  return Padding(
    padding: const EdgeInsets.fromLTRB(4.0, 8.0, 20.0, 4.0),
    child: Material(
      elevation: 5,
      color: colore,
      child: MaterialButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, nextRoute);
        },
        child: Row(
          children: [
            Icon(icona),
            SizedBox(width: 5,),
            Text(titolo),
            Spacer(),
            Icon(Icons.navigate_next, size: 30,),
          ],
        ),),
    ),
  );
}