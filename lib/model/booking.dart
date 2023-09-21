import 'package:ekam/Helpers/get_random_doc_image.dart';

class Booking {
  String? bookingId;
  String? doctorName;
  String? location;
  String? appointmentDate;
  String? appointmentTime;
  String? image;

  Booking(
      {this.bookingId,
      this.doctorName,
      this.location,
      this.appointmentDate,
      this.appointmentTime});

  Booking.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    doctorName = json['doctor_name'];
    location = json['location'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    image = json['image'] ?? getRandomDocImage();
  }
}
