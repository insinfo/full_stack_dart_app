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

  List<Candidato> candidatos = [];

  @override
  void onActivate(RouterState? previous, RouterState current) async {
    candidatos = await _candidatoService.listar();
  }
}
