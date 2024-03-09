#property strict

// Input parameters
input int BBPeriod = 20;
input double BBDeviation = 2.0;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
    // Create pop-up window for custom parameters
    if (Inputs() == false)
        return INIT_FAILED;

    return INIT_SUCCEEDED;
}


//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Nothing to deinitialize
}

//+------------------------------------------------------------------+
//| Expert tick function                                            |
//+------------------------------------------------------------------+
void OnTick()
{
    // No trading logic required for visualization EA
}


//+------------------------------------------------------------------+
//| Custom inputs function                                          |
//+------------------------------------------------------------------+
bool Inputs()
{
    // Create custom inputs pop-up window
    int button = MessageBox("Set Bollinger Bands Parameters", "Bollinger Bands Parameters", MB_OKCANCEL);
    if (button == IDOK)
    {
        // If OK is clicked, apply the parameters
        BBPeriod = InputInteger("Period", BBPeriod);
        BBDeviation = InputDouble("Deviation", BBDeviation);
        return true;
    }
    else
    {
        // If Cancel is clicked, return false
        return false;
    }
}
