// import 'package:flutter/material.dart';
import "./models/category.dart";
import './models/trip.dart';

// ignore: constant_identifier_names
const Categories_data = [
  Category(
    id: 'c1',
    title: 'Mountains',
    imageUrl:
        'https://images.unsplash.com/photo-1575728252059-db43d03fc2de?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTh8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=',
  ),
  Category(
    id: 'c2',
    title: 'Lakes',
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c3',
    title: 'Beaches',
    imageUrl:
        'https://images.unsplash.com/photo-1493558103817-58b2924bce98?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAxfHxiZWFjaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c4',
    title: 'Deserts',
    imageUrl:
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGVzZXJ0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c5',
    title: 'Historic cities',
    imageUrl:
        'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjR8fHRyYXZlbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
  Category(
    id: 'c6',
    title: 'Other',
    imageUrl:
        'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2tpaW5nfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ),
];

// ignore: constant_identifier_names
final Trips_data = [
  const Trip(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'The Alps',
    tripType: TripType.Exploration,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1611523658822-385aa008324c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8bW91bmF0aW5zfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 20,
    activities: [
      'Visit historical sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Have lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliquet, sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Skiing aliquet sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, aliquet sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: false,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm2',
    categories: [
      'c1',
    ],
    title: 'Southern Mountains',
    tripType: TripType.Exploration,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1612456225451-bb8d10d0131d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 10,
    activities: [
      'Visit historical sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Have lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliquet, sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Skiing aliquet sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: false,
    isForFamilies: false,
    isInWinter: false,
  ),
  const Trip(
    id: 'm3',
    categories: [
      'c1',
    ],
    title: 'High Mountains',
    tripType: TripType.Recovery,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1592221912790-2b4df8882ea9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzd8fG1vdW5hdGluc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 45,
    activities: [
      'Visit historical sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Have lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliquet, sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Skiing aliquet sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: false,
    isForFamilies: false,
    isInWinter: true,
  ),
  const Trip(
    id: 'm4',
    categories: [
      'c2',
      'c1',
    ],
    title: 'The Great Lake',
    tripType: TripType.Activities,
    season: Season.Spring,
    imageUrl:
        'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 60,
    activities: [
      'Visit historical sites',
      'Walking tour',
      'Shopping at commercial centers',
      'Have lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliquet, sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Skiing aliquet sit do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lorem do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: false,
    isForFamilies: false,
    isInWinter: false,
  ),
  const Trip(
    id: 'm5',
    categories: [
      'c2',
      'c1',
    ],
    title: 'The Small Lakes',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1580100586938-02822d99c4a8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fGxha2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 15,
    activities: [
      'Visit historical sites',
      'Walking city tour',
      'Shopping at commercial centers',
      'Lunch break',
      'Enjoy scenic views'
    ],
    program: [
      'Aliquat set do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Walking aliqua set do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, dolore magna aliqua.',
      'Eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: false,
    isInWinter: true,
  ),
  const Trip(
    id: 'm6',
    categories: [
      'c2',
    ],
    title: 'Emerald Lake',
    tripType: TripType.Exploration,
    season: Season.Summer,
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8bGFrZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 240,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: false,
    isInWinter: false,
  ),
  const Trip(
    id: 'm7',
    categories: [
      'c3',
    ],
    title: 'First Beach',
    tripType: TripType.Exploration,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1493558103817-58b2924bce98?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAxfHxiZWFjaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 20,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: false,
    isInWinter: false,
  ),
  const Trip(
    id: 'm8',
    categories: [
      'c3',
    ],
    title: 'The Big Beach',
    tripType: TripType.Recovery,
    season: Season.Spring,
    imageUrl:
        'https://images.unsplash.com/photo-1519046904884-53103b34b206?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhY2h8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 35,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: false,
    isInWinter: true,
  ),
  const Trip(
    id: 'm9',
    categories: [
      'c3',
    ],
    title: 'Rocky Beach',
    tripType: TripType.Exploration,
    season: Season.Summer,
    imageUrl:
        'https://images.unsplash.com/photo-1519602035691-16ac091344ef?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjE1fHxiZWFjaHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 45,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: false,
    isInWinter: false,
  ),
  const Trip(
    id: 'm10',
    categories: [
      'c4',
    ],
    title: 'The Great Desert',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1473580044384-7ba9967e16a0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZGVzZXJ0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm11',
    categories: [
      'c4',
      'c1',
    ],
    title: 'The Western Desert',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHRyYXZlbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm12',
    categories: [
      'c4',
    ],
    title: 'The Sandy Desert',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1452022582947-b521d8779ab6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODN8fGRlc2VydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm13',
    categories: [
      'c5',
    ],
    title: 'The First City',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1498307833015-e7b400441eb8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDJ8fHRyYXZlbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm14',
    categories: [
      'c5',
    ],
    title: 'The Second City',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjR8fHRyYXZlbHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm15',
    categories: [
      'c5',
    ],
    title: 'The Old City',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1519923041107-e4dc8d9193da?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njd8fG9sZCUyMGNpdHl8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm16',
    categories: [
      'c6',
    ],
    title: 'Skiing',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c2tpaW5nfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
  const Trip(
    id: 'm17',
    categories: [
      'c6',
      'c2',
    ],
    title: 'Skydiving',
    tripType: TripType.Activities,
    season: Season.Winter,
    imageUrl:
        'https://images.unsplash.com/photo-1601024445121-e5b82f020549?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBhcmFjaHV0ZSUyMGp1bXBpbmd8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    duration: 30,
    activities: [
      'Visit archaeological sites',
      'Walking tour',
      'Visit shopping centers',
      'Lunch',
      'Enjoy beautiful scenery'
    ],
    program: [
      'Aliyat, sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Ysking aliat sit do eosmod tempor incididunt ut labore et dolore magna aliqua.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'Lore do eosmod tempor incididunt ut labore et dolore magna aliqua.',
    ],
    isInSummer: true,
    isForFamilies: true,
    isInWinter: true,
  ),
];