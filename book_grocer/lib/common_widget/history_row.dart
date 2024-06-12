import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../common/color_extenstion.dart';
import '../view/wishlist/wishlist_manager.dart';

class HistoryRow extends StatelessWidget {
  final Map<String, dynamic> sObj;
  final Function(Map<String, dynamic>) addToCart;
  final Function(Map<String, dynamic>) addToWishlist;

  const HistoryRow({
    super.key,
    required this.sObj,
    required this.addToCart,
    required this.addToWishlist,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(sObj["img"].toString(),
                width: media.width * 0.25,
                height: media.width * 0.25 * 1.6,
                fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  sObj["name"].toString(),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  sObj["author"].toString(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                //Rating Bar :stars
                RatingBar.builder(
                  initialRating: sObj["rate"] as double? ?? 0.0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: TColor.primary),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 8),
                Text(
                  sObj["description"].toString(),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.subTitle,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => addToCart(sObj),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: TColor.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Text("Add to Cart"),
                    ),
                    const SizedBox(width: 10),
                    Consumer<WishlistManager>(
                      builder: (context, wishlistManager, child) {
                        final isInWishlist = wishlistManager.wishlist
                            .any((item) => item['name'] == sObj['name']);
                        return IconButton(
                          onPressed: () {
                            if (isInWishlist) {
                              wishlistManager.removeFromWishlist(sObj);
                            } else {
                              wishlistManager.addToWishlist(sObj);
                            }
                          },
                          icon: Icon(
                            isInWishlist
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: TColor.primary,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
