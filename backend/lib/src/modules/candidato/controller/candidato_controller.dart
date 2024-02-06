import 'dart:convert';
import 'package:meu_proj_backend/src/modules/candidato/repository/candidato_repository.dart';
import 'package:shelf/shelf.dart';

class CandidatoController {
  static Future<Response> listar(Request request) async {
    final data = await CandidatoRepository().listar();
    return Response.ok(jsonEncode(data), headers: {'Content-type': 'application/json; charset=utf-8'});
  }

  static Future<Response> cadastrar(Request request) async {
    final data = jsonDecode(await request.readAsString());
    await CandidatoRepository().cadastrar(data);
    return Response.ok('ok');
  }
}
