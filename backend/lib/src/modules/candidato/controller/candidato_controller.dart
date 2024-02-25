import 'dart:convert';
import 'package:meu_proj_backend/src/modules/candidato/repository/candidato_repository.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class CandidatoController {
  static Future<Response> listar(Request request) async {
    final data = await CandidatoRepository().listar();
    return Response.ok(jsonEncode(data),
        headers: {'Content-type': 'application/json; charset=utf-8'});
  }

  static Future<Response> getById(Request request) async {
    final id = int.tryParse(request.params['id'] ?? '');
    if (id == null) {
      throw Exception('id não pode ser nulo');
    }
    final data = await CandidatoRepository().getById(id);
    return Response.ok(jsonEncode(data),
        headers: {'Content-type': 'application/json; charset=utf-8'});
  }

  static Future<Response> cadastrar(Request request) async {
    final data = jsonDecode(await request.readAsString());
    await CandidatoRepository().cadastrar(data);
    return Response.ok('ok');
  }

  static Future<Response> atualizar(Request request) async {
    final data = jsonDecode(await request.readAsString());
    await CandidatoRepository().atualizar(data);
    return Response.ok('ok');
  }

  static Future<Response> remover(Request request) async {
    final data = jsonDecode(await request.readAsString());
    await CandidatoRepository().remover(data);
    return Response.ok('ok');
  }
}
