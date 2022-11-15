// ignore_for_file: constant_identifier_names

enum Cinsiyet { KADIN, ERKEK, DIGER }

enum Renk { SARI, KIRMIZI, BEYAZ, MAVI, TURUNCU }

class UserPreference {
  final String isim;
  final List<String> renk;
  final Cinsiyet cins;

  UserPreference(this.isim, this.renk, this.cins);
}
