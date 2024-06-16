class GraphTargetBand {
  final double maxTargetBand;
  final double minTargetBand;
  final double interpolationValue;

  const GraphTargetBand({
    this.maxTargetBand = 160.0,
    this.minTargetBand = 90.0,
    this.interpolationValue = 5.0,
  });
}
