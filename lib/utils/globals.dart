import 'package:techkriti20/data/data.dart';
import 'package:techkriti20/data/model/data_models.dart';
import 'package:techkriti20/pages/schedule/schedule.dart';

enum CATEGORY { COMPETITIONS, SUMMIT, WORKSHOPS, HOSPITALITY, TALKS, SHOWS, SCHEDULE }

Future populateData(String s) {
  switch (s) {
    case 'Competitions':
      return buildCompetitions();
      break;

    // case 'Summit':
    //   return ;
    //   break;

    case 'Workshops':
      return populateWorkshops();
      break;

    case 'Hospitality':
      return populateHospitality();
      break;

    case 'Talks':
      return populateTalks();
      break;

    case 'Shows':
      return populateShows();
      break;
    
    // case 'Schedule':
    //   return schedule;
    //   break;
  }
}

// CATEGORY toCategoryEnum(String s) {
//   switch (s) {
//     case 'Competitions':
//       return CATEGORY.COMPETITIONS;
//       break;

//     case 'Summit':
//       return CATEGORY.SUMMIT;
//       break;

//     case 'Workshops':
//       return CATEGORY.WORKSHOPS;
//       break;

//     case 'Hospitality':
//       return CATEGORY.HOSPITALITY;
//       break;

//     case 'Talks':
//       return CATEGORY.TALKS;
//       break;

//     case 'Shows':
//       return CATEGORY.SHOWS;
//       break;
    
//     case 'Schedule':
//       return CATEGORY.SCHEDULE;
//       break;
//   }
// }

String toCategoryString(CATEGORY c) {
  switch (c) {
    case CATEGORY.COMPETITIONS:
      return 'Competitions';
      break;
    case CATEGORY.SUMMIT:
      return 'Summit';
      break;
    case CATEGORY.HOSPITALITY:
      return 'Hospitality';
      break;
    case CATEGORY.WORKSHOPS:
      return 'Workshops';
      break;
    case CATEGORY.TALKS:
      return 'Talks';
      break;
    case CATEGORY.SHOWS:
      return 'Shows';
      break;
    case CATEGORY.SCHEDULE:
      return 'Schedule';
      break;
  }
}

String blank_image = 'https://upload.wikimedia.org/wikipedia/commons/5/57/Color_icon_white.svg';

Category toCategoryEnum(String s) {
  switch (s) {
    case 'Competitions':
      return competitions;
      break;

    // case 'Summit':
    //   return sumit;
    //   break;

    case 'Workshops':
      return workshops;
      break;

    case 'Hospitality':
      return hospitality;
      break;

    case 'Talks':
      return talks;
      break;

    case 'Shows':
      return shows;
      break;
    
    // case 'Schedule':
    //   return schedule;
    //   break;
  }
}
