/**
 * ExileServer_world_loadAllDatabaseConstructions
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_continueLoading","_page","_pageSize","_constructionIDs","_numberOfConstructions","_i"];
"Loading constructions from database..." call ExileServer_util_log;
_continueLoading = true;
_page = 0;
_pageSize = 100;
while {_continueLoading} do 
{
	_constructionIDs = format ["loadConstructionIdPage:%1:%2", _page * _pageSize, _pageSize] call ExileServer_system_database_query_selectFull;
	_numberOfConstructions = count _constructionIDs;
	if (_numberOfConstructions > 0) then 
	{
		for "_i" from 0 to _numberOfConstructions - 1 do 
		{
			((_constructionIDs select _i) select 0) call ExileServer_object_construction_database_load;
		};
	};
	_page = _page + 1;
	if (_numberOfConstructions < 100) then
	{
		_continueLoading = false;
	};
	private _DynamicObjects = ["Exile_Construction_ConcreteDoor_Static", 
	"Exile_Construction_ConcreteGate_Static", 
	"Exile_Construction_WoodGate_Static", 
	"Exile_Construction_WoodDoor_Static",
	"Exile_Construction_ConcreteWindowHatch_Static", 
	"Exile_Construction_WoodGate_Reinforced_Static", 
	"Exile_Construction_WoodDoor_Reinforced_Static", 
	"Exile_Construction_ConcreteFloorHatch_Static",
	"Land_Stone_Gate_F",
	"Land_City_Gate_F",
	"Land_BarGate_F",
	"Land_Cargo_Patrol_V2_F",
	"Land_Cargo_Tower_V2_F",
	"Land_FuelStation_Feed_F",
	"Land_Cargo_House_V2_F",
	"Land_i_Garage_V2_F",
	"Land_ToiletBox_F",
	"Land_Dome_Big_F",
	"Land_spp_Tower_F",
	"Land_Airport_Tower_F",
	"Land_i_Barracks_V1_F",
	"Land_TTowerSmall_1_F",
	"Land_i_House_Small_03_V1_F",
	"Land_i_House_Big_01_V2_F",
	"Land_PlasticCase_01_medium_F",
	"Land_Research_HQ_F",
	"Land_Research_house_V1_F"];
	private _NonObjects = ["Exile_Construction_WoodFloor_Static",
	"Exile_Construction_WoodFloor_Reinforced_Static",
	"Exile_Construction_ConcreteFloorPort_Static",
	"Exile_Construction_WoodWindow_static",
	"Exile_Construction_ConreteWindow_Static",
	"Exile_Constuction_ConreteFloorPort_Static",
	"Exile_ConstuctionWoodFloorPort_Static",
	"Exile_Construction_ConcreteWall_Static",
	"Exile_Construction_ConcreteSupport_Static",
	"Exile_Construction_ConcreteFloor_Static",
	"Exile_Construction_WoodWindow_Reinforced_Static",
	"Exile_Construction_WoodWall_Reinforced_Static",
	"Exile_Construction_WoodWall_Static",
	"Exile_Construction_WoodSupport_Static",
	"Exile_Construction_WoodFloorPort_Static"
	];
	{
		if((typeOf _x in _DynamicObjects) and (simulationEnabled _x isEqualTo true)) then 
		{
			_x enableSimulationGlobal false;
		};
		if((typeOf _x in _NonObjects) and (simulationEnabled _x isEqualTo true)) then 
		{
			_x enableSimulationGlobal false;
		};
	} forEach (allMissionObjects "");
};
"Done loading constructions!" call ExileServer_util_log;
true
