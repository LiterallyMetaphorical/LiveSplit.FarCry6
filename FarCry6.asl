// Created by AlexYeahNot, Binslev, and Meta

state("FarCry6")
{
	int loading : "FC_m64d3d12.dll", 0x6D3E1DC; // when searching for an address, try to find one that works across main game and DLC (including travel doorways in DLC)
    // chances are for ^ loading - you'll want an address in the '6Fxxxx' region of memory, and it will be 0 in game and potentially '16777216' while loading
//  int menuState : "FC_m64d3d12.dll", 0x69F2B6C;
}

isLoading
{
	return current.loading != 0;
}

/*init
{
    vars.menuState = false;
}*/

startup
  {
    	if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Far Cry 6",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
  }

/*start
{
    return (current.menuState == 1 && current.loading != 0);
}*/
