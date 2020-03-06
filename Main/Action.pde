/* Action: a class that contains an action to be executed */
class Action {
  void apply() {
    // I am an empty action
  }
}

// some examples of action
class KillViewAction extends Action {
  View target;
  
  KillViewAction (PopupView view) {
    target = view;
  }
  
  void apply() {
    target.kill();
  }
}

class CreateGraphPopupAction extends Action {
  View parent;
  int points;
  float[] dataX;
  float[] dataY;
  
  CreateGraphPopupAction(View parent, int points, float[] dataX, float[] dataY) {
    this.parent = parent;
    this.points = points;
    this.dataX = dataX;
    this.dataY = dataY;
  }
  
  void apply() {
     GraphView graph = new GraphView(points, dataX, dataY, 1);
     graph.setLabels("Height", "Bushiness", "Bushy?");
     PopupView popup = new PopupView(50, 50, parent.width - 100, parent.height - 100, graph);
     popup.setStroke(color(100, 0, 0));
     parent.addSubview(popup);
  }
}


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
