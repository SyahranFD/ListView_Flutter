import 'package:flutter/material.dart';
import 'package:listview_movie/app/widget/widget.dart';
import 'package:listview_movie/helpers/themes.dart';
import '../model/movie.dart';
import '../model/genre.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ListViewMovie extends StatefulWidget {
  const ListViewMovie({Key? key}) : super(key: key);

  @override
  State<ListViewMovie> createState() => _ListViewMovieState();
}

class _ListViewMovieState extends State<ListViewMovie> {

  List<Movie>? favoriteMovie = [];
  List<Genre>? genreMovie = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Movie movie1 = new Movie(
        "The Greatest Showman",
        "Musical/Drama",
        "3.7",
        "29 Dec 2017",
        "1h 45m",
        "P T Barnum becomes a worldwide sensation in the show business. His imagination and innovative ideas take him to the top of his game.",
        "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/7855c44b0b75dcd3a6d49b58b683df34041f51a86d70826351aec027c5b1c207._RI_TTW_.jpg"
    );
    Movie movie2 = new Movie(
        "BoBoiBoy: The Movie",
        "Action/Sci-fi",
        "3.3",
        "13 Apr 2016",
        "1h 40m",
        "BoBoiBoy and his friends embark on a mission to stop alien treasure hunters from getting hold of a powerful device.",
        "https://wallpapercave.com/wp/wp8600997.jpg"
    );
    Movie movie3 = new Movie(
        "Charlie and the Chocolate Factory",
        "Fantasy/Family",
        "3.3",
        "10 Jul 2005",
        "1h 55m",
        "Charlie, a young boy from an impoverished family, and four other kids win a tour of an amazing chocolate factory run by an imaginative chocolatier, Willy Wonka, and his staff of Oompa-Loompas.",
        "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/71af5cc5e1719dd03f31fd1114faf727151ce10da91dff15e9537407902f188a._RI_TTW_.jpg"
    );
    Movie movie4 = new Movie(
        "Kung Fu Panda 3",
        "Family/Comedy",
        "3.5",
        "8 Mar 2016",
        "1h 35m",
        "The Dragon Warrior, Po, has to deal with challenges galore when circumstances compel him to train a bunch of awkward pandas in martial arts so that they can trounce Kai, a wicked supernatural warrior.",
        "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/6e821140857a5aa6276b3086792178021a510619472ecb06b5cf48374a6e5bc6._RI_TTW_.jpg"
    );
    favoriteMovie?.add(movie1);
    favoriteMovie?.add(movie2);
    favoriteMovie?.add(movie3);
    favoriteMovie?.add(movie4);

    Genre genre1 = new Genre("All");
    Genre genre2 = new Genre("Action");
    Genre genre3 = new Genre("Comedy");
    Genre genre4 = new Genre("Drama");
    Genre genre5 = new Genre("Horror");
    Genre genre6 = new Genre("Fantasy");

    genreMovie?.add(genre1);
    genreMovie?.add(genre2);
    genreMovie?.add(genre3);
    genreMovie?.add(genre4);
    genreMovie?.add(genre5);
    genreMovie?.add(genre6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131216),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 40),

              Text("Favorite Movies", style: tsTitlePage),

              SizedBox(height: 20),

              listGenreHorizontal(),

              SizedBox(height: 5),

              listMovieVertical(),
            ],
          ),
        ),
      ),
    );
  }

  int selectedGenreIndex = 0;

  Widget listGenreHorizontal() {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: genreMovie?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = index == selectedGenreIndex;

          return InkWell(
            onTap: () {
              setState(() {
                selectedGenreIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFFF9900) : Color(0xFF222C4F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  genreMovie![index].genre,
                  style: TextStyle(
                    color: isSelected ? Color(0xFFFFFFFF) : Color(0xFFA4AECB),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Widget listMovieVertical() {
    return Container(
      child: ListView.builder(
        itemCount: favoriteMovie?.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 210,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 124,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(favoriteMovie![index].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      textMaxLines(textValue: favoriteMovie![index].title, textStyle: tsTitleListMovie, maxLines: 1),
                      Text(favoriteMovie![index].genre, style: tsGenreVertical),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(favoriteMovie![index].rating, style: tsDetail),
                          SizedBox(width: 4),
                          ratingBar(double.parse(favoriteMovie![index].rating)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(favoriteMovie![index].release, style: tsDetail),
                          SizedBox(width: 4),
                          SvgPicture.asset(iconCircleWhite),
                          SizedBox(width: 4),
                          Text(favoriteMovie![index].hour, style: tsDetail),
                        ],
                      ),
                      SizedBox(height: 10),
                      textMaxLines(textValue: favoriteMovie![index].description, textStyle: tsDescription, maxLines: 3),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}

