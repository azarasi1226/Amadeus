#ifndef LOCAL_ERRORCODE_JP
#define LOCAL_ERRORCODE_JP

#define ERRORCODE_DEFINE          0   //エラー配列のエラー定義列
#define ERRORCODE_NO              1   //エラー配列のエラーコード列
#define ERRORCODE_STR             2   //エラー配列のエラー文字列列
#define ERRORCODE_ARRAY_MAX       3   //エラー配列２次元目の配列数
#define ERROECODE_UNIQUE_ARRY_MAX 151 //エラー配列１次元目の配列数

//+----------------------------------------------------------------------+
//| 関数名  ：Get_ComErrorCodeStr
//| 概要    ：現在のエラーを日本語で返します
//+----------------------------------------------------------------------
//| 引数    ：void
//| 戻り値  ：string 日本語のエラー文
//+----------------------------------------------------------------------+
string Get_ComErrorCodeStr(){
    int     errorCode = GetLastError();
    string  errorStr = "";

    //エラーが65536以上ならばユーザーエラーとして弾く
    if(errorCode >= ERR_USER_ERROR_FIRST){
        errorStr = StringFormat("エラーコード：%d, 詳細：ユーザー定義エラー", errorCode);

        return errorStr;
    }
    
    //エラーコードにマッチする要素まで走査する
    for(int i=0 ; i < ERROECODE_UNIQUE_ARRY_MAX ; i++){
        if(StrToInteger(ErrorCodeStrArry[i][ERRORCODE_NO] == errorCode){
            errorStr = StringFormat("エラーコード：%d, 詳細：%s",　errorCode,　ErrorCodeStrArry[i][ERRORCODE_STR]);
            break;
        }
    }

    return errorStr;
}

const string ErrorCodeStrArry[ERROECODE_UNIQUE_ARRY_MAX][ERRORCODE_ARRAY_MAX] = {
    {/*0*/   "ERR_NO_ERROR",                        "0",     "エラーはありません"},
    {/*1*/   "ERR_NO_RESULT",                       "1",     "エラーはありませんが、結果が不明です"},
    {/*2*/   "ERR_COMMON_ERROR",                    "2",     "一般的なエラー"},
    {/*3*/   "ERR_INVALID_TRADE_PARAMETERS",        "3",     "無効な取引パラメータ"},
    {/*4*/   "ERR_SERVER_BUSY",                     "4",     "トレードサーバーがビジー状態です"},
    {/*5*/   "ERR_OLD_VERSION",                     "5",     "クライアントターミナルのバージョンが古い"},
    {/*6*/   "ERR_NO_CONNECTION",                   "6",     "トレードサーバーに接続していません"},
    {/*7*/   "ERR_NOT_ENOUGH_RIGHTS",               "7",     "権限が十分ではありません"},
    {/*8*/   "ERR_TOO_FREQUENT_REQUESTS",           "8",     "要求が頻繁過ぎます"},
    {/*9*/   "ERR_MALFUNCTIONAL_TRADE",             "9",     "異常な取引操作です"},
    {/*10*/  "ERR_ACCOUNT_DISABLED",                "64",    "許可されていないアカウントです"},
    {/*11*/  "ERR_INVALID_ACCOUNT",                 "65",    "無効なアカウントです"},
    {/*12*/  "ERR_TRADE_TIMEOUT",                   "128",   "トレードタイムアウト"},
    {/*13*/  "ERR_INVALID_PRICE",                   "129",   "無効な価格です"},
    {/*14*/  "ERR_INVALID_STOPS",                   "130",   "無効なストップ設定です"},
    {/*15*/  "ERR_INVALID_TRADE_VOLUME",            "131",   "無効なトレード量(lot数)です"},
    {/*16*/  "ERR_MARKET_CLOSED",                   "132",   "市場が閉じています"},
    {/*17*/  "ERR_TRADE_DISABLED",                  "133",   "トレード無効設定になっています"},
    {/*18*/  "ERR_NOT_ENOUGH_MONEY",                "134",   "証拠金が不足しています"},
    {/*19*/  "ERR_PRICE_CHANGED",                   "135",   "価格が変更されました"},
    {/*20*/  "ERR_OFF_QUOTES",                      "136",   "レートが提示されていません"},
    {/*21*/  "ERR_BROKER_BUSY",                     "137",   "ブローカーがビジー状態です"},
    {/*22*/  "ERR_REQUOTE",                         "138",   "レート再提示"},
    {/*23*/  "ERR_ORDER_LOCKED",                    "139",   "注文がロックされています"},
    {/*24*/  "ERR_LONG_POSITIONS_ONLY_ALLOWED",     "140",   "ロングエントリーのみ許可されています"},
    {/*25*/  "ERR_TOO_MANY_REQUESTS",               "141",   "要求が多過ぎます"},
    {/*26*/  "ERR_TRADE_MODIFY_DENIED",             "145",   "変更注文が市場提示価格に近すぎる為、拒否されました"},
    {/*27*/  "ERR_TRADE_CONTEXT_BUSY",              "146",   "トレードコンテキストがビジーです"},
    {/*28*/  "ERR_TRADE_EXPIRATION_DENIED",         "147",   "有効期限設定はブローカーによって拒否されました"},
    {/*29*/  "ERR_TRADE_TOO_MANY_ORDERS",           "148",   "保留中の注文量がブローカーによって設定された上限に達しています"},
    {/*30*/  "ERR_TRADE_HEDGE_PROHIBITED",          "149",   "両建ては無効になっています"},
    {/*31*/  "ERR_TRADE_PROHIBITED_BY_FIFO",        "150",   "FIFOルールに違反したポジション決済をしようとしています"},
    {/*32*/  "ERR_NO_MQLERROR",                     "4000",  "エラーはありません"},
    {/*33*/  "ERR_WRONG_FUNCTION_POINTER",          "4001",  "不正な関数ポインタ"},
    {/*34*/  "ERR_ARRAY_INDEX_OUT_OF_RANGE",        "4002",  "配列インデックスの範囲外指定"},
    {/*35*/  "ERR_NO_MEMORY_FOR_CALL_STACK",        "4003",  "関数呼び出しの為のスタックメモリがありません"},
    {/*36*/  "ERR_RECURSIVE_STACK_OVERFLOW",        "4004",  "スタックオーバーフロー"},
    {/*37*/  "ERR_NOT_ENOUGH_STACK_FOR_PARAM",      "4005",  "引数の為のスタックが不十分"},
    {/*38*/  "ERR_NO_MEMORY_FOR_PARAM_STRING",      "4006",  "文字列引数の為のメモリ不足"},
    {/*39*/  "ERR_NO_MEMORY_FOR_TEMP_STRING",       "4007",  "文字列の為のメモリ不足"},
    {/*40*/  "ERR_NOT_INITIALIZED_STRING",          "4008",  "文字列は初期化されません"},
    {/*41*/  "ERR_NOT_INITIALIZED_ARRAYSTRING",     "4009",  "配列文字列は初期化されません"},
    {/*42*/  "ERR_NO_MEMORY_FOR_ARRAYSTRING",       "4010",  "配列文字列の為のメモリ不足"},
    {/*43*/  "ERR_TOO_LONG_STRING",                 "4011",  "文字列が長過ぎです"},
    {/*44*/  "ERR_REMAINDER_FROM_ZERO_DIVIDE",      "4012",  "ゼロ除算(余剰)をしています"},
    {/*45*/  "ERR_ZERO_DIVIDE",                     "4013",  "ゼロ除算をしています"},
    {/*46*/  "ERR_UNKNOWN_COMMAND",                 "4014",  "不明なコマンド"},
    {/*47*/  "ERR_WRONG_JUMP",                      "4015",  "不正なジャンプ"},
    {/*48*/  "ERR_NOT_INITIALIZED_ARRAY",           "4016",  "配列は初期化されません"},
    {/*49*/  "ERR_DLL_CALLS_NOT_ALLOWED",           "4017",  "DLL呼び出しが許可されていません"},
    {/*50*/  "ERR_CANNOT_LOAD_LIBRARY",             "4018",  "ライブラリをロードできません"},
    {/*51*/  "ERR_CANNOT_CALL_FUNCTION",            "4019",  "関数を呼び出せません"},
    {/*52*/  "ERR_EXTERNAL_CALLS_NOT_ALLOWED",      "4020",  "外部関数の呼び出しが許可されていません"},
    {/*53*/  "ERR_NO_MEMORY_FOR_RETURNED_STR",      "4021",  "関数の文字列型の戻り値の為のメモリが足りません"},
    {/*54*/  "ERR_SYSTEM_BUSY",                     "4022",  "システムビジー"},
    {/*55*/  "ERR_DLLFUNC_CRITICALERROR",           "4023",  "DLL関数呼び出しの致命的なエラー"},
    {/*56*/  "ERR_INTERNAL_ERROR",                  "4024",  "内部エラー"},
    {/*57*/  "ERR_OUT_OF_MEMORY",                   "4025",  "メモリ不足"},
    {/*58*/  "ERR_INVALID_POINTER",                 "4026",  "無効なポインタ"},
    {/*59*/  "ERR_FORMAT_TOO_MANY_FORMATTERS",      "4027",  "フォーマット関数で引数が多過ぎ"},
    {/*60*/  "ERR_FORMAT_TOO_MANY_PARAMETERS",      "4028",  "パラメータカウント上限越え"},
    {/*61*/  "ERR_ARRAY_INVALID",                   "4029",  "無効な配列"},
    {/*62*/  "ERR_CHART_NOREPLY",                   "4030",  "チャートから返信がありません"},
    {/*63*/  "ERR_INVALID_FUNCTION_PARAMSCNT",      "4050",  "無効な関数の引数数"},
    {/*64*/  "ERR_INVALID_FUNCTION_PARAMVALUE",     "4051",  "無効な関数の引数値"},
    {/*65*/  "ERR_STRING_FUNCTION_INTERNAL",        "4052",  "文字列関数の内部エラー"},
    {/*66*/  "ERR_SOME_ARRAY_ERROR",                "4053",  "配列エラー"},
    {/*67*/  "ERR_INCORRECT_SERIESARRAY_USING",     "4054",  "不正な時系列配列使用"},
    {/*68*/  "ERR_CUSTOM_INDICATOR_ERROR",          "4055",  "カスタムインジケータエラー"},
    {/*69*/  "ERR_INCOMPATIBLE_ARRAYS",             "4056",  "互換性の無い配列"},
    {/*70*/  "ERR_GLOBAL_VARIABLES_PROCESSING",     "4057",  "グローバル変数処理エラー"},
    {/*71*/  "ERR_GLOBAL_VARIABLE_NOT_FOUND",       "4058",  "グローバル変数が見つかりません"},
    {/*72*/  "ERR_FUNC_NOT_ALLOWED_IN_TESTING",     "4059",  "関数がテストモードで許可されていません"},
    {/*73*/  "ERR_FUNCTION_NOT_CONFIRMED",          "4060",  "関数が呼び出し許可されていません"},
    {/*74*/  "ERR_SEND_MAIL_ERROR",                 "4061",  "メール送信エラー"},
    {/*75*/  "ERR_STRING_PARAMETER_EXPECTED",       "4062",  "文字列引数が必要"},
    {/*76*/  "ERR_INTEGER_PARAMETER_EXPECTED",      "4063",  "整数引数が必要"},
    {/*77*/  "ERR_DOUBLE_PARAMETER_EXPECTED",       "4064",  "double引数が必要"},
    {/*78*/  "ERR_ARRAY_AS_PARAMETER_EXPECTED",     "4065",  "配列引数が必要"},
    {/*79*/  "ERR_HISTORY_WILL_UPDATED",            "4066",  "要求したヒストリーデータが更新中"},
    {/*80*/  "ERR_TRADE_ERROR",                     "4067",  "内部トレードエラー"},
    {/*81*/  "ERR_RESOURCE_NOT_FOUND",              "4068",  "リソースが見つかりません"},
    {/*82*/  "ERR_RESOURCE_NOT_SUPPORTED",          "4069",  "リソースがサポートされていません"},
    {/*83*/  "ERR_RESOURCE_DUPLICATED",             "4070",  "リソース重複"},
    {/*84*/  "ERR_INDICATOR_CANNOT_INIT",           "4071",  "カスタムインジケータを初期化できません"},
    {/*85*/  "ERR_INDICATOR_CANNOT_LOAD",           "4072",  "カスタムインジータをロードできません"},
    {/*86*/  "ERR_END_OF_FILE",                     "4099",  "フィルの終わり"},
    {/*87*/  "ERR_SOME_FILE_ERROR",                 "4100",  "ファイルエラー"},
    {/*88*/  "ERR_WRONG_FILE_NAME",                 "4101",  "不正なファイル名"},
    {/*89*/  "ERR_TOO_MANY_OPENED_FILES",           "4102",  "ファイルを開き過ぎています"},
    {/*90*/  "ERR_CANNOT_OPEN_FILE",                "4103",  "ファイルが開けません"},
    {/*91*/  "ERR_INCOMPATIBLE_FILEACCESS",         "4104",  "互換性の無いファイルアクセス"},
    {/*92*/  "ERR_NO_ORDER_SELECTED",               "4105",  "オーダー選択されていません"},
    {/*93*/  "ERR_UNKNOWN_SYMBOL",                  "4106",  "不明なシンボル"},
    {/*94*/  "ERR_INVALID_PRICE_PARAM",             "4107",  "無効な価格"},
    {/*95*/  "ERR_INVALID_TICKET",                  "4108",  "無効なチケット"},
    {/*96*/  "ERR_TRADE_NOT_ALLOWED",               "4109",  "トレードが許可されていません。許可するには、EAプロパティのチェックボックスで設定します"},
    {/*97*/  "ERR_LONGS_NOT_ALLOWED",               "4110",  "買い注文は許可されていません。許可するには、EAプロパティで設定します"},
    {/*98*/  "ERR_SHORTS_NOT_ALLOWED",              "4111",  "売り注文は許可されていません。許可するには、EAプロパティで設定します"},
    {/*99*/  "ERR_TRADE_EXPERT_DISABLED_BY_SERVER", "4112",  "EA・スクリプトによる自動売買はトレードサーバーで許可されていません。"},
    {/*100*/ "ERR_OBJECT_ALREADY_EXISTS",           "4200",  "オブジェクトが既に存在しています"},
    {/*101*/ "ERR_UNKNOWN_OBJECT_PROPERTY",         "4201",  "不明なオブジェクトプロパティ"},
    {/*102*/ "ERR_OBJECT_DOES_NOT_EXIST",           "4202",  "オブジェクトが存在していません"},
    {/*103*/ "ERR_UNKNOWN_OBJECT_TYPE",             "4203",  "不明なオブジェクトタイプ"},
    {/*104*/ "ERR_NO_OBJECT_NAME",                  "4204",  "オブジェクト名がありません"},
    {/*105*/ "ERR_OBJECT_COORDINATES_ERROR",        "4205",  "オブジェクト調整エラー"},
    {/*106*/ "ERR_NO_SPECIFIED_SUBWINDOW",          "4206",  "サブウインドウを指定出来ません"},
    {/*107*/ "ERR_SOME_OBJECT_ERROR",               "4207",  "グラフィカルオブジェクトエラー"},
    {/*108*/ "ERR_CHART_PROP_INVALID",              "4210",  "不正なチャートプロパティ"},
    {/*109*/ "ERR_CHART_NOT_FOUND",                 "4211",  "チャートが見つかりません"},
    {/*110*/ "ERR_CHARTWINDOW_NOT_FOUND",           "4212",  "チャートサブウインドウが見つかりません"},
    {/*111*/ "ERR_CHARTINDICATOR_NOT_FOUND",        "4213",  "チャートインジケータが見つかりません"},
    {/*112*/ "ERR_SYMBOL_SELECT",                   "4220",  "シンボル選択エラー"},
    {/*113*/ "ERR_NOTIFICATION_ERROR",              "4250",  "通知エラー"},
    {/*114*/ "ERR_NOTIFICATION_PARAMETER",          "4251",  "通知パラメータエラー"},
    {/*115*/ "ERR_NOTIFICATION_SETTINGS",           "4252",  "通知無効"},
    {/*116*/ "ERR_NOTIFICATION_TOO_FREQUENT",       "4253",  "通知を頻繁に送り過ぎ"},
    {/*117*/ "ERR_FILE_TOO_MANY_OPENED",            "5001",  "ファイルを開き過ぎ"},
    {/*118*/ "ERR_FILE_WRONG_FILENAME",             "5002",  "不正なファイル名"},
    {/*119*/ "ERR_FILE_TOO_LONG_FILENAME",          "5003",  "ファイル名が長すぎます"},
    {/*120*/ "ERR_FILE_CANNOT_OPEN",                "5004",  "ファイルを開けません"},
    {/*121*/ "ERR_FILE_BUFFER_ALLOCATION_ERROR",    "5005",  "テキストファイルのバッファ割り当てエラー"},
    {/*122*/ "ERR_FILE_CANNOT_DELETE",              "5006",  "フィルを削除できません"},
    {/*123*/ "ERR_FILE_INVALID_HANDLE",             "5007",  "無効なファイルハンドル(ファイルがオープン・クローズされていない)"},
    {/*124*/ "ERR_FILE_WRONG_HANDLE",               "5008",  "不正なファイルハンドル(ハンドルインデックスがハンドルテーブル外)"},
    {/*125*/ "ERR_FILE_NOT_TOWRITE",                "5009",  "FILE_WRITEフラグ付きでオープンする必要があります"},
    {/*126*/ "ERR_FILE_NOT_TOREAD",                 "5010",  "FILE_READフラグ付きでオープンする必要があります"},
    {/*127*/ "ERR_FILE_NOT_BIN",                    "5011",  "FILE_BINフラグ付きでオープンする必要があります"},
    {/*128*/ "ERR_FILE_NOT_TXT",                    "5012",  "FILE_TXTフラグ付きでオープンする必要があります"},
    {/*129*/ "ERR_FILE_NOT_TXTORCSV",               "5013",  "FILE_TXT又はFILE_CSVフラグ付きでオープンする必要があります"},
    {/*130*/ "ERR_FILE_NOT_CSV",                    "5014",  "FILE_CSVフラグ付きでオープンする必要があります"},
    {/*131*/ "ERR_FILE_READ_ERROR",                 "5015",  "ファイル読み込みエラー"},
    {/*132*/ "ERR_FILE_WRITE_ERROR",                "5016",  "ファイル書き込みエラー"},
    {/*133*/ "ERR_FILE_BIN_STRINGSIZE",             "5017",  "バイナリファイルの為に文字列サイズを指定する必要があります"},
    {/*134*/ "ERR_FILE_INCOMPATIBLE",               "5018",  "互換性の無いファイル(.txt:文字列ファイル, .bin：他ファイル)"},
    {/*135*/ "ERR_FILE_IS_DIRECTORY",               "5019",  "ファイルではありません。ディレクトリです。"},
    {/*136*/ "ERR_FILE_NOT_EXIST",                  "5020",  "ファイルが存在しません"},
    {/*137*/ "ERR_FILE_CANNOT_REWRITE",             "5021",  "ファイルを書き換える事は出来ません"},
    {/*138*/ "ERR_FILE_WRONG_DIRECTORYNAME",        "5022",  "不正なディレクトリ名"},
    {/*139*/ "ERR_FILE_DIRECTORY_NOT_EXIST",        "5023",  "ディレクトリが存在しません"},
    {/*140*/ "ERR_FILE_NOT_DIRECTORY",              "5024",  "指定されたファイルはディレクトリではありません"},
    {/*141*/ "ERR_FILE_CANNOT_DELETE_DIRECTORY",    "5025",  "ディレクトリを削除する事は出来ません"},
    {/*142*/ "ERR_FILE_CANNOT_CLEAN_DIRECTORY",     "5026",  "ディレクトリ内のデータを削除する事は出来ません"},
    {/*143*/ "ERR_FILE_ARRAYRESIZE_ERROR",          "5027",  "配列サイズ変更エラー"},
    {/*144*/ "ERR_FILE_STRINGRESIZE_ERROR",         "5028",  "文字列サイズ変更エラー"},
    {/*145*/ "ERR_FILE_STRUCT_WITH_OBJECTS",        "5029",  "構造体に文字列または動的配列が含まれています"},
    {/*146*/ "ERR_WEBREQUEST_INVALID_ADDRESS",      "5200",  "無効なURL"},
    {/*147*/ "ERR_WEBREQUEST_CONNECT_FAILED",       "5201",  "指定されたURLへの接続に失敗しました"},
    {/*148*/ "ERR_WEBREQUEST_TIMEOUT",              "5202",  "タイムアウト"},
    {/*149*/ "ERR_WEBREQUEST_REQUEST_FAILED",       "5203",  "HTTPリクエスト失敗"},
    {/*150*/ "ERR_USER_ERROR_FIRST",                "65536", "ユーザー定義エラーは、このコードから始まります"}
};

#endif