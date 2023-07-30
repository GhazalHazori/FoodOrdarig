import 'package:dartz/dartz.dart';
import 'package:resturant/core/data/models/apis/category_model.dart';
import 'package:resturant/core/data/network/endpoints/category_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class CategoryRepository {
  Future<Either<String, List<CategoryModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CategoryEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CategoryModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CategoryModel.fromjson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
