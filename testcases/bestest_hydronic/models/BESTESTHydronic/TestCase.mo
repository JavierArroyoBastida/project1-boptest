within BESTESTHydronic;
model TestCase "Single zone residential hydronic example model"
  extends IDEAS.Examples.IBPSA.SingleZoneResidentialHydronic(
    TSetExt(u(
        min=273.15 + 20,
        max=273.15 + 80,
        unit="K")),
    outputQ(y(unit="W")),
    outputT(y(unit="K")),
    outputP(y(unit="W")),
    pumSetExt(y(unit="W")));
  annotation (experiment(StopTime=604800));
end TestCase;
