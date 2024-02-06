import 'package:meu_proj_backend/src/modules/candidato/controller/candidato_controller.dart';
import 'package:shelf_router/shelf_router.dart';

Future<void> initRotas(Router app) async {
  app.get('/candidatos', CandidatoController.listar);
  app.post('/candidatos', CandidatoController.cadastrar);
}
