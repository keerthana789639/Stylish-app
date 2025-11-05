import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/items.dart';

class Search extends StatefulWidget {
  final List filter;

  const Search({super.key, required this.filter});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  
  TextEditingController searchcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchcontroller.addListener(filteritems);
  }

  List filterproducts = [];           // All filtered products to pass
List filterUniqueHashtags = [];     // Only unique items for ListView

void filteritems() {
  setState(() {
    String query = searchcontroller.text.trim().toLowerCase();

    if (query.isEmpty) {
      filterproducts = [];
      filterUniqueHashtags = [];
      return;
    }

    // ✅ Take all matching products
    filterproducts = widget.filter.where((item) {
      return item.hashtag.toString().toLowerCase().startsWith(query);
    }).toList();

    // ✅ Build unique hashtag list for showing in UI
    final uniqueMap = <String, dynamic>{};
    for (var item in filterproducts) {
      uniqueMap[item.hashtag.toLowerCase()] = item;
    }
    filterUniqueHashtags = uniqueMap.values.toList();

    // ✅ Sorting only UI list
    filterUniqueHashtags.sort(
      (a, b) => a.hashtag.toLowerCase().compareTo(b.hashtag.toLowerCase()),
    );
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: Column(
          children: [
            TextFormField(
              controller: searchcontroller, // ✅ Fixed controller
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search by product",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
              ),
            ),

  
            SizedBox(height: 10),

            Expanded(
              // ✅ Wrapped ListView inside Expanded
              child: ListView.builder(
             //   itemCount: filterproducts.length,
                itemCount:  filterUniqueHashtags.length,
                itemBuilder: (context, index) {
                    var selectedHashtag = filterUniqueHashtags[index].hashtag;
                  return InkWell(
                    onTap: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Items(productList: filterhashtags,)));
                 var resultProducts = filterproducts.where((item) =>
            item.hashtag.toLowerCase() ==
            selectedHashtag.toString().toLowerCase()).toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Items(productList: resultProducts),
          ),
        );
                
                    },
                    child: ListTile(
                     // title: Text(filterproducts[index].hashtag.toString()),
                      title: Text(selectedHashtag.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
