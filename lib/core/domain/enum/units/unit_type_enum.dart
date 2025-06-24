enum UnitTypeEnum {
  oneBr,
  twoBr,
  threeBr,
  fourBr,
  oneBrEnsuite,
  twoBrEnsuite,
  bedsitter,
  studio,
  airBnB,
  mansion,
}

String unitTypeToReadableString({required UnitTypeEnum unitType}) {
  switch (unitType) {
    case UnitTypeEnum.oneBr:
      return "1 Bedroom";
    case UnitTypeEnum.twoBr:
      return "2 Bedroom";
    case UnitTypeEnum.threeBr:
      return "3 Bedroom";
    case UnitTypeEnum.fourBr:
      return "4 Bedroom";
    case UnitTypeEnum.oneBrEnsuite:
      return "1 Bedroom Ensuite";
    case UnitTypeEnum.twoBrEnsuite:
      return "2 Bedroom Ensuite";
    case UnitTypeEnum.bedsitter:
      return "Bedsitter";
    case UnitTypeEnum.studio:
      return "Studio";
    case UnitTypeEnum.airBnB:
      return "AirBnB";
    case UnitTypeEnum.mansion:
      return "Mansion";
  }
}

UnitTypeEnum unitTypeFromString({required String unitType}) {
  switch (unitType) {
    case "1 Bedroom":
      return UnitTypeEnum.oneBr;
    case "2 Bedroom":
      return UnitTypeEnum.twoBr;
    case "3 Bedroom":
      return UnitTypeEnum.threeBr;
    case "4 Bedroom":
      return UnitTypeEnum.fourBr;
    case "1 Bedroom Ensuite":
      return UnitTypeEnum.oneBrEnsuite;
    case "2 Bedroom Ensuite":
      return UnitTypeEnum.twoBrEnsuite;
    case "Bedsitter":
      return UnitTypeEnum.bedsitter;
    case "Studio":
      return UnitTypeEnum.studio;
    case "AirBnB":
      return UnitTypeEnum.airBnB;
    case "Mansion":
      return UnitTypeEnum.mansion;
    default:
      return UnitTypeEnum.oneBr;
  }
}
