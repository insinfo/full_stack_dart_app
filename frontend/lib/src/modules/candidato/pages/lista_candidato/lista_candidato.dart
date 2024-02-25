import 'dart:html';

import 'package:meu_proj_frontend/frontend.dart';
import 'package:meu_proj_frontend/src/modules/candidato/services/canditado_service.dart';
import 'package:meu_proj_frontend/src/shared/models/candidato.dart';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/angular_router.dart';

@Component(
  selector: 'lista-candidato-page',
  templateUrl: 'lista_candidato.html',
  directives: [
    coreDirectives,
  ],
)
class ListaCandidatoPage implements OnActivate {
  final CandidatoService _candidatoService = CandidatoService();
  final Router _router;

  List<Candidato> candidatos = [];

  ListaCandidatoPage(this._router);

  @override
  void onActivate(RouterState? previous, RouterState current) async {
    listar();
  }

  void listar() async {
    candidatos = await _candidatoService.listar();
  }

  void atualizar(Candidato item) {
    _router.navigateByUrl(RoutePaths.cadastroCandidato
        .toUrl(parameters: {'id': item.id.toString()}));
  }

  void remover(Candidato item) async {
    try {
      await _candidatoService.remover(item);
      listar();
    } catch (e) {
      window.alert('Erro ao remover, $e');
    }
  }
}
