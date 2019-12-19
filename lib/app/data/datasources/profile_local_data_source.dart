import 'package:bitplus/app/data/models/user.dart';
import 'package:bitplus/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileLocalDataSource {
  Future<Either<Failure, User>> getUserLocal();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<Either<Failure, User>> getUserLocal() {
    // TODO: implement getUserLocal
    return null;
  }
}
