class CfgFlagHacking
{
	enableHacking = 1;
	failChance = 25;
	hackDuration = 10;
	maxHackAttempts = 3;
	minPlayers = 30;
	maxHacks = 3;
	removeChance = 5;
	showMapIcon = 1;
	notifyServer = 1;
	notificationCooldown = 5;
};

class CfgExileDelayedActions
{
	class Abstract
	{
		duration=10;
		abortInCombatMode=1;
		durationFunction="";
		animation="";
		animationType="switchMove";
		failChance=0;
		conditionFunction="";
		completedFunction="";
		abortedFunction="";
		failedFunction="";
		repeatingCheckFunction="";
	};
	class HackFlag: Abstract
	{
		animationType="switchMove";
		animation="Acts_TerminalOpen";
		abortInCombatMode=0;
		failChanceFunction="ExileClient_action_hackFlag_failChance";
		durationFunction="ExileClient_action_hackFlag_duration";
		conditionFunction="ExileClient_action_hackFlag_condition";
		completedFunction="ExileClient_action_hackFlag_completed";
		failedFunction="ExileClient_action_hackFlag_failed";
		abortedFunction="ExileClient_action_hackFlag_aborted";
	};
};

class CfgNetworkMessages
{
	class hackFlagRequest
	{
		module="object_flag";
		parameters[]=
		{
			"STRING"
		};
	};
	class updateFlagHackAttemptRequest
	{
		module="object_flag";
		parameters[]=
		{
			"STRING"
		};
	};
	class startFlagHackRequest
	{
		module="object_flag";
		parameters[]=
		{
			"STRING"
		};
	};
};

class CfgExileCustomCode
{
	ExileClient_action_execute = "CustomCode\ExileClient_action_execute.sqf";
};

class CfgInteractionMenus
{
	class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";

		class Actions
		{
			class HackFlag: ExileAbstractAction
			{
				title = "Hack Flag";
				condition = "(getNumber(missionConfigFile >> 'CfgFlagHacking' >> 'enableHacking') isEqualTo 1) && ('Exile_Item_Laptop' in (magazines player)) && !ExilePlayerInSafezone";
				action = "['HackFlag', _this select 0] call ExileClient_action_execute";
			};
		};
	};
};