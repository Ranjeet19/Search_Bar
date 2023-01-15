import 'package:flutter/material.dart';
import 'package:search_bar/model/movie_model.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  static List<MovieModel> main_movie_list = [
    MovieModel(
        "The Game Of Throne The Final Battle..",
        2018,
        "https://cdn.colombia.com/sdi/2022/09/21/game-of-thrones-final-decepcion-emilia-clarke-daenerys-targaryen-hbo-1068276.jpg",
        9.9),
    MovieModel("Pathaan, Srk Movie ", 2023,
        "https://i.ytimg.com/vi/lN5oSl9qsN4/maxresdefault.jpg", 9.8),
    MovieModel("Ek Tha Tiger..", 2016,
        "https://i.ytimg.com/vi/P36E2gR8wU4/maxresdefault.jpg", 4),
    MovieModel("Avenger The End Game...", 2018,
        "https://i.ytimg.com/vi/ePpJDKfRAyM/movieposter.jpg", 9.8),
    MovieModel(
        "URi the Surgical Strike.",
        2015,
        "https://upload.wikimedia.org/wikipedia/en/3/3b/URI_-_New_poster.jpg",
        7.8),
    MovieModel(
        "Avataar The way of water..",
        2022,
        "https://m.media-amazon.com/images/M/MV5BYjhiNjBlODctY2ZiOC00YjVlLWFlNzAtNTVhNzM1YjI1NzMxXkEyXkFqcGdeQXVyMjQxNTE1MDA@._V1_FMjpg_UX1000_.jpg",
        9.8),
  ];

  List<MovieModel> display_list = List.from(main_movie_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movie_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1f1545),
        appBar: AppBar(
          backgroundColor: Color(0xFF1f1545),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Search For a Movie..",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                
                  fillColor: Color(0xff302360),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Eg: The Dark Knight...",
                  hintStyle: TextStyle(color: Colors.white),
                    
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                
              ),
              SizedBox(height: 20),
              Expanded(
                child: display_list.length == 0
                    ? Center(
                        child: Text(
                          "No result Found !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: display_list.length,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.all(8),
                          title: Text(
                            display_list[index].movie_title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${display_list[index].movie_release_year!}',
                            style: TextStyle(color: Colors.white60),
                          ),
                          trailing: Text(
                            '${display_list[index].rating!}',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                          leading: Image.network(
                              display_list[index].movie_poster_url!),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
