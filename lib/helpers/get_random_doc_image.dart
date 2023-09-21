// define all the images that will be used in the app
import 'dart:math';

List<String> docProfileImages = [
  'assets/images/doc_pr_1.jpg',
  'assets/images/doc_pr_2.jpg',
  'assets/images/doc_pr_3.jpg',
  'assets/images/doc_pr_4.jpg',
  'assets/images/doc_pr_5.jpg',
];

//function to get a random image from the list
String getRandomDocImage() {
  return docProfileImages[Random().nextInt(docProfileImages.length)];
}