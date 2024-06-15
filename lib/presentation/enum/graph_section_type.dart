enum GraphSectionType {
  target,
  belowTarget,
  aboveTarget,
  belowToTarget,
  targetToAbove,
  aboveToTarget,
  targetToBelow,
}

extension GraphSectionTypeX on GraphSectionType {
  bool get isTarget => this == GraphSectionType.target;

  bool get isBelowTarget => this == GraphSectionType.belowTarget;

  bool get isAboveTarget => this == GraphSectionType.aboveTarget;

  bool get isBelowToTarget => this == GraphSectionType.belowToTarget;

  bool get isTargetToAbove => this == GraphSectionType.targetToAbove;

  bool get isAboveToTarget => this == GraphSectionType.aboveToTarget;

  bool get isTargetToBelow => this == GraphSectionType.targetToBelow;

  bool get needGradient => isAboveToTarget || isBelowToTarget || isTargetToAbove || isTargetToBelow;
}

