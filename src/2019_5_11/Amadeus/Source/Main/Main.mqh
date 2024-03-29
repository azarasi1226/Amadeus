#include "MainMethod.mqh"
#include "MainMethod2.mqh"
#include "MainButton.mqh"

int topBar_X = 5;		//Amadeusの原点となる座標_X
int topBar_Y = 100;		//Amadeusの原点となる座標_Y

double profitAndLoss;	//現在の累計損益(ニキシー管表示用)

double totalPips = 0.0;		//累計Pips
int cumulativeOrder = 0;	//累計取引数
int totalOrder = 0;			//現在のオーダー数

ulong firstDrawTime;	//表示させるための時間
short drawStringTime;	//表示させる文字列の時間
string firstString;		//一段目に表示させる文字列
string secondString;	//二段目に表示させる文字列
string thirdString;		//三番目に表示させる文字列

//初期化
void Main_Initialize(){
	Create_Main_Object();
}
	

//終了処理
void Main_Finalize(){
	ObjectsDeleteAll();
}

//更新
void Main_Update(){
	//---ニキシー管で損益を表示させる
	Draw_Profit_Nixie();
	
	//---Amadeusの表情をイベントで変化させる
	Makise_Expression();
	
	//---指定された文字列を表示
	Print_String();
	
	//---top_bar_bmpが選択せれていれば、画像を変える
	if(ObjectGet("top_bar_bmp", OBJPROP_SELECTED))
		ObjectSetString(0, "top_bar_bmp", OBJPROP_BMPFILE, 0, "::Experts\\Amadeus\\Image\\Main\\top_bar_selected.bmp");
	else
		ObjectSetString(0, "top_bar_bmp", OBJPROP_BMPFILE, 0, "::Experts\\Amadeus\\Image\\Main\\top_bar_locked.bmp");
		
	//---次のろうそく足までの時間
	Time_Next_Candle(true);
}

//イベント
void Main_Event(const int id, const long &lparam, const double &dparam, const string &sparam){
	//---top_barのドラッグを感知してオブジェクトの位置を移動させる
	if(id == CHARTEVENT_OBJECT_DRAG)
		Object_Reset(false);
		
	//---チャートの変更によるオブジェクトの位置を修正する
	if(id == CHARTEVENT_CHART_CHANGE)
		Object_Reset(true);
		
	//---ボタンイベントを呼ぶ
	if(id == CHARTEVENT_OBJECT_CLICK)
		Push_Button(sparam);
}