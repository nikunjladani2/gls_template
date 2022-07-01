import 'package:gls_template/view/models/response/error/service_error.dart';
import 'package:gls_template/view/models/response/product_detail_response.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/service/request/tg_post_request.dart';
import 'package:techgrains/com/techgrains/service/tg_service.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager();

  static ServiceManager getInstance() {
    return _instance;
  }


  // ignore: use_function_type_syntax_for_parameters
  void fetchProductDetailByUpc({required TGPostRequest request, onSuccess(T)?, onError(T)?}) {
    TGLog.d("ServiceManager.fetchProductDetailByUpc: " + request.body());
    TGLog.d("ServiceManager.fetchProductDetailByUpc: " + request.getBaseUrl().toString() + request.getUri());
    TGService<ProductDetailResponse, ServiceError>(
            () => ProductDetailResponse(), () => ServiceError())
        .post(
        request: request,
        onSuccess: (response) => onSuccess!(response),
        onError: (error) => onError!(error));
  }

}
