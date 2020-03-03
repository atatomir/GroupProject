/* Action: a class that contains an action to be executed */
class Action {
  void apply() {
    // I am an empty action
  }
}

// some examples of action
class RestartViewAction extends Action {
  View target;
  
  RestartViewAction(View view) {
    target = view;
  }
  
  void apply() {
    target.setupView();
  }
}

class IncreaseWeightAction extends Action {
  View target;
  float value;
  
  IncreaseWeightAction(View view, float value) {
    target = view;
    this.value = value;
  }
  
  void apply() {
    target.changeWeight(target.viewWeight + value);
  }
}

class HideAction extends Action {
  View t1, t2; 
  int val = 0;
  
  HideAction(View t1, View t2) {
    this.t1 = t1;
    this.t2 = t2;
  }
  
  void apply() {
    val = (val + 1) & 3;
    t1.setHidden(boolean(val & 1));
    t2.setHidden(boolean(val & 2));
  }
}
