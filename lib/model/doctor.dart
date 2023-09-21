
import 'package:ekam/helpers/get_random_doc_image.dart';

class Doctor {
  final String doctorName;
  final String image;
  final String fallBackUrl;
  final String speciality;
  final String location;
  final int patientsServed;
  final int yearsOfExperience;
  final double rating;
  final int numberOfReviews;
  final Map<String, List<dynamic>> availability;

  Doctor({
    required this.doctorName,
    required this.image,
    required this.fallBackUrl,
    required this.speciality,
    required this.location,
    required this.patientsServed,
    required this.yearsOfExperience,
    required this.rating,
    required this.numberOfReviews,
    required this.availability,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      doctorName: json['doctor_name'],
      image: json['image'],
      fallBackUrl: getRandomDocImage(),
      speciality: json['speciality'],
      location: json['location'],
      patientsServed: json['patients_served'],
      yearsOfExperience: json['years_of_experience'],
      rating: json['rating'],
      numberOfReviews: json['number_of_reviews'],
      availability: Map<String, List<dynamic>>.from(json['availability']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_name': doctorName,
      'image': image,
      'fallBackUrl': fallBackUrl,
      'speciality': speciality,
      'location': location,
      'patients_served': patientsServed,
      'years_of_experience': yearsOfExperience,
      'rating': rating,
      'number_of_reviews': numberOfReviews,
      'availability': availability,
    };
  }

  Doctor copyWith({
    String? doctorName,
    String? image,
    String? fallBackUrl,
    String? speciality,
    String? location,
    int? patientsServed,
    int? yearsOfExperience,
    double? rating,
    int? numberOfReviews,
    Map<String, List<String>>? availability,
  }) {
    return Doctor(
      doctorName: doctorName ?? this.doctorName,
      image: image ?? this.image,
      fallBackUrl: fallBackUrl ?? this.fallBackUrl,
      speciality: speciality ?? this.speciality,
      location: location ?? this.location,
      patientsServed: patientsServed ?? this.patientsServed,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
      rating: rating ?? this.rating,
      numberOfReviews: numberOfReviews ?? this.numberOfReviews,
      availability: availability ?? this.availability,
    );
  }
}
