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

//+------------------------------------------------------------------+
//| Chart event function                                            |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
{
    // Plot Bollinger Bands on chart
    if (id == CHARTEVENT_OBJECT_CREATE && StringFind(sparam, "Bollinger Bands", 0) != -1)
    {
        PlotBB();
    }
}

//+------------------------------------------------------------------+
//| Plot Bollinger Bands on chart                                   |
//+------------------------------------------------------------------+
void PlotBB()
{
    double upperBand[];
    double middleBand[];
    double lowerBand[];

    // Calculate Bollinger Bands values
    ArrayResize(upperBand, Bars);
    ArrayResize(middleBand, Bars);
    ArrayResize(lowerBand, Bars);

for (int i = 0; i < Bars; i++)
    {
        upperBand[i] = iMA(NULL, 0, BBPeriod, 0, MODE_SMA, PRICE_CLOSE, i) + BBDeviation * iStdDev(NULL, 0, BBPeriod, 0, MODE_SMA, PRICE_CLOSE, i);
        middleBand[i] = iMA(NULL, 0, BBPeriod, 0, MODE_SMA, PRICE_CLOSE, i);
        lowerBand[i] = iMA(NULL, 0, BBPeriod, 0, MODE_SMA, PRICE_CLOSE, i) - BBDeviation * iStdDev(NULL, 0, BBPeriod, 0, MODE_SMA, PRICE_CLOSE, i);
    }

    // Plot Bollinger Bands on chart
    PlotIndexSetDouble(0, PLOT_EMPTY, lowerBand);
    PlotIndexSetInteger(0, PLOT_DRAW_TYPE, DRAW_LINE);
    PlotIndexSetInteger(0, PLOT_LINE_COLOR, clrBlue);

    PlotIndexSetDouble(1, PLOT_EMPTY, middleBand);
    PlotIndexSetInteger(1, PLOT_DRAW_TYPE, DRAW_LINE);
    PlotIndexSetInteger(1, PLOT_LINE_COLOR, clrGreen);

    PlotIndexSetDouble(2, PLOT_EMPTY, upperBand);
    PlotIndexSetInteger(2, PLOT_DRAW_TYPE, DRAW_LINE);
    PlotIndexSetInteger(2, PLOT_LINE_COLOR, clrRed);
