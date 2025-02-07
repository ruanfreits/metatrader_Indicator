//+------------------------------------------------------------------+
//| Expert Advisor para verificar se o preço é par ou ímpar        |
//+------------------------------------------------------------------+
#property strict

datetime lastCheckTime = 0;
//---
   string headers = "Content-Type: application/json";
   
   string url = "https://api.github.com";
   char post[],result[];
   char resposta[];
   int timeout = 5000;
   char json[];
   string resultHeader;
   ResetLastError();
   

void CallHttp(){
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

void OnTick()
{
    // Obtém o tempo atual em segundos
    datetime currentTime = TimeCurrent();
    
    // Verifica se passaram 20 segundos desde a última verificação
    if (currentTime - lastCheckTime >= 20)
    {
        lastCheckTime = currentTime;

        double price = Bid; // Obtém o preço de compra

        // Converte para inteiro removendo a parte decimal
        int priceInt = (int)(price * 100000); // Ajuste dependendo do número de casas decimais

        if (priceInt % 2 == 0)
        {
            Print("O preço ", price, " é PAR.");
            CallHttp();
            
        }
        else
        {
            Print("O preço ", price, " é ÍMPAR.");
            CallHttp();
        }
    }
}