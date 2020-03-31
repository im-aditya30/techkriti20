import 'package:techkriti20/data/hospitality.dart';
import 'package:techkriti20/data/model/data_models.dart';
import 'package:techkriti20/utils/api.dart';
import 'package:techkriti20/widgets/sexy_bottom_sheet.dart';

final List<SheetItem> prizeitem = [
  SheetItem('assets/icons/first.png', 'First Prize', 'prize',
      null),
  SheetItem('assets/icons/second.png', 'Second Prize',null,null),
  SheetItem('assets/icons/third.png', 'Third Prize','hg',null),
  // SheetItem('assets/icons/contactus.png', 'Icon 4',null,null),
];
 final List<SheetItem> items = [
  SheetItem('assets/icons/prize.png', 'Prizes','/catalogClick',prizeitem),
  SheetItem('assets/icons/rules.png', 'Rules',null,todo),
  SheetItem('assets/icons/updates.png', 'Updates',null,todo),
  SheetItem('assets/icons/aboutus.png', 'About',null,todo),
  SheetItem('assets/icons/contactus.png', 'Contact us',null,todo),
];

// final List<String> events_list = [
//   'Competitions',

// ];


List<Category> eventsName = [
  competitions,
  workshops,
  talks,
  shows,
  // hospitality,
];

final List<SheetItem> todo = [
  SheetItem(null, 'Coming Soon', null, null),
];

var competitions = Category(name: 'Competitions', image: 'assets/event/Competitions.jpg');
// var prelims = Category(name: 'Prelims', image: 'assets/event/jupiter.jpg');
var workshops = Category(name: 'Workshops', image: 'assets/event/Workshops.jpg');
var talks = Category(name: 'Talks', image: 'assets/event/Talks.jpg',subCategories: null);
var shows = Category(name: 'Shows', image: 'assets/event/Shows.jpg',subCategories: null);
// var summit = Category(name: 'Summit', image: 'assets/event/moon.jpg');
// var schedule = Category(name: 'Schedule', image: 'assets/event/jupiter.jpg');

Future<Category> buildCompetitions() async{
  var json = await Api().getContentJSON('competitions');
  if(json == 'errorObtaining'){
    var c= Category(name: 'Competitions');
    c.subCategories = null;
    c.events = null;
    competitions = c;
    return c;
  }
  else {
    json = json[0];
    var imageUrl = 'https://techkriti.org/assets/images/comp/';

    var c = Category(name: 'Competitions');
    c.subCategories = [
      Category(name: 'Technical', subCategories: [
        Category(name: 'PUBGM Pan Mania',
          events: _createEventList(json['Technical']['PUBGM Pan Mania']),
          image: imageUrl + 'PUBGM Pan Mania.jpg',
        ),
        Category(
            name: 'ECDC',
            events: _createEventList(json['Technical']['ECDC']),
            image: imageUrl + 'ECDC.jpg',
            ),
        Category(
            name: 'Technovation',
            events: _createEventList(json['Technical']['Technovation']),
            image: imageUrl + 'Technovation.jpg',
            ),
        Category(
            name: 'Design Events',
            events: _createEventList(json['Technical']['Design Events']),
            image: imageUrl + 'Design Events.jpg'),
        Category(
            name: 'Robogames',
            events: _createEventList(json['Technical']['Robogames']),
            image: imageUrl + 'Robogames.jpg'),
        Category(
            name: 'Software Corner',
            events: _createEventList(json['Technical']['Software Corner']),
            image: imageUrl + 'Software Corner.jpg',),
        Category(
            name: 'Take Off',
            events: _createEventList(json['Technical']['Take Off']),
            image: imageUrl + 'Take Off.jpg',
            ),
        Category(
            name: 'Mixed Bowl',
            events: _createEventList(json['Technical']['Mixed Bowl']),
            image: imageUrl + 'Mixed Bowl.jpg'),
        // Category(
        //     name: 'Techkriti Grand Prix',
        //     events: _createEventList(json['Technical']['Techkriti Grand Prix']),
        //     image: imageUrl + 'Techkriti Grand Prix'),
      ],
      image: imageUrl + 'technology.jpg'
      ),
      Category(
        name: 'Entrepreneurial',
        subCategories: [
          Category(
            name: 'Business Events',
            events: _createEventList(json['Entrepreneurial']['Business Events']),
            image: imageUrl + 'Business-Events.jpg',
          ),
          Category(
            name: 'Entrepreneurial Events',
            events: _createEventList(
                json['Entrepreneurial']['Entrepreneurial Events']),
            image: imageUrl + 'Entrepreneurial-Events.jpg',
          )
        ],
        image:imageUrl + 'finance.png'
      ),
      // Category(
      //     name: 'International',
      //     events: 
      //         _createEventList(json['International']['International Events']),
      //     image: imageUrl + 'International Events.jpg'
      // ),
    ];

    competitions = c;
    return c;
  }
}



// Future<Category> populatePrelims() async {
//   var json = await Api().getContentJSON('prelims');
//   var p = Category(name: "Prelims");
//   p.events = _createEventList(json);

//   prelims = p;
//   return p;
// }

Future<Category> populateHospitality() async {
  // var json = await Api().getContentJSON('hospitality');
  // var h = Category(name: 'Hospitality');
  // h.content = _createContentList(json);

  // hospitality = h;
  return hospitality;
}
Future<Category> populateShows() async{
  var s= Category(name: 'Shows',subCategories:[
    Category(name: 'Coming Soon')
  ]);
  shows = s;
  return shows;
}
Future<Category> populateTalks() async {
  // var json = await Api().getContentJSON('talks');
  // var t = Category(name: 'Talks');
  // t.content = _createContentList(json);

  // talks = t;
  // return t;
  var t= Category(name: 'Talks',subCategories: [
    Category(name: 'Coming Soon')
  ]);
  talks = t;
  return talks;
}

