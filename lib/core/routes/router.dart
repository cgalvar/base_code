
import 'package:auto_route/auto_route_annotations.dart';
import 'package:base_code/features/custom_feature/presentation/pages/list_custom_feature_page.dart';
import 'package:base_code/features/custom_feature/presentation/pages/put_custom_feature_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension : true)
class $Router {
  
  @initial
  ListCustomFeaturePage listCustomFeaturePage;
  PutCustomFeaturePage putCustomFeaturePage;

}