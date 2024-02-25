import 'package:meu_proj_backend/src/modules/candidato/controller/candidato_controller.dart';
import 'package:shelf_router/shelf_router.dart';

Future<void> initRotas(Router app) async {
  app.get('/candidatos', CandidatoController.listar);
  app.get('/candidatos/<id>', CandidatoController.getById);
  app.post('/candidatos', CandidatoController.cadastrar);
  app.put('/candidatos', CandidatoController.atualizar);
  app.delete('/candidatos', CandidatoController.remover);
}
