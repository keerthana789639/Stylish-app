import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stylish_app/provider/productListing.dart';
import 'package:stylish_app/updateDetails.dart';

class Listingproducts extends StatefulWidget {
  const Listingproducts({super.key});

  @override
  State<Listingproducts> createState() => _ListingproductsState();
}

class _ListingproductsState extends State<Listingproducts> {
  Future<void> refresh() async {
  Provider.of<GetProducts>(context, listen: false).product_Api(context);
}
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Provider.of<GetProducts>(context, listen: false).product_Api(context);
  }

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<GetProducts>(context);
    return Scaffold(
      
      body: 
      RefreshIndicator(
        onRefresh: ()async {
          refresh();
        },
        child: ListView.builder(
          itemCount: provider.isdata.length,
          itemBuilder: (context, index) {
            final products = provider.isdata[index];
        
            return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(products.image),
        ),
        title: Text(
          products.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Important fix ✅
          children: [
            InkWell(
              onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              Updatedetails(productid: products,)
                            
                            ),
                          );
              },
              child: Icon(Icons.edit)),
            SizedBox(width: 8), // Space between icons ✅
            Icon(Icons.delete),
          ],
        ),
            );
          },
        ),
      ));

  }
}