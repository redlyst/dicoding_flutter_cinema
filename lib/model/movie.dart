class Movie {
  String title;
  String description;
  String posterUrl;
  String backgroundUrl;
  String releaseDate;

  Movie({
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.backgroundUrl,
    required this.releaseDate,
  });
}

var movieList = [
  Movie(
      title: 'Lightyear',
      description:
          'Legendary Space Ranger Buzz Lightyear embarks on an intergalactic adventure alongside a group of ambitious recruits and his robot companion Sox.',
      posterUrl:
          'https://image.tmdb.org/t/p/w300/8qHwlezCZzOhq88mnpeqK4asz4n.jpg',
      backgroundUrl:
          'https://image.tmdb.org/t/p/w780/nW5fUbldp1DYf2uQ3zJTUdachOu.jpg',
      releaseDate: '15 June 2022'),
  Movie(
      title: 'Thor: Love and Thunder',
      description:
          'After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Relatively Mighty Girl Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.',
      posterUrl:
          'https://image.tmdb.org/t/p/w300/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg',
      backgroundUrl:
          'https://image.tmdb.org/t/p/w780/p1F51Lvj3sMopG948F5HsBbl43C.jpg',
      releaseDate: '06 July 2022'),
  Movie(
      title: 'Prey',
      description:
          'When danger threatens her camp, the fierce and highly skilled Comanche warrior Naru sets out to protect her people. But the prey she stalks turns out to be a highly evolved alien predator with a technically advanced arsenal.',
      posterUrl:
          'https://image.tmdb.org/t/p/w300/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg',
      backgroundUrl:
          'https://image.tmdb.org/t/p/w780/7ZO9yoEU2fAHKhmJWfAc2QIPWJg.jpg',
      releaseDate: '02 August 2022'),
  Movie(
      title: 'Luck',
      description:
          'Suddenly finding herself in the never-before-seen Land of Luck, the unluckiest person in the world must unite with the magical creatures there to turn her luck around.',
      posterUrl:
          'https://image.tmdb.org/t/p/w300/1HOYvwGFioUFL58UVvDRG6beEDm.jpg',
      backgroundUrl:
          'https://image.tmdb.org/t/p/w780/3VQj6m0I6gkuRaljmhNZl0XR3by.jpg',
      releaseDate: '05 August 2022'),
  Movie(
      title: 'Office Invasion',
      description:
          'Three friends come together to defend their valuable mining company from…aliens?! What could possibly go wrong?',
      posterUrl:
          'https://image.tmdb.org/t/p/w300/kDC9Q3kiVaxrJijaGeZ8ZB2ZoiX.jpg',
      backgroundUrl:
          'https://image.tmdb.org/t/p/w780/bL7VIHQ4Nl0hZMw8ZeX6byoEEZJ.jpg',
      releaseDate: '10 August 2022'),
];
