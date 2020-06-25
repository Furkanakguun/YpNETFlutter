import 'dart:async'; //it allows us to convert our json to a list
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://randomuser.me/api/?results=10";

class YpNetServices {


    static Future getUsers() {
    var url = baseUrl;
    return http.get(url);
  }



}