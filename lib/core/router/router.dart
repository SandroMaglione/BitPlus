import 'package:auto_route/auto_route_annotations.dart';
import 'package:bitplus/app/presentation/screen/loading_screen.dart';

@autoRouter
class $Router {
  @initial
  LoadingScreen loadingScreen;
}
