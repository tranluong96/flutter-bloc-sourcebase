abstract class TemplateState {}

class TemplateInitial extends TemplateState {}

class TemplateStateActive extends TemplateState {
  final bool isActive;
  TemplateStateActive(this.isActive);
}

// TemplateState do something else
// class TemplateStateDoSomethingElse extends TemplateState {
// }
