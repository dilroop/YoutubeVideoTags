import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOnSurface(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }
  TextStyle withSurface(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.surface);
  }

  TextStyle withOnBackground(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.onBackground);
  }

  TextStyle withBackground(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.background);
  }

  TextStyle withOnPrimary(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.onPrimary);
  }

  TextStyle withPrimary(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.primary);
  }

  TextStyle withOnSecondary(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.onSecondary);
  }
  TextStyle withSecondary(BuildContext context) {
    return this.copyWith(color: Theme.of(context).colorScheme.secondary);
  }

  TextStyle withSize(double size) => this.copyWith(fontSize: size);
}