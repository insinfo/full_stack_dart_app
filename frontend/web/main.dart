import 'package:meu_proj_frontend/src/modules/candidato/services/canditado_service.dart';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import 'package:meu_proj_frontend/src/modules/app/app_component.template.dart'
    as ng;
import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash,
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
