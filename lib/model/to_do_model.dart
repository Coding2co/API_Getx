//  ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoList {
  int? code;
  bool? success;
  int? timestamp;
  String? message;
  Data? data;
  List<Data>? dataList;
 


  TodoList({this.code, this.success, this.timestamp, this.message, this.data});

   TodoList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    timestamp = json['timestamp'];
    message = json['message'];
    if (json['items'] != null && json['items'].isNotEmpty) {
      data = Data.fromJson(json['items'][0]); // Assuming there's only one item
      debugPrint("Description: ${data?.title}");
    }

  }
  
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
      
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['is_completed'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      '_id': id,
      'title': title,
      'description': description,
      'is_completed': isCompleted,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    return data;
  }
}




























 









