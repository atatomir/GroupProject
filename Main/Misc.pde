float sizeToMatch(String txt, float width, float height) {
  textSize(1);
  float ratio1 = width / textWidth(txt);
  float ratio2 = height / (textAscent() + textDescent());
  float textSize = min(ratio1, ratio2) * 0.7;
  return max(1, textSize);
}

float pointBetween(float x, float y, float proc) {
  return x * (1 - proc) + y * proc;
}

float getRatio(float x0, float x1, float x2) {
  return (x1 - x0) / (x2 - x0); 
}

void transText(String label, float x, float y, float rot, float scaleX, float scaleY) {
  pushMatrix();
  translate(x, y);
  rotate(rot);
  scale(scaleX, scaleY);
  text(label, 0, 0);
  popMatrix();
}
