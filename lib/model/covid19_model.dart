class Covid19{
  String cases = "";
  String suspected = "";
  String confirmed = "";
  String deaths = "";
  String recovered = "";

  Covid19(){
    // Covid19(String cases, String suspected, String confirmed, String deaths, String recovered){
    // this.cases      = cases;
    // this.suspected  = suspected;
    // this.confirmed  = confirmed;
    // this.deaths     = deaths;
    // this.recovered  = recovered;
  }

  Covid19.fromJsonMap(Map<String,dynamic> json){
    cases     = json['cases'].toString();
    suspected = json['suspected'].toString();
    confirmed = json['confirmed'].toString();
    deaths    = json['deaths'].toString();
    recovered = json['recovered'].toString();
  }
}