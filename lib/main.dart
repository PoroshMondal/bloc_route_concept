import 'package:flutter/material.dart';

import 'route_access/anonymous_route_access/anonymous_route_app.dart';
import 'route_access/named_route_access/named_route_app.dart';
import 'route_access/generated_route_access/generated_route_app.dart';
import 'route_access/global_route_access/global_access_route_app.dart';

void main() {
  //runApp(const AnonymousRouteApp());
  //runApp(NamedRouteApp());
  //runApp(const GeneratedRouteApp());
  runApp(GlobalAccessRouteApp());
}

