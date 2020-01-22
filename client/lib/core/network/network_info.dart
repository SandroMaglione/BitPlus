import 'package:meta/meta.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  /// Returns true if a internet connection is available
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  const NetworkInfoImpl({
    @required this.dataConnectionChecker,
  });

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
