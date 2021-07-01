import 'package:acthub/Screens/Home/HomePage.dart';
import 'package:acthub/Screens/Home/Nested/SearchPage.dart';
import 'package:acthub/Screens/Home/Nested/SubCategoryPage.dart';
import 'package:acthub/Screens/LandingPage.dart';
import 'package:acthub/Screens/Management/ManagementPage.dart';
import 'package:acthub/Screens/Map/MapPage.dart';
import 'package:acthub/Screens/NavigationPage.dart';
import 'package:acthub/Screens/Notification/NotificationPage.dart';
import 'package:acthub/Screens/Profile/Nested/AboutProfile.dart';
import 'package:acthub/Screens/Profile/Nested/ActLink.dart';
import 'package:acthub/Screens/Profile/Nested/BillingPage.dart';
import 'package:acthub/Screens/Profile/Nested/CurrencyPage.dart';
import 'package:acthub/Screens/Profile/Nested/PackagesScreen.dart';
import 'package:acthub/Screens/Profile/Nested/PrivacyPolicyProfile.dart';
import 'package:acthub/Screens/Profile/Nested/SelectLanguage.dart';
import 'package:acthub/Screens/Welcome/EnableLocation.dart';
import 'package:acthub/Screens/Welcome/LogInPage.dart';
import 'package:acthub/Screens/Welcome/PrivacyPolicy.dart';
import 'package:acthub/Screens/Welcome/SignIn.dart';
import 'package:acthub/Screens/Welcome/SignUpAsPage.dart';
import 'package:acthub/Screens/Welcome/SignUpFormPage.dart';
import 'package:acthub/Screens/Welcome/TermsAndConditions.dart';
import 'package:acthub/Screens/Welcome/YourData.dart';
import 'package:flutter/material.dart';
import 'Screens/ActivityPage.dart';
import 'Screens/Management/Nested/AddActivity.dart';
import 'Screens/Profile/Nested/AboutUsScreen.dart';
import 'Screens/Profile/Nested/ContactUsPage.dart';
import 'Screens/Profile/Nested/EditProfileScreen.dart';
import 'Screens/Profile/ProfilePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AddActivity.id,
      routes: {
        LandingPage.id: (context) => LandingPage(),
        EnableLocation.id: (context) => EnableLocation(),
        PrivacyPolicy.id: (context) => PrivacyPolicy(),
        TermsAndConditions.id: (context) => TermsAndConditions(),
        YourData.id: (context) => YourData(),
        SignUpAsPage.id: (context) => SignUpAsPage(),
        SignUpFormPage.id: (context) => SignUpFormPage(),
        LogInPage.id: (context) => LogInPage(),
        SignIn.id: (context) => SignIn(),
        HomePage.id: (context) => HomePage(),
        NavigationPage.id: (context) => NavigationPage(),
        MapPage.id: (context) => MapPage(),
        ManagementPage.id: (context) => ManagementPage(),
        SearchPage.id: (context) => SearchPage(),
        SubCategoryPage.id: (context) => SubCategoryPage(),
        ActivityPage.id: (context) => ActivityPage(),
        ProfilePage.id: (context) => ProfilePage(),
        PackagesScreen.id: (context) => PackagesScreen(),
        ContactUsPage.id: (context) => ContactUsPage(),
        AboutUsScreen.id: (context) => AboutUsScreen(),
        EditProfileScreen.id: (context) => EditProfileScreen(),
        ActLink.id: (context) => ActLink(),
        AddActivity.id: (context) => AddActivity(),
        CurrencyPage.id: (context) => CurrencyPage(),
        BillingPage.id: (context) => BillingPage(),
        NotificationPage.id: (context) => NotificationPage(),
        SelectLanguage.id:(context) => SelectLanguage(),
        AboutProfile.id:(context)=>AboutProfile(),
        PrivacyPolicyProfile.id:(context)=>PrivacyPolicy()
      },
    );
  }
}
