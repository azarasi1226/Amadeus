//初期化
void StartUp_Initialize(){
	//---チャート上の全オブジェクト抹消
	ObjectsDeleteAll();
	
	//---スタートロゴ
	ObjectCreate(0, "start_logo_bmp", OBJ_BITMAP_LABEL, 0, 0, 0);
	ObjectSetInteger(0,"start_logo_bmp",OBJPROP_XDISTANCE,topBar_X);                  
	ObjectSetInteger(0,"start_logo_bmp",OBJPROP_YDISTANCE,topBar_Y);
}

//終了処理
void StartUp_Finalize(){
	//---通貨時間軸を変更するたびにMain_Initialize()が起動してしまうので、わざとFinalize()に起動音を処理させます。
	PlaySound("::Experts\\Amadeus\\Sound\\start.wav");
	ObjectsDeleteAll();
}

//更新
void StartUp_Update(){
	static int frameCount;
	//---20ミリ秒ずつアニメーション
	if(frameCount++%2 == 0){
		static int bmpIndex = 1;
		if(bmpIndex <= 155)
			ObjectSetString(0, "start_logo_bmp", OBJPROP_BMPFILE, 0, "::Experts\\Amadeus\\Image\\StartUp\\start_logo (" + bmpIndex + ").bmp");
			
		bmpIndex++;
		
		//---若干停止を入れてから次の場面移行(bmpIndex>=200)
		if(bmpIndex >= 200)
			SceneMgr_ChangeScene(eScene_Main);
	}
}

//イベント
void StartUp_Event(const int id, const long &lparam, const double &dparam, const string &sparam){

}