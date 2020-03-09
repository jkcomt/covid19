import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ncovid_19/model/covid19_model.dart';


class Covid19Provider{
 String _url   = 'https://apigw.nubentos.com:443/t/nubentos.com/ncovapi/1.0.0/';
 static String _token = '19d51baa-23c8-3aba-b875-ce228f1c760d';
 Map<String,String> _headers = {
     'Content-Type': 'application/json',
     'Authorization' : 'Bearer $_token'
   };
   
 Future<dynamic> getCases() async{
   final resp = await http.get( _url+"cases" , headers: _headers);
   final decodeData = json.decode(resp.body);
   //print(decodeData);
   
   return decodeData[0];
 }

 Future<dynamic> getCovid19Info() async{
  var value = <Map<String, dynamic>>[];

   //casos sopechoso y confirmados
   final resq1 = http.get(_url+"cases",headers: _headers);

  //casos confirmados
   final resq2 = http.get(_url+"cases/confirmed",headers: _headers);

  //casos sospechosos
   final resq3 = http.get(_url+"cases/suspected",headers: _headers);

  //nro fallecidos
  final resq4 = http.get(_url+"deaths",headers: _headers);

  //nro recuperados
  final resq5 = http.get(_url+"recovered",headers: _headers);

   List results = await Future.wait([ resq1, resq2, resq3, resq4, resq5]);
   /*results.asMap().entries.map((entry){
     int idx = entry.key;
     var decodeData = json.decode(entry.value.body);
     print(decodeData);
   });*/

    var covid19 = new Covid19();
  
   for(var result in results){
     var idx = results.indexOf(result);
     final decodeData = json.decode(result.body);
     switch(idx){
      case 0:
        covid19.cases = decodeData[0]['cases'].toString();
        break;
      case 1:        
        covid19.confirmed = decodeData[0]['data'].toString();
        break;
      case 2:
        covid19.suspected = decodeData[0]['data'].toString();
        break;
      case 3:
        covid19.deaths = decodeData[0]['data'].toString();
        break;
      case 4:
        covid19.recovered= decodeData[0]['data'].toString();        
        break;
     }
     
     //print(value);
   }
   
   return covid19;
 }

 
}