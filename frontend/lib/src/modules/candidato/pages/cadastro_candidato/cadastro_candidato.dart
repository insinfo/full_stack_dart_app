import 'dart:html';

import 'package:meu_proj_frontend/frontend.dart';
import 'package:meu_proj_frontend/src/modules/candidato/services/canditado_service.dart';
import 'package:meu_proj_frontend/src/shared/models/candidato.dart';
import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/angular_router.dart';

@Component(
  selector: 'cadastro-candidato-page',
  templateUrl: 'cadastro_candidato.html',
  directives: [
    coreDirectives,
    formDirectives,
  ],
)
class CadatroCandidatoPage {
  final CandidatoService _candidatoService = CandidatoService();
  final Router _router;
  Candidato candidato = Candidato();

  CadatroCandidatoPage(this._router);

  void salvar() async {
    try {
      await _candidatoService.cadastrar(candidato);
      window.alert('Salvo');
      _router.navigate(RoutePaths.listaCandidato.toUrl());
    } catch (e) {
      window.alert('Erro ao salvar, $e');
    }
  }
}
