class Movie {
  late String title;
  late String genre;
  late String rating;
  late String release;
  late String hour;
  late String description;
  late String image;

  Movie(String title, String genre, String rating, String release, String hour, String description, String image){
    this.title = title;
    this.genre = genre;
    this.rating = rating;
    this.release = release;
    this.hour = hour;
    this.description = description;
    this.image = image;
  }
}