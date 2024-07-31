import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<String, Failuer>> login(
      {required String email, required String password});
  Future<Either<String, Failuer>> register(
      {required String email, required String password});

}
