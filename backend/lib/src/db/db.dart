import 'package:eloquent/eloquent.dart';

late Connection db;
Future<void> connect() async {
  final manager = Manager();
  manager.addConnection({
    'driver': 'pgsql',
    'host': 'localhost',
    'port': '5432',
    'database': 'meu_projeto',
    'username': 'postgres',
    'password': 'dart',
    'charset': 'utf8',
    'prefix': '',
    'schema': ['public'],
  });
  manager.setAsGlobal();
  db = await manager.connection();
  print('connected in database');
}
