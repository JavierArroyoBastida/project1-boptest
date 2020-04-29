model wrapped "Wrapped model"
	// Input overwrite
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_overwriteInteger_overwrite_u(unit="1", min=0.0, max=1.0) "TABS pump signal";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_overwriteInteger_overwrite_activate "Activation for TABS pump signal";
	Modelica.Blocks.Interfaces.RealInput buiCon_ahuCon_overwrite_u(unit="K", min=288.15, max=297.15) "AHU supply temperature set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ahuCon_overwrite_activate "Activation for AHU supply temperature set-point";
	Modelica.Blocks.Interfaces.RealInput buiCon_overwriteBoolean1_overwrite_u(unit="1", min=0.0, max=1.0) "Neutral mode boolean";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_overwriteBoolean1_overwrite_activate "Activation for Neutral mode boolean";
	Modelica.Blocks.Interfaces.RealInput buiCon_hpCon_hpCon_overwrite_u(unit="K", min=293.15, max=323.15) "HP set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_hpCon_hpCon_overwrite_activate "Activation for HP set-point";
	Modelica.Blocks.Interfaces.RealInput buiCon_ctCon_overwriteBoolean2_overwrite_u(unit="1", min=0.0, max=1.0) "Heat dissipattion boolean";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ctCon_overwriteBoolean2_overwrite_activate "Activation for Heat dissipattion boolean";
	Modelica.Blocks.Interfaces.RealInput buiCon_overwriteBoolean_overwrite_u(unit="1", min=0.0, max=1.0) "Heating mode boolean";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_overwriteBoolean_overwrite_activate "Activation for Heating mode boolean";
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_threeWayTABSCon_overwrite_u(unit="K", min=293.15, max=313.15) "TABS supply heating temperature";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_threeWayTABSCon_overwrite_activate "Activation for TABS supply heating temperature";
	Modelica.Blocks.Interfaces.RealInput buiCon_ctCon_cooTowCon_overwrite_u(unit="K", min=288.15, max=323.15) "Cooling tower leaving water temperature set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ctCon_cooTowCon_overwrite_activate "Activation for Cooling tower leaving water temperature set-point";
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_p5Con_overwrite_u(unit="K", min=289.15, max=297.15) "TABS supply cooling temperature";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_p5Con_overwrite_activate "Activation for TABS supply cooling temperature";
	Modelica.Blocks.Interfaces.RealInput buiCon_ahuCon_overwrite1_u(unit="1", min=0.0, max=1.0) "AHU recovery by-pass";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ahuCon_overwrite1_activate "Activation for AHU recovery by-pass";
	Modelica.Blocks.Interfaces.RealInput buiCon_ahuCon_overwrite3_u(unit="Pa", min=0.0, max=300.0) "AHU supply differential pressure";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ahuCon_overwrite3_activate "Activation for AHU supply differential pressure";
	Modelica.Blocks.Interfaces.RealInput buiCon_ahuCon_overwrite2_u(unit="Pa", min=0.0, max=300.0) "AHU supply differential pressure";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ahuCon_overwrite2_activate "Activation for AHU supply differential pressure";
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA1Con_overwrite_u(unit="K", min=-5.0, max=5.0) "TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA1Con_overwrite_activate "Activation for TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA0Con_overwrite_u(unit="K", min=-5.0, max=5.0) "TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA0Con_overwrite_activate "Activation for TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.RealInput buiCon_hpCon_p3Con_overwrite_u(unit="Pa", min=0.0, max=120000.0) "condenser pump pressure difference";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_hpCon_p3Con_overwrite_activate "Activation for condenser pump pressure difference";
	Modelica.Blocks.Interfaces.RealInput buiCon_overwriteBoolean2_overwrite_u(unit="1", min=0.0, max=1.0) "Cooling mode boolean";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_overwriteBoolean2_overwrite_activate "Activation for Cooling mode boolean";
	Modelica.Blocks.Interfaces.RealInput buiCon_sunSha_overwrite1_u(unit="1", min=0.0, max=1.0) "Shading control of 2nd floor east windows";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_sunSha_overwrite1_activate "Activation for Shading control of 2nd floor east windows";
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA2Con_overwrite_u(unit="K", min=-5.0, max=5.0) "TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA2Con_overwrite_activate "Activation for TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.RealInput buiCon_sunSha_overwrite3_u(unit="1", min=0.0, max=1.0) "Shading control of south windows";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_sunSha_overwrite3_activate "Activation for Shading control of south windows";
	Modelica.Blocks.Interfaces.RealInput buiCon_sunSha_overwrite2_u(unit="1", min=0.0, max=1.0) "Shading control of south windows";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_sunSha_overwrite2_activate "Activation for Shading control of south windows";
	Modelica.Blocks.Interfaces.RealInput buiCon_hpCon_hpCon_overwriteInteger_overwrite_u(unit="1", min=0.0, max=1.0) "HP1 pump signal";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_hpCon_hpCon_overwriteInteger_overwrite_activate "Activation for HP1 pump signal";
	Modelica.Blocks.Interfaces.RealInput buiCon_sunSha_overwrite_u(unit="1", min=0.0, max=1.0) "Shading control of 3rd floor east windows";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_sunSha_overwrite_activate "Activation for Shading control of 3rd floor east windows";
	Modelica.Blocks.Interfaces.RealInput buiCon_hpCon_hpCon_overwriteInteger1_overwrite_u(unit="1", min=0.0, max=1.0) "HP2 pump signal";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_hpCon_hpCon_overwriteInteger1_overwrite_activate "Activation for HP2 pump signal";
	Modelica.Blocks.Interfaces.RealInput buiCon_hpCon_p1Con_overwrite_u(unit="1", min=0.0, max=1.0) "evaporator pump speed";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_hpCon_p1Con_overwrite_activate "Activation for evaporator pump speed";
	Modelica.Blocks.Interfaces.RealInput buiCon_ctCon_overwriteBoolean1_overwrite_u(unit="1", min=0.0, max=1.0) "Relief borefield load boolean";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_ctCon_overwriteBoolean1_overwrite_activate "Activation for Relief borefield load boolean";
	Modelica.Blocks.Interfaces.RealInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA3Con_overwrite_u(unit="K", min=-5.0, max=5.0) "TABS temperature difference set-point";
	Modelica.Blocks.Interfaces.BooleanInput buiCon_tabsCon_twoWayTABSCon_twoWayCCA3Con_overwrite_activate "Activation for TABS temperature difference set-point";
	// Out read
	Modelica.Blocks.Interfaces.RealOutput heaSys_heaPumPow2_y(unit="W") = mod.heaSys.heaPumPow2.y "Power of heat pump 2";
	Modelica.Blocks.Interfaces.RealOutput heaSys_heaPumPow1_y(unit="W") = mod.heaSys.heaPumPow1.y "Power of heat pump 1";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow11_y(unit="W") = mod.heaSys.pumPow11.y "Power of hydraulic pump 11";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow10_y(unit="W") = mod.heaSys.pumPow10.y "Power of hydraulic pump 10";
	Modelica.Blocks.Interfaces.RealOutput heaSys_cooTowPow_y(unit="W") = mod.heaSys.cooTowPow.y "Power of the cooling tower";
	Modelica.Blocks.Interfaces.RealOutput venSys_fanPowExh_y(unit="W") = mod.venSys.fanPowExh.y "Power of AHU exhaust fan";
	Modelica.Blocks.Interfaces.RealOutput venSys_pumPow9_y(unit="W") = mod.venSys.pumPow9.y "Power of hydraulic pump 9";
	Modelica.Blocks.Interfaces.RealOutput venSys_pumPow6_y(unit="W") = mod.venSys.pumPow6.y "Power of hydraulic pump 6";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow1_y(unit="W") = mod.heaSys.pumPow1.y "Power of hydraulic pump 1";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow3_y(unit="W") = mod.heaSys.pumPow3.y "Power of hydraulic pump 3";
	Modelica.Blocks.Interfaces.RealOutput buiEnv_fanPowExt_y(unit="W") = mod.buiEnv.fanPowExt.y "Power of toilet extraction fan";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow5_y(unit="W") = mod.heaSys.pumPow5.y "Power of hydraulic pump 5";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow4_y(unit="W") = mod.heaSys.pumPow4.y "Power of hydraulic pump 4";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow7_y(unit="W") = mod.heaSys.pumPow7.y "Power of hydraulic pump7 ";
	Modelica.Blocks.Interfaces.RealOutput venSys_fanPowSup_y(unit="W") = mod.venSys.fanPowSup.y "Power of AHU supply fan";
	Modelica.Blocks.Interfaces.RealOutput heaSys_pumPow8_y(unit="W") = mod.heaSys.pumPow8.y "Power of hydraulic pump 8";
	Modelica.Blocks.Interfaces.RealOutput venSys_pumPow13_y(unit="W") = mod.venSys.pumPow13.y "Power of hydraulic pump 13";
	// Original model
	INFRAX.IBPSA_BOPTEST mod(
		buiCon.tabsCon.overwriteInteger.overwrite(uExt(y=buiCon_tabsCon_overwriteInteger_overwrite_u),activate(y=buiCon_tabsCon_overwriteInteger_overwrite_activate)),
		buiCon.ahuCon.overwrite(uExt(y=buiCon_ahuCon_overwrite_u),activate(y=buiCon_ahuCon_overwrite_activate)),
		buiCon.overwriteBoolean1.overwrite(uExt(y=buiCon_overwriteBoolean1_overwrite_u),activate(y=buiCon_overwriteBoolean1_overwrite_activate)),
		buiCon.hpCon.hpCon.overwrite(uExt(y=buiCon_hpCon_hpCon_overwrite_u),activate(y=buiCon_hpCon_hpCon_overwrite_activate)),
		buiCon.ctCon.overwriteBoolean2.overwrite(uExt(y=buiCon_ctCon_overwriteBoolean2_overwrite_u),activate(y=buiCon_ctCon_overwriteBoolean2_overwrite_activate)),
		buiCon.overwriteBoolean.overwrite(uExt(y=buiCon_overwriteBoolean_overwrite_u),activate(y=buiCon_overwriteBoolean_overwrite_activate)),
		buiCon.tabsCon.threeWayTABSCon.overwrite(uExt(y=buiCon_tabsCon_threeWayTABSCon_overwrite_u),activate(y=buiCon_tabsCon_threeWayTABSCon_overwrite_activate)),
		buiCon.ctCon.cooTowCon.overwrite(uExt(y=buiCon_ctCon_cooTowCon_overwrite_u),activate(y=buiCon_ctCon_cooTowCon_overwrite_activate)),
		buiCon.tabsCon.p5Con.overwrite(uExt(y=buiCon_tabsCon_p5Con_overwrite_u),activate(y=buiCon_tabsCon_p5Con_overwrite_activate)),
		buiCon.ahuCon.overwrite1(uExt(y=buiCon_ahuCon_overwrite1_u),activate(y=buiCon_ahuCon_overwrite1_activate)),
		buiCon.ahuCon.overwrite3(uExt(y=buiCon_ahuCon_overwrite3_u),activate(y=buiCon_ahuCon_overwrite3_activate)),
		buiCon.ahuCon.overwrite2(uExt(y=buiCon_ahuCon_overwrite2_u),activate(y=buiCon_ahuCon_overwrite2_activate)),
		buiCon.tabsCon.twoWayTABSCon.twoWayCCA1Con.overwrite(uExt(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA1Con_overwrite_u),activate(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA1Con_overwrite_activate)),
		buiCon.tabsCon.twoWayTABSCon.twoWayCCA0Con.overwrite(uExt(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA0Con_overwrite_u),activate(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA0Con_overwrite_activate)),
		buiCon.hpCon.p3Con.overwrite(uExt(y=buiCon_hpCon_p3Con_overwrite_u),activate(y=buiCon_hpCon_p3Con_overwrite_activate)),
		buiCon.overwriteBoolean2.overwrite(uExt(y=buiCon_overwriteBoolean2_overwrite_u),activate(y=buiCon_overwriteBoolean2_overwrite_activate)),
		buiCon.sunSha.overwrite1(uExt(y=buiCon_sunSha_overwrite1_u),activate(y=buiCon_sunSha_overwrite1_activate)),
		buiCon.tabsCon.twoWayTABSCon.twoWayCCA2Con.overwrite(uExt(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA2Con_overwrite_u),activate(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA2Con_overwrite_activate)),
		buiCon.sunSha.overwrite3(uExt(y=buiCon_sunSha_overwrite3_u),activate(y=buiCon_sunSha_overwrite3_activate)),
		buiCon.sunSha.overwrite2(uExt(y=buiCon_sunSha_overwrite2_u),activate(y=buiCon_sunSha_overwrite2_activate)),
		buiCon.hpCon.hpCon.overwriteInteger.overwrite(uExt(y=buiCon_hpCon_hpCon_overwriteInteger_overwrite_u),activate(y=buiCon_hpCon_hpCon_overwriteInteger_overwrite_activate)),
		buiCon.sunSha.overwrite(uExt(y=buiCon_sunSha_overwrite_u),activate(y=buiCon_sunSha_overwrite_activate)),
		buiCon.hpCon.hpCon.overwriteInteger1.overwrite(uExt(y=buiCon_hpCon_hpCon_overwriteInteger1_overwrite_u),activate(y=buiCon_hpCon_hpCon_overwriteInteger1_overwrite_activate)),
		buiCon.hpCon.p1Con.overwrite(uExt(y=buiCon_hpCon_p1Con_overwrite_u),activate(y=buiCon_hpCon_p1Con_overwrite_activate)),
		buiCon.ctCon.overwriteBoolean1.overwrite(uExt(y=buiCon_ctCon_overwriteBoolean1_overwrite_u),activate(y=buiCon_ctCon_overwriteBoolean1_overwrite_activate)),
		buiCon.tabsCon.twoWayTABSCon.twoWayCCA3Con.overwrite(uExt(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA3Con_overwrite_u),activate(y=buiCon_tabsCon_twoWayTABSCon_twoWayCCA3Con_overwrite_activate))) "Original model with overwrites";
end wrapped;