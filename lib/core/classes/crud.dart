import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../constants/statusrequest.dart';
import '../functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
        // print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          // print(responsebody);
          return Right(responsebody);
        } else {
          // print("fail");

          return const Left(StatusRequest.serverfailure);
        }
      } else {
        // print("offline");

        return const Left(StatusRequest.offlinefailure);
      }
    } catch ($e) {
      // print($e);
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 401) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
