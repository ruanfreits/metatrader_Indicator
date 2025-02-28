//+------------------------------------------------------------------+
//|                                                   HttpHelper.mq4 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   string headers = "Content-Type: application/json";
   
   string url = "https://api.github.com";
   char post[],result[];
   char resposta[];
   int timeout = 5000;
   char json[];
   string resultHeader;
   ResetLastError();
   
//---
  int httpCode = WebRequest("GET", url,headers, timeout, post,result, resultHeader);
  
  string respostaTexto = CharArrayToString(result);
  if(httpCode == -1){
  Print("URL not Allowed");
  }
  else if(httpCode != 200){
  Print("Error by sending Request: ", GetLastError());
  }
  else{
  Print("Request Has been sent successfully\n Here the response:", respostaTexto);
  }
  
}

//+------------------------------------------------------------------+
