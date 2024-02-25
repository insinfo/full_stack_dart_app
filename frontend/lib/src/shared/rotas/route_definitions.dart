import 'package:ngrouter/angular_router.dart';

import 'route_paths.dart';
import 'package:meu_proj_frontend/src/modules/candidato/pages/cadastro_candidato/cadastro_candidato.template.dart'
    as cadastro_candidato;

import 'package:meu_proj_frontend/src/modules/candidato/pages/lista_candidato/lista_candidato.template.dart'
    as lista_candidato;

export 'route_paths.dart';

class Routes {
  static final cadastroCandidato = RouteDefinition(
    routePath: RoutePaths.cadastroCandidato,
    component: cadastro_candidato.CadatroCandidatoPageNgFactory,
  );

  static final listaCandidato = RouteDefinition(
    routePath: RoutePaths.listaCandidato,
    component: lista_candidato.ListaCandidatoPageNgFactory,
    useAsDefault: true,
  );

  static final publicRoutes = <RouteDefinition>[
    cadastroCandidato,
    listaCandidato
  ];
}
