abstract class TemplateEvent {}

class TemplateStarted extends TemplateEvent {}

class TemplateEventActive extends TemplateEvent {
  final bool isActive;
  TemplateEventActive(this.isActive);
}

// Event do something else
// class EventDoSomethingElse extends TemplateEvent {
// Do something else
// }
