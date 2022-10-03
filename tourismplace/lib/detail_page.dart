import 'package:flutter/material.dart';
import 'package:wisata/tourism_place.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final TourismPlace tourism;

  const DetailPage({Key? key, required this.tourism}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("${widget.tourism.name}"),

        backgroundColor: Colors.black,
        actions: [
        ],
      ),
      body: Column(
        children: [

          Container(
            padding: EdgeInsets.all(12),
            height: (MediaQuery
                .of(context)
                .size
                .height) / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(widget.tourism.imageUrls[index]),
                );
              },
              itemCount: widget.tourism.imageUrls.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textBesar(widget.tourism.name),
                SizedBox(height: 10,),
                Container(
                  height: 35,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: int.parse(widget.tourism.stars),
                    itemBuilder: (BuildContext context, int index) =>
                        Icon(Icons.star, color: Colors.yellowAccent,),
                  ),
                ),
                textBesar(widget.tourism.location),
                SizedBox(height: 10,),
                textBesar("Harga Tiket per orang : " + widget.tourism.ticketPrice),
                SizedBox(height: 10,),
                SizedBox(
                  height: (MediaQuery.of(context).size.height)/10,
                  width: (MediaQuery.of(context).size.width),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.tourism.facility.length,
                    ),
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Icon(IconData(int.parse(widget.tourism.iconFacility[index] ),fontFamily: 'MaterialIcons'), color: Colors.white),
                          textSedang(widget.tourism.facility[index])
                        ],
                      );
                    },
                    itemCount: widget.tourism.facility.length,
                  ),
                ),
                Container(
                  child: ElevatedButton(

                    onPressed: () {
                      _launchURL(widget.tourism.websiteLink);
                    },
                    child: Text("Halaman Website"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget textBesar(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

}