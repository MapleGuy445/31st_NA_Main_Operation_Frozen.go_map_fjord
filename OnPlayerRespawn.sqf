[] spawn {
	respawned = 0;
	while {respawned != 1} do
	{
		if (alive player) then 
		{
			[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
			respawned = 1;
		}
		else
		{
			sleep 5;
		};
	};
}
