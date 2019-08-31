model wrapped "Wrapped model"
	// Input overwrite
	Modelica.Blocks.Interfaces.RealInput con_oveTSupSetCooCon_u(unit="K", min=285.15, max=291.15) "Supply air temperature setpoint for cooling";
	Modelica.Blocks.Interfaces.BooleanInput con_oveTSupSetCooCon_activate "Activation for Supply air temperature setpoint for cooling";
	Modelica.Blocks.Interfaces.RealInput con_oveTSetCoo_u(unit="K", min=296.15, max=303.15) "Zone temperature setpoint for cooling";
	Modelica.Blocks.Interfaces.BooleanInput con_oveTSetCoo_activate "Activation for Zone temperature setpoint for cooling";
	Modelica.Blocks.Interfaces.RealInput con_oveTSetHea_u(unit="K", min=288.15, max=296.15) "Zone temperature setpoint for heating";
	Modelica.Blocks.Interfaces.BooleanInput con_oveTSetHea_activate "Activation for Zone temperature setpoint for heating";
	Modelica.Blocks.Interfaces.RealInput con_oveTSetHeaCon_u(unit="K", min=303.15, max=313.15) "Supply air temperature setpoint for heating";
	Modelica.Blocks.Interfaces.BooleanInput con_oveTSetHeaCon_activate "Activation for Supply air temperature setpoint for heating";
	Modelica.Blocks.Interfaces.RealInput con_oveFan_u(unit="1", min=0.0, max=1.0) "Fan speed control signal";
	Modelica.Blocks.Interfaces.BooleanInput con_oveFan_activate "Activation for Fan speed control signal";
	// Out read
	Modelica.Blocks.Interfaces.RealOutput fcu_reaPFan_y(unit="W") = mod.fcu.reaPFan.y "Supply fan electrical power consumption";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaRetT_y(unit="K") = mod.fcu.reaRetT.y "Return air temperature";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaSupT_y(unit="K") = mod.fcu.reaSupT.y "Supply air temperature";
	Modelica.Blocks.Interfaces.RealOutput con_reaTSetHea_y(unit="K") = mod.con.reaTSetHea.y "Zone air temperature setpoint for heating";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaSupMas_y(unit="kg/s") = mod.fcu.reaSupMas.y "Supply air mass flowrate";
	Modelica.Blocks.Interfaces.RealOutput reaTRooAir_y(unit="K") = mod.reaTRooAir.y "Zone air temperature";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaPHea_y(unit="W") = mod.fcu.reaPHea.y "Heating thermal power consumption";
	Modelica.Blocks.Interfaces.RealOutput con_reaTSetCoo_y(unit="K") = mod.con.reaTSetCoo.y "Zone air temperature setpoint for cooling";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaPCoo_y(unit="W") = mod.fcu.reaPCoo.y "Cooling electrical power consumption";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaTSupSet_y(unit="K") = mod.fcu.reaTSupSet.y "Supply air temperature setpoint";
	Modelica.Blocks.Interfaces.RealOutput fcu_reaFan_y(unit="1") = mod.fcu.reaFan.y "Supply fan speed setpoint";
	// Original model
	BESTESTAir.TestCase mod(
		con.oveTSupSetCooCon(uExt(y=con_oveTSupSetCooCon_u),activate(y=con_oveTSupSetCooCon_activate)),
		con.oveTSetCoo(uExt(y=con_oveTSetCoo_u),activate(y=con_oveTSetCoo_activate)),
		con.oveTSetHea(uExt(y=con_oveTSetHea_u),activate(y=con_oveTSetHea_activate)),
		con.oveTSetHeaCon(uExt(y=con_oveTSetHeaCon_u),activate(y=con_oveTSetHeaCon_activate)),
		con.oveFan(uExt(y=con_oveFan_u),activate(y=con_oveFan_activate))) "Original model with overwrites";
end wrapped;