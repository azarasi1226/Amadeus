void Time_Next_Candle(bool flag){
	if(flag){
		string printText = "残り:";
		int remainingTime = Time[0]+_Period*60-TimeCurrent();
		int hour = remainingTime/3600;
		int minute = remainingTime%3600/60;
		int second = remainingTime%3600%60;
		
		if(_Period >= PERIOD_H4){
			printText += hour+"時間"+minute+"分"+second+"秒";
		}
		else if(_Period == PERIOD_M1){
			printText += second+"秒";
		}
		else{
			printText += minute+"分"+second+"秒";
		}
		
		ObjectSetString(0, "next_candle_label", OBJPROP_TEXT,printText);
	}
	else{
		ObjectSetString(0, "next_candle_label", OBJPROP_TEXT, "");
	}
}