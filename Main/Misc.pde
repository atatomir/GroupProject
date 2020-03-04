float sizeToMatch(String txt, float width, float height) {
  textSize(1);
  float ratio1 = width / textWidth(txt);
  float ratio2 = height / (textAscent() + textDescent());
  float textSize = min(ratio1, ratio2) * 0.7;
  return max(1, textSize);
}
