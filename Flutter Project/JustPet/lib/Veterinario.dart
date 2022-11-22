class Veterinario {
  String immagine;
  String nome;
  String indirizzo;
  String votazione;
  String descrizione;
  List<String> turni;

  Veterinario ({
    required this.immagine,
    required this.nome,
    required this.indirizzo,
    required this.votazione,
    required this.descrizione,
    required this.turni
  });
}