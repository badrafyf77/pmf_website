double calculateMatchesPercentage(int totalMatches, int matches) {
  if (totalMatches == 0) {
    return 0.0; 
  }
  return (matches / totalMatches) * 100;
}