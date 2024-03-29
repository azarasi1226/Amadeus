#property strict
#property copyright		"製作者：SEAL"
#property link			"https://twitter.com/SEAL1226_jp?lang=ja"
#property version		"　　(2nd EDITION ver 2.31)"
#property icon			"Image/Amadeus.ico"
#property description	"--------------------------注意事項-----------------------------"
#property description	"  ①：MT4本体の  \"自動売買\"  をONにしてください"
#property description	"  ②：Amadeusセットアップ時の全般タブで  \"自動売買を許可する\"  にチェックを入れてください。"
#property description	"  ③：8個以上多重起動するとかなり重くなります"
#property description	"  ④：このソフトウェアを使用した取引で生じた損失は、作者は負担できません。"
#property description	"-----------------------------------------------------------------"
#property description	"#2nd EDTIONと書いてありますが、原作リスペクトなだけです。　このソフトウェアは試験段階です。"

#include "Source\Define.mqh"
#include "Source\ResourcesPath.mqh"
#include "Source\SceneMgr.mqh"
#include "Source\StartUp\StartUp.mqh"
#include "Source\Main\Main.mqh"
#include "Source\Config\Config.mqh"
#include "Source\Result\Result.mqh"

//---Amadeus起動時間記録
datetime startTime = TimeCurrent();

//初期化処理
int OnInit(){
	//---自動売買がONではなかったら、速やかに停止する
	if(!IsExpertEnabled()){
		MessageBox("MT4本体の自動売買がONになっていません\nEAのプロパティも念のため確認してください", "エラー", MB_ICONEXCLAMATION | MB_OK);
		return(INIT_FAILED);
	}
	
	EventSetMillisecondTimer(10);
	SceneMgr_Initialize();
	
	return(INIT_SUCCEEDED);
}

//終了処理
void OnDeinit(const int reason){
	SceneMgr_Finalize();
}

//Event処理
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam){
	SceneMgr_Event(id, lparam, dparam, sparam);
}

//Timer処理
void OnTimer(){
	SceneMgr_Update();
}
