import 'package:bookshelf/bootstrap.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/modules/app/app.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  await configureInjection(environment: Environment.test);
  await bootstrap(() => const App());
}
