#!/bin/bash
flutter pub run easy_localization:generate -S assets/locales
flutter pub run easy_localization:generate -S assets/locales -f keys -o locale_keys.g.dart