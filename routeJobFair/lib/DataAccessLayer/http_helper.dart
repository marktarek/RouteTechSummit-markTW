import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:route_job_fair_flutter/DataAccessLayer/api/end_points_constant.dart';
import 'package:route_job_fair_flutter/DataAccessLayer/model/get_view_product_list_model.dart';
import 'package:route_job_fair_flutter/DataAccessLayer/network_helper.dart';
import 'package:route_job_fair_flutter/GUI/widgets/snack_bar.dart';

/// Restful Apis fetching methods (Post - Get):
class HttpHelper {
  getApi({required Uri url, required Map<String, String> headers}) async {
    print("---------------------");
    print("Method Get");
    if (kDebugMode) {
      print("url $url");
    }
    print("headers $headers");
    print("Time ${DateTime.now()}");
    print("---------------------");

    http.Response response = await http.get(url, headers: headers);

    print("*************************");
    print("Method Get");
    if (kDebugMode) {
      print("url $url");
    }
    print("headers $headers");
    print("response status code ${response.statusCode}");
    print("response body code ${response.body}");
    print("Time ${DateTime.now()}");
    print("-------------------------");

    return response;
  }

  Future getData(
      {required BuildContext context,
        required Uri url,
        required parseModel,
        required Map<String, String> headers}) async {

    return CheckNetworkConnection()
        .checkNetworkConnection()
        .then((value) async {

        http.Response response = await HttpHelper().getApi(
          url: url,
          headers: headers
            ..addAll({
              "Accept": "application/json",
              "Content-Type": "application/json",
            }),
        );

        if (response.statusCode == 200) {
          try {
            Map jsonResponse = await json.decode(response.body);
            var responseModel = parseModel(jsonResponse);
            return responseModel;
          } catch (error) {
            print(error);
            return parseModel({});
          }
        } else {
          showSnackBar(
            context: context,
            msg: "An Error Occurred : ${response.statusCode}",
            backgroundColor: SnackBarMsgType().errorMsg,
            apiType: 'Get',
          );

          return await Future.delayed(
              const Duration(seconds: apiRecallDuration))
              .then(
                (value) => getData(
              context: context,
              headers: headers,
              parseModel: parseModel,
              url: url,
            ),
          );
        }
    });
  }

  GetViewProductListModel getViewProductListModel = GetViewProductListModel(

    dataProductsList: [],
    total: 0,
    skip: 0,
    limit: 0,
  );


  Future<List<ProductsListModel>> getProducts(context) async {
    getViewProductListModel = await HttpHelper().getData(
      context: context,
      url: EndPointsConst().getProductsList,
      parseModel: GetViewProductListModel.fromJson,
      headers: {},
    );

    return getViewProductListModel.dataProductsList;
  }
}
