// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class VehicleImagesCard {
  final String carId;
  final List<Card> cars;
  VehicleImagesCard({
    required this.carId,
    required this.cars,
  });
  

  VehicleImagesCard copyWith({
    String? carId,
    List<Card>? cars,
  }) {
    return VehicleImagesCard(
      carId: carId ?? this.carId,
      cars: cars ?? this.cars,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'car_id': carId,
      'cars': cars.map((x) => x.toMap()).toList(),
    };
  }

  factory VehicleImagesCard.fromMap(Map<String, dynamic> map) {
    return VehicleImagesCard(
      carId: map['car_id'] as String,
      cars: List<Card>.from((map['cars'] as List<int>).map<Card>((x) => Card.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleImagesCard.fromJson(String source) => VehicleImagesCard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VehicleImagesCard(carId: $carId, cars: $cars)';

  @override
  bool operator ==(covariant VehicleImagesCard other) {
    if (identical(this, other)) return true;
  
    return 
      other.carId == carId &&
      listEquals(other.cars, cars);
  }

  @override
  int get hashCode => carId.hashCode ^ cars.hashCode;
}

class Card {
  final String image;
  final String image_name;
  Card({
    required this.image,
    required this.image_name,
  });

  Card copyWith({
    String? image,
    String? image_name,
  }) {
    return Card(
      image: image ?? this.image,
      image_name: image_name ?? this.image_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'image_name': image_name,
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      image: map['image'] as String,
      image_name: map['image_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) => Card.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Card(image: $image, image_name: $image_name)';

  @override
  bool operator ==(covariant Card other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image &&
      other.image_name == image_name;
  }

  @override
  int get hashCode => image.hashCode ^ image_name.hashCode;
}

class VehicleImagesCardResponse {
  final String data;

  VehicleImagesCardResponse({required this.data,});

  factory VehicleImagesCardResponse.fromJson(Map<String, dynamic> json) {
    return VehicleImagesCardResponse(
      data: json['data'] ?? '',
    );
  }

  VehicleImagesCardResponse copyWith({
    String? data,
  }) {
    return VehicleImagesCardResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory VehicleImagesCardResponse.fromMap(Map<String, dynamic> map) {
    return VehicleImagesCardResponse(
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'VehicleImagesCardResponse(data: $data)';

  @override
  bool operator ==(covariant VehicleImagesCardResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
