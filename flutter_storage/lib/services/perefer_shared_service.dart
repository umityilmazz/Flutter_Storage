import 'package:flutter_storage/models/my_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  void verileriKaydet(UserPreference user) async {
    final prf = await SharedPreferences.getInstance();
    prf.setString("İsim :", user.isim);
    prf.setStringList("Renkler : ", user.renk);
    prf.setInt("Cinsiyet", user.cins.index);
  }

  Future<UserPreference> verileriOku() async {
    final prf = await SharedPreferences.getInstance();
   var isim = prf.getString("İsim :")!;
   var renkler = prf.getStringList("Renkler : ")!;
   var cins = Cinsiyet.values[prf.getInt("Cinsiyet")!];
    return UserPreference(isim,renkler, cins);
  }
}

