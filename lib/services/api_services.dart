import 'dart:convert';

import 'package:flutter/services.dart' as the_bundle;
import 'package:shoe_mart/database/models/sneaker_model.dart';
import 'package:shoe_mart/utils/utils.dart';

//Helper class for fetching apis from the json files.
class ApiServices {
  ApiServices._internal();
  static ApiServices instance = ApiServices._internal();
  factory ApiServices() => instance;

  //Fetch male sneakers
  Future<List<SneakerModel>> fetchMenSneakers() async {
    final data = await the_bundle.rootBundle.loadString(menShoesJson);
    final jsonList = jsonDecode(data) as List;

    return jsonList.map((jsonData) {
      return SneakerModel.fromJson(jsonData);
    }).toList();
  }

  //Fetch women sneakers
  Future<List<SneakerModel>> fetchWomenSneakers() async {
    final data = await the_bundle.rootBundle.loadString(womenShoesJson);
    final jsonList = jsonDecode(data) as List;

    return jsonList.map((jsonData) {
      return SneakerModel.fromJson(jsonData);
    }).toList();
  }

  //Fetch kids sneakers
  Future<List<SneakerModel>> fetchkidsSneakers() async {
    final data = await the_bundle.rootBundle.loadString(kidsShoesJson);
    final jsonList = jsonDecode(data) as List;

    return jsonList.map((jsonData) {
      return SneakerModel.fromJson(jsonData);
    }).toList();
  }

  //Fetch male sneakers by id
  Future<SneakerModel?> fetchMaleSneakerById({required String id}) async {
    final data = await the_bundle.rootBundle.loadString(menShoesJson);
    final jsonList = jsonDecode(data) as List;

    final jsonSneaker = jsonList.firstWhere((jsonData) => jsonData['id'] == id,
        orElse: () => null);

    if (jsonSneaker == null) return null;
    return SneakerModel.fromJson(jsonSneaker);
  }

  //Fetch women sneakers by id
  Future<SneakerModel?> fetchWomenSneakerById({required String id}) async {
    final data = await the_bundle.rootBundle.loadString(womenShoesJson);
    final jsonList = jsonDecode(data) as List;

    final jsonSneaker = jsonList.firstWhere((jsonData) => jsonData['id'] == id,
        orElse: () => null);

    if (jsonSneaker == null) return null;
    return SneakerModel.fromJson(jsonSneaker);
  }

  //Fetch kids sneakers by id
  Future<SneakerModel?> fetchKidsSneakerById({required String id}) async {
    final data = await the_bundle.rootBundle.loadString(kidsShoesJson);
    final jsonList = jsonDecode(data) as List;

    final jsonSneaker = jsonList.firstWhere((jsonData) => jsonData['id'] == id,
        orElse: () => null);

    if (jsonSneaker == null) return null;
    return SneakerModel.fromJson(jsonSneaker);
  }
}
