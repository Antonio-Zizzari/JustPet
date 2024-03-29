import 'package:flutter/material.dart';

class FunzioniMain {
  final String titolo;
  final colore;
  final icona;
  final nextRoute;


  FunzioniMain({
    this.titolo = '',
    this.colore = const Color(0xFFFFCDD2),
    this.icona = Icons.disabled_by_default_outlined,
    this.nextRoute = '',
    });
}

class FunzioniSecondarie {
  final String titolo;
  final String nextRoute;


  FunzioniSecondarie({
    this.titolo = '',
    this.nextRoute = '',
  });
}

List<FunzioniMain> tutteFunzioni = [
  FunzioniMain(titolo: 'Le mie prenotazioni', icona: Icons.calendar_month, nextRoute: '/mie_prenotazioni'),
  FunzioniMain(titolo: 'Scheda animali', icona: Icons.pets, nextRoute: '/scheda_animali'),
  FunzioniMain(titolo: 'Cerca veterinari', icona: Icons.search_sharp, nextRoute: '/lista'),
  FunzioniMain(titolo: 'Video corsi', icona: Icons.video_collection, nextRoute: '/videocorsi'),
  FunzioniMain(titolo: 'Turni Lavoro', icona: Icons.work, nextRoute: '/turni_lavoro'),
  FunzioniMain(titolo: 'Dizionario', icona: Icons.medical_information, nextRoute: '/dizionario'),
  FunzioniMain(titolo: 'Acquista prodotti', icona: Icons.shopping_bag, nextRoute: '/petshop'),
  FunzioniMain(titolo: 'Comunicazioni', icona: Icons.chat, nextRoute: '/chat'),
  FunzioniMain(titolo: 'Trova il tuo cane ideale', icona: Icons.search_outlined, nextRoute: '/trova-animale'),
  FunzioniMain(titolo: 'Trova medicine', icona: Icons.content_paste_search, nextRoute: '/body_medicines')
];



List<FunzioniMain> funzioniCliente = [
  FunzioniMain(titolo: 'Le mie prenotazioni', icona: Icons.calendar_month, nextRoute: '/mie_prenotazioni'),
  FunzioniMain(titolo: 'Scheda animali', icona: Icons.pets, nextRoute: '/scheda_animali'),
  FunzioniMain(titolo: 'Cerca veterinari', icona: Icons.search_sharp, nextRoute: '/lista'),
  FunzioniMain(titolo: 'Video corsi', icona: Icons.video_collection, nextRoute: '/videocorsi'),
  FunzioniMain(titolo: 'Acquista prodotti', icona: Icons.shopping_bag, nextRoute: '/petshop'),
  FunzioniMain(titolo: 'Comunicazioni', icona: Icons.chat, nextRoute: '/chat'),
  FunzioniMain(titolo: 'Trova il tuo cane ideale', icona: Icons.search_outlined, nextRoute: '/trova-animale'),
  FunzioniMain(titolo: 'Trova medicine', icona: Icons.content_paste_search, nextRoute: '/body_medicines')
];

List<FunzioniMain> funzioniVeterinario = [
  FunzioniMain(titolo: 'Comunicazioni', icona: Icons.chat, nextRoute: '/chat'),
  FunzioniMain(titolo: 'Turni Lavoro', icona: Icons.work, nextRoute: '/turni_lavoro'),
  FunzioniMain(titolo: 'Dizionario', icona: Icons.medical_information, nextRoute: '/dizionario'),
];

List<FunzioniMain> funzioniPetShop = [
  FunzioniMain(titolo: 'Acquista prodotti', icona: Icons.shopping_bag, nextRoute: '/petshop'),
  FunzioniMain(titolo: 'Le mie prenotazioni', icona: Icons.work, nextRoute: '/petshop'),
];

/*List<FunzioniSecondarie> funzioniSecondarie = [
  FunzioniSecondarie(titolo: 'Scheda animali', nextRoute: '/lista'),
  FunzioniSecondarie(titolo: 'Cerca veterinari', nextRoute: '/lista'),
  FunzioniSecondarie(titolo: 'Video corsi', nextRoute: '/videocorsi'),
  FunzioniSecondarie(titolo: 'Acquista prodotti', nextRoute: '/lista'),
];
*/

//const Color(0xFF05780C)