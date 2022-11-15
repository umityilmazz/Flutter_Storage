import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage/models/my_models.dart';
import 'package:flutter_storage/services/perefer_shared_service.dart';

class SharedReferenceWidget extends StatefulWidget {
  SharedReferenceWidget({super.key});

  @override
  State<SharedReferenceWidget> createState() => _SharedReferenceWidgetState();
}

class _SharedReferenceWidgetState extends State<SharedReferenceWidget> {
  late SharedPreferenceService prf;
  late TextEditingController textControl;
  Cinsiyet _cinsiyet = Cinsiyet.KADIN;
  var secilenRenkler=<String>[];
  @override
  void initState() {
    super.initState();
    prf = SharedPreferenceService();
    textControl = TextEditingController();
    _verileriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: textControl,
            decoration:
                const InputDecoration(labelText: "Lutfen adınızı giriniz."),
          ),
          for (var items in Cinsiyet.values) _buildRadioListTile(items),
          for (var itemRenk in Renk.values) _buildCheckBoxListTile(itemRenk),
          TextButton(
              onPressed: () => prf.verileriKaydet(
                  UserPreference(textControl.text, secilenRenkler, _cinsiyet)),
              child: const Text("Verileri Kaydet"))
        ],
      ),
    );
  }

  Widget _buildCheckBoxListTile(Renk renk) {
    return CheckboxListTile(
        title: Text(describeEnum(renk)),
        value: secilenRenkler.contains(describeEnum(renk)),
        onChanged: (bool? deger) {
          if (deger == false) {
            secilenRenkler.remove(describeEnum(renk));
          } else {
            secilenRenkler.add(describeEnum(renk));
          }
          debugPrint(secilenRenkler.toString());
          setState(() {});
        });
  }

  Widget _buildRadioListTile(Cinsiyet c) {
    return RadioListTile(
        title: Text(describeEnum(c)),
        value: c,
        groupValue:
            _cinsiyet, //groupvalue değeri value ile eşleşen radio elemanı aktif oluyor
        onChanged: (secilenCinsiyet) {
          _cinsiyet = secilenCinsiyet!;
          setState(() {});
        });
  }
  
  void _verileriOku() async{
    UserPreference user=await prf.verileriOku();
    textControl.text=user.isim;
    secilenRenkler=user.renk;
    _cinsiyet=user.cins;
    setState(() {
      
    });
  }

  
}
