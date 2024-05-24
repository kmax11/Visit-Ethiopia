import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          'tit': 'Ethiopia',
          'lalib': "lalibela",
          'lalibelaLocation': "Amhara ,Lalibela",
          'hometitle':"Where are you \n going?",
          'popular':"Popular Place",
          'login':"Login",
          'calendar':"Calendar",
          'calendarconverter' : "Calendar Converter",
          'language':"Language",
          'about':"About",
          'currency':"Currency Converter"
        },
        'am': {
          'tit': 'ኢትዮጲያ',
          'lalib': 'ላሊበላ',
          'lalibelaLocation': 'አማራ ,ላሊበላ',
          'hometitle':" ወዴት መሄድ \n ትፈልጋለህ?",
          'popular':"ታዋቂ ቦታዎች",
          'login':"ግባ",
          'calendar':"የቀን መቁጠሪያ",
          'calendarconverter':"የቀን መቁጠሪያ መቀየሪያ",
          'language':"ቋንቋ",
          'about':"ስለ",
          'currency':"ምንዛሬ መቀየሪያ"
        }
      };
}
