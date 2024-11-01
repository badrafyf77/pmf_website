// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void storeId(String id) {
  html.window.localStorage['id'] = id;
}

String? getId() {
  return html.window.localStorage['id'];
}

void removeId() {
  html.window.localStorage.remove('id');
}
