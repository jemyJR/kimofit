enum WeightType { freeWeights, plateWeights }

List<double> getWeights(WeightType weightType) {
  switch (weightType) {
    case WeightType.freeWeights:
      return List<double>.generate(20, (index) => (index + 1) * 2.5);

    case WeightType.plateWeights:
      return List<double>.generate(29, (index) => 1.0 + (index * 0.5));
    default:
      return [];
  }
}
