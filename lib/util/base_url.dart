class API {
  //always see ip address when connecting to another server..then change the ip address

  static const hostConnect = "http://192.168.0.103/tech_languages";
  static const admin = "$hostConnect/Admin";
  static const user = "$hostConnect/User";
  static const pdfFile = "$admin/pdfFile.php";
  static const pdfMaterial = "$admin/images/material";
  static const categoryImage = "$admin/images/category";
  static const userAuth = "$user/auth";
  static const userLogin = "$userAuth/login.php";
  static const userRegister = "$userAuth/register.php";
  static const courseCategory = "$admin/AllCategory.php";
}
