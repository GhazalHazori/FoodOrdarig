import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:resturant/core/data/models/apis/category_model.dart';

import 'package:resturant/core/data/models/apis/token_info.dart';
import 'package:resturant/core/data/network/endpoints/category_endpoints.dart';
import 'package:resturant/core/data/network/endpoints/user_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/apis/meal_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/meal_endpoints.dart';
import '../network/network_config.dart';

class MealRepository {
  Future<Either<String, List<MealModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: MealEndpoints.getall,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
          type: RequestType.GET,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<MealModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(MealModel.fromJson(element));
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
