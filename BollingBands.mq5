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


