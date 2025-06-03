import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/pages/template/bloc/template_state.dart';
import 'package:my_app/pages/template/bloc/template_event.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  TemplateBloc() : super(TemplateInitial()) {
    on<TemplateStarted>((event, emit) {
      emit(TemplateInitial());
    });



    on<TemplateEventActive>((event, emit) {
      emit(TemplateStateActive(event.isActive));
    });


    // Handler other event
    // on<Event>((event, emit) {
    //   Do something
    // });
  }
}
