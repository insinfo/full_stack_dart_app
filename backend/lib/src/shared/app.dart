import 'package:meu_proj_backend/src/db/db.dart';
import 'package:meu_proj_backend/src/shared/rotas/rotas.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:shelf/shelf.dart';

import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'package:shelf/shelf_io.dart' as io;

Future<void> initApp() async {
  final app = Router();
  await connect();
  await initRotas(app);
  final handler = Pipeline().addMiddleware(corsHeaders()).addHandler(app);
  await io.serve(handler, 'localhost', 8181);
  print('server init on http://localhost:8181');
}
