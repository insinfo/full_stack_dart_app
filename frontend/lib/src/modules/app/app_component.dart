import 'package:meu_proj_frontend/frontend.dart';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [
    routerDirectives,
  ],
  exports: [RoutePaths, Routes],
)
class AppComponent {}
