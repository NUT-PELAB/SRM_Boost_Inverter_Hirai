#include <fi1msInt.h>
#include <fiPwmInt.h>
#include "DllHeader.h"
#include "GlobalParameters.h"

//Global variables

f4      f4g_v1Det,f4g_v2Det,f4g_v3Det,f4g_v4Det,f4g_v5Det,f4g_v6Det;
f4      f4g_i1Det,f4g_i2Det,f4g_i3Det,f4g_i4Det,f4g_i5Det,f4g_i6Det;
f4      f4g_dutyRef1,f4g_dutyRef2,f4g_dutyRef3,f4g_dutyRef4,f4g_dutyRef5,f4g_dutyRef6,f4g_dutyRef7
f4      f4g_dutyRef8,f4g_dutyRef9,f4g_dutyRef10,f4g_dutyRef11,f4g_dutyRef12,f4g_dutyRef13,f4g_dutyRef14;
f4      f4g_th1Det,f4g_th2Det,f4g_th3Det,f4g_th4Det;
f4      f4g_tempInternal;
u2      u2g_sw1,u2g_sw2,u2g_sw3,u2g_sw4;
s2      s2g_frSgn;
u2      u2g_fOutput;



DLLEXPORT void plecsSetSizes(struct SimulationSizes* aSizes)
{
   aSizes->numInputs = 12;
   aSizes->numOutputs = 14;
   aSizes->numStates = 1;
   aSizes->numParameters = 3; //number of user parameters passed in
}


//This function is automatically called at the beginning of the simulation
DLLEXPORT void plecsStart(struct SimulationState* aState)
{
	//Example error message box
	if (aState->parameters[0] != INT_PER )
		aState->errorMessage = "INT_PER is not match";
    fiPwmIntInit();
    fi1msIntInit();
}


//This function is automatically called every sample time
//output is written to DLL output port after the output delay
DLLEXPORT void plecsOutput(struct SimulationState* aState)
{	
    f4g_v1Det = aState->inputs[0];
    f4g_v2Det = aState->inputs[1];
    f4g_v3Det = aState->inputs[2];
    f4g_v4Det = aState->inputs[3];
    f4g_v5Det = aState->inputs[4];
    f4g_v6Det = aState->inputs[5];
    f4g_i1Det = aState->inputs[6];
    f4g_i2Det = aState->inputs[7];
    f4g_i3Det = aState->inputs[8];
    f4g_i4Det = aState->inputs[9];
    f4g_i5Det = aState->inputs[10];
    f4g_i6Det = aState->inputs[11];

    fiPwmInt(); // todo div
    fi1msInt(); // todo div

    aState->outputs[0] = f4g_dutyRef1;
    aState->outputs[1] = f4g_dutyRef2;
    aState->outputs[2] = f4g_dutyRef3;
    aState->outputs[3] = f4g_dutyRef4;
    aState->outputs[4] = f4g_dutyRef5;
    aState->outputs[5] = f4g_dutyRef6;
    aState->outputs[6] = f4g_dutyRef7;
    aState->outputs[7] = f4g_dutyRef8;
    aState->outputs[8] = f4g_dutyRef9;
    aState->outputs[9] = f4g_dutyRef10;
    aState->outputs[10] = f4g_dutyRef11;
    aState->outputs[11] = f4g_dutyRef12;
    aState->outputs[12] = f4g_dutyRef13;
    aState->outputs[13] = f4g_dutyRef14;
}