Future<Category> populateWorkshops() async {
  var json = await Api().getContentJSON('workshops');
  var w = Category(name: 'Workshops');
  if(json == 'errorObtaining'){
    w.subCategories =null;
    w.events =null;
  }
  else{
    w.events = List();

  for (var workshop in json) {
    List<Content> tabs = List();

    for (var tab in workshop['tabs']) {
      tabs.add(Content(title: tab['tabname'], htmlContent: tab['content']));
    }
    
    var e = Event(name: workshop['name'], content: tabs);
    w.events.add(e);
  }
  }
  workshops = w;
  return w;
  
}

// Future<User> populateUser(String token) async {
//   // TODO: Completely parse the json
//   // FirebaseAuth _auth = FirebaseAuth.instance;
//   // FirebaseUser _user;
//   _auth.currentUser().then((user){
//     _user = user;
//   });
//   var json = await Api().getUserProfile(token);

//   print('Profile JSON: $json');
//   print('Creating the user object');
//   var u = User(
//     email: json['email'],
//     name: json['name'],
//     countryCode: json['countryCode'],
//     techId: json['techId'],
//     picture: _user.photoUrl+"?width=500&height=500",
//     collegeCity: json['city'],
//     college: json['college'],
//     phone: json['phone'],
//     paid: json['hospiPaid']
//   );

//   user = u;
//   return u;
// }

List<Event> _createEventList(dynamic eventCategoryJson) {
  print(eventCategoryJson.length);
  List<Event> eventsList = List();
  int i = 0;
  for (; i < eventCategoryJson.length;i++) {
    eventsList.add(_createEvent(eventCategoryJson[i]));
    // i++;
  }
  return eventsList;
}

Event _createEvent(dynamic eventJson) {
  return Event(
    name: eventJson['name'],
    teamSize: eventJson['teamSize'],
    prize: eventJson['prize'],
    content: _createEventContent(eventJson['content']),
  );
}

List<Content> _createEventContent(dynamic contentJson) {
  List<Content> eventContent = List();
  for (var level in contentJson) {
    eventContent.add(Content(
      title: level['title'],
      htmlContent: level['content'],
    ));
  }
  return eventContent;
}

List<Content> _createContentList(dynamic json) {
  List<Content> categoryContent = List();
  int i = 0;
  for (var c in json) {
    categoryContent.add(Content(
      htmlContent: c['content'], //or json[i]['content]
      title: json[i]['title'],
    ));
    i++;
  }
  return categoryContent;
}



var hospitality = Category(
  name: 'Hospitality',
  events: <Event>[
    Event(
      name: 'Introduction',
      content: <Content>[
        Content(title: 'Introduction', htmlContent: introductionHTML),
      ],
    ),
    Event(
      name: 'Fee Structure',
      content: <Content>[
        Content(title: 'Fee Structure', htmlContent: feeHTML),
      ],
    ),
    Event(
      name: 'Reaching IITK',
      content: <Content>[
        Content(title: 'Reaching IITK', htmlContent: reachingHTML),
      ],
    ),
    Event(
      name: 'Registration',
      content: <Content>[
        Content(title: 'Registration', htmlContent: registrationHTML),
      ],
    ),
    Event(
      name: 'Instructions',
      content: <Content>[
        Content(title: 'Instructions', htmlContent: instructionsHTML),
      ],
    ),
    Event(
      name: 'FAQ',
      content: <Content>[
        Content(title: 'FAQ', htmlContent: faqHTML),
      ],
    ),
  ],
  image: 'assets/images/hospi/hospitality.png',
);


// List<Category> topLevelCategories = [
//   competitions,
//   workshops,
//   talks,
//   shows,
//   hospitality,
// ];



final securityGuidelines = <String>[
  'Entry will begin around half an hour prior to show.',
  'Restricted areas: Construction sites, faculty and staff residence, road connecting airstrip and environment building, academic area, open air theatre, area beyond Health Centre, airstrip, and adjoining villages will be indicated by no entry zone',
  'Proper allocation of areas for parking: road in between & connecting hall 7 and hall 8, backside of auditorium, old & new Shop C and beside Pronite ground',
  'Fire Brigade and ambulance will be present during shows to handle emergency situation.',
  'Strict frisking in the event held at Auditorium, Pronite ground, Events ground and Outreach auditorium.',
  'Camera, Bags and any potential hazardous items will not be allowed inside the venue',
  'Any person under the influence of intoxicant(s) will be penalized heavily & denied entry',
  'OAT will be closed for everyone due to security reasons from 6:00 PM to 10:30 PM on 7th to 10th March.',
  'All the participants must carry their college ID cards and hospitality booklet during the festival and should produce the same on demand',
  'Consumption of liquor or any other intoxicant or smoking is strictly prohibited',
  'Any kind of indiscipline during the time of the festival shall lead to strict disciplinary actions against the contingent/participant concerned',
  'Entry into academic area after 11:59pm to the participants is prohibited',
  'Entering into the restricted areas shall lead to strict disciplinary actions ',
  'No consumption, storage or carrying of any intoxicant substances or smoking at the place of accommodation',
  'Male participants are NOT allowed to enter any of the girls accommodation areas',
  'Girls are allowed to visit boys’ hostel from 6 AM to 11:59 PM with confinement to central quadrangle, canteen and mess. Entry in the accommodation area is not allowed',
  'Participants should not damage any of the institute/hall property',
  'Observe the rules and regulations of the respective places of accommodation. Cooperate with the hall regulations.',
];
