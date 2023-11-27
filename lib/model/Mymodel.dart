// import 'dart:math';
//
// class Movie{
//   String movieName;
//   final String? duration;
//   Movie({required this.movieName,required this.duration});
// }
//
// final List<Movie> initialData= List.generate(50,
//         (index) => Movie(
//             movieName: "movies $index",
//             duration: "${Random().nextInt (100) + 60 } min"));

import'dart:math';

class WebSeries{
  String title;
  String duration;
  WebSeries({required this.title ,required this.duration});
}

final List<WebSeries> webseries=List.generate(50, (index) => WebSeries(title: "Web Series $index", duration: "${Random().nextInt(100)+ 60 } minutes "));