import 'package:auth/feature/profile/data/models/user_data.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';


abstract class ProfileRepo {
  Future<Either<UserData, Failuer>> getProfile(
      {required int id, });
  
}
