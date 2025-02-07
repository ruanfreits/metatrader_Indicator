//+------------------------------------------------------------------+
//|                    Indicador Par/Ímpar                         |
//|          Compra quando o último dígito do preço é ímpar       |
//|          Venda quando o último dígito do preço é par          |
//+------------------------------------------------------------------+
#property indicator_chart_window

#import "shell32.dll"
    int ShellExecuteA(int hwnd, string Operation, string File, string Parameters, string Directory, int ShowCmd);
#import 
// Parâmetros do indicador
input int AlertInterval = 10;  // Intervalo entre alertas em segundos

// Variáveis globais
datetime lastAlertTime = 0;

//+------------------------------------------------------------------+
//| Função de inicialização                                         |
//+------------------------------------------------------------------+
int OnInit()
{

    Print(TERMINAL_PATH,"<--");
    Print("Indicador Par/Ímpar inicializado");
    return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Função principal do indicador                                   |
//+------------------------------------------------------------------+
void OnTick()
{
    double price = Bid;  // Obtém o preço atual de compra
    int lastDigit = int(price * 10) % 10; // Obtém o último dígito
    
    if (TimeCurrent() - lastAlertTime >= AlertInterval) // Verifica o intervalo de alertas
    {
        if (lastDigit % 2 == 0)
        {
            Alert("Sinal de VENDA - Último dígito par: ", lastDigit);
        }
        else
        {
            Alert("Sinal de COMPRA - Último dígito ímpar: ", lastDigit);
        }
        lastAlertTime = TimeCurrent();
    }
}
