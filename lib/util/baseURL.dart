//always see ip address when connecting to another server..
//then change the ip address
//const String baseurl = "http:// 192.168.0.103/tech_languages/";
//const String register = "${baseurl}user/auth/register.php";
//const String login = "${baseurl}user/auth/login.php";

class API {
  static const hostConnect = "http://192.168.0.103/tech_languages";
  static const admin = "${hostConnect}/Admin";
  static const user = "${hostConnect}/User";
  static const pdfFile = "${admin}/pdfFile.php";
  static const pdfMaterial = "${admin}/images/material";
}
