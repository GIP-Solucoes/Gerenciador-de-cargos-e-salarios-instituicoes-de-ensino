import 'package:gip_solucoes/screens/home_screen/components/model/model_suporte.dart';

import 'package:url_launcher/url_launcher.dart';

class SuporteController {
  late SuporteModel suporte;

  SuporteController() {
    suporte = SuporteModel.getSuporte();
  }
  void redireciona_whatsapp() {
    String valor = suporte.numero;
    // ignore: deprecated_member_use
    launch('https://web.whatsapp.com/send?phone=$valor');
  }
}
