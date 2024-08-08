int setNumberOfElementsInAppbarDropdown(double width) {
  if (width <= 1060) {
    return 2;
  } else if (width <= 1220) {
    return 1;
  }
  return 0;
}