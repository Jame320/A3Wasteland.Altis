//	@file Version: 1.2
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19

{ [player, _x] call fn_addManagedAction } forEach
[
	//Holster+Unholster
	["Holster Weapon", "player action ['SwitchWeapon', player, player, 100];", [], -11, false, false, "", "currentWeapon player != '' && vehicle player == player"],
	["Unholster Weapon", "player action ['SwitchWeapon', player, player, 0];", [], -11, false, false, "", "currentWeapon player == '' && vehicle player == player"],			
	//Add Salvage Feature, Add Resupply Script
	["Salvage","client\actions\salvage.sqf",0,0,false,false,"","!alive cursortarget and ((cursortarget iskindof 'Land')||(cursortarget iskindof 'Air')) and (player distance cursortarget) < 15"],
	
	
	[format ["<img image='client\icons\playerMenu.paa' color='%1'/> <t color='%1'>[</t>Player Menu<t color='%1'>]</t>", "#FF8000"], "client\systems\playerMenu\init.sqf", [], -10, false], //, false, "", ""],

	["<img image='client\icons\money.paa'/> Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", "{_x getVariable ['owner', ''] != 'mission'} count (player nearEntities ['Land_Money_F', 5]) > 0"],
		
//	["<img image='client\icons\r3f_unlock.paa'/>Unlock Vehicle", "client\actions\unlock.sqf", [], 1, false, false, "", "count nearestObjects [player, ['LandVehicle', 'Ship', 'Air'], 5] > 0"],
// 	["<img image='client\icons\r3f_lock.paa'/>Lock Vehicle", "client\actions\lock.sqf", [], 1, false, false, "", "count nearestObjects [player, ['LandVehicle', 'Ship', 'Air'], 5] > 0"],
	["<img image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa'/> <t color='#FFFFFF'>Cancel Action</t>", "noscript.sqf", "doCancelAction = true", 1, false, false, "", "mutexScriptInProgress"],

	["[0]"] call getPushPlaneAction,
	["Push vehicle", "server\functions\pushVehicle.sqf", [2.5, true], 1, false, false, "", "[2.5] call canPushVehicleOnFoot"],
	["Push vehicle forward", "server\functions\pushVehicle.sqf", [2.5], 1, false, false, "", "[2.5] call canPushWatercraft"],
	["Push vehicle backward", "server\functions\pushVehicle.sqf", [-2.5], 1, false, false, "", "[-2.5] call canPushWatercraft"],

	["<t color='#FF0000'>Emergency eject</t>", "client\actions\forceEject.sqf", [], -9, false, true, "", "(vehicle player) isKindOf 'Air'"],
	["<t color='#FF00FF'>Open magic parachute</t>", "client\actions\openParachute.sqf", [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"]
];


// Hehehe...
if !(288520 in getDLCs 1) then
{
	[player, ["<t color='#00FFFF'>Get in as Driver</t>", "client\actions\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] call fn_addManagedAction;
};
