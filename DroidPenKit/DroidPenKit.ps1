
param(
   [int]$p1
)

# Caminhos (altere se necessário)
$ADB = "$env:LOCALAPPDATA\Android\Sdk\platform-tools\adb.exe"
$EMULATOR = "$env:LOCALAPPDATA\Android\Sdk\emulator\emulator.exe"


function Shell{
   echo "Exemplo: ps # Listar Processos"
   $comando = Read-Host "Digite o comando: ou aperte ENTER entrar na shell"
   $opcao = "shell", "$comando"
   & $ADB $opcao 
}

function listar{
   Write-Host "Listar Devices"
   & $ADB devices
}

function kill{
   Write-Host "Finalizar processo ADB"
   & $ADB kill-server
}

function start{
   Write-Host "Iniciando o Processo ADB"
   & $ADB start-server
}

function Monitor{
   Write-Host "Iniciar Monitor de Crash"
   & $ADB shell am monitor
}

function download{
   Write-Host "Copiar Arquivo para dentro do android"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do arquivo:"
   $destino = Read-Host "Digite o local para copia ex: /sdcard/arquivo:"
   & $ADB -s $device push $local $destino
   
}

function upload{
   Write-Host "Baixar arquivo do Android"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do arquivo: Ex: /data/local/arquivo.txt"
   & $ADB -s $device pull $local 
}

function install{
   Write-Host "Instalar APK no device"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do APK: ex: c:\teste.apk"
   & $ADB -s $device install $local
}

function install1{
   Write-Host "Reinstala mantendo os dados"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do APK: ex: c:\teste.apk"
   & $ADB -s $device  install -r $local
}

function install2{
   Write-Host "Permite downgrade"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do APK: ex: c:\teste.apk"
   & $ADB -s $device install -d $local
}

function install3{
   Write-Host "Concede todas as permissões"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do APK: ex: c:\teste.apk"
   & $ADB -s $device install -g $local
}

function install4{
   Write-Host "Instalação instantânea"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do APK: ex: c:\teste.apk"
   & $ADB -s $device install --instant $local
}

function remove{
   Write-Host "Remover APK do device"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o local do APK: ex: c:\teste.apk"
   & $ADB -s $device uninstall $local 

}

function remove1{
   Write-Host "Remover Pacote do device"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o nome do pacote: ex: com.paquete"
   & $ADB -s $device uninstall $local 

}

function remove2{
   Write-Host "Desinstala, mas mantém os dados"
   & $ADB devices
   $device = Read-Host "Escolha o Device:"
   $local = Read-Host "Digite o nome do pacote: ex: com.paquete"
   & $ADB -s $device uninstall -k $local 

}


function list-devices{
   Write-Host "List Virtual devices"
   & $EMULATOR -list-avds  
}

function emular-avd{
   Write-Host "Iniciar Virtual device"
   & $EMULATOR -list-avds
   $device = Read-Host "Escolha o Device: Ex: Pixel_3a_API_33_x86_64"
   & $EMULATOR -avd $device
}

function emular-avd-write{
   Write-Host ""Iniciar Virtual device
   & $EMULATOR -list-avds
   $device = Read-Host "Escolha o Device: Ex: Pixel_3a_API_33_x86_64"
   & $EMULATOR -avd $device -writable-system 
}

function emulaor-adv-write-nocache{
   Write-Host "Iniciar Virtual device"
   & $EMULATOR -list-avds
   $device = Read-Host "Escolha o Device: Ex: Pixel_3a_API_33_x86_64"
   & $EMULATOR -avd $device -writable-system -no-snapshot-load
}

function emulaor-adv-wipe-data{
   Write-Host "Iniciar Virtual device"
   & $EMULATOR -list-avds
   $device = Read-Host "Escolha o Device: Ex: Pixel_3a_API_33_x86_64"
   & $EMULATOR -avd $device -wipe-data
}

function activis{
   Write-Host "Ininicar Activi"
   $pacote = Read-Host "Digite o pacote:"
   $acao = Read-Host "Qual acao"
   & $ADB shell am start -n $pacote -a $acao
}

function proxy{
   Write-Host "Emular com proxy"
   & $EMULATOR -list-avds
   $device = Read-Host "Escolha o Device: Ex: Pixel_3a_API_33_x86_64"
   $ip = Read-Host "Digite o ip:"
   $porta = Read-Host "Digite a porta:"
   $dns = Read-Host "Digite o ip dns:"
   & $EMULATOR -avd $device -http-proxy $ip":"$porta -dns-server $dns 
}

function processes{
   Write-Host "FRIDA MODULO - List Running Processes"
   frida-ps -U
}

function applications{
   Write-Host "FRIDA MODULO - List Running Applications" 
   frida-ps -Ua   
}

function installed{
   Write-Host "FRIDA MODULO - List Installed Applications"
   frida-ps -Uai  
}

function inject{
   echo "FRIDA MODULO - List Installed Applications" 
   frida-ps -Uai 
   Write-Host "Obs: Para alguns script, só funciona se o AVD for iniciado em modo Write"
   echo "Frida run script"
   $identifier = Read-Host "Select Identifier:"
   $script = Read-Host "Select script.js:"
   frida -U -f $identifier -l $script 
   
}

function iptable{
   Write-Host "Show IPTABLES"
   & $ADB shell su -c iptables -L
}

function list-packages{
   Write-Host "List Packages"
   & $ADB shell pm list packages 
}

function list-packages-s{
   Write-Host "List Packges System"
   & $ADB shell pm list packages -s
}

function list-packages-3{
   Write-Host "List Packges 3º"
   & $ADB shell pm list packages -3
}

function frida-exec{
   Write-Host "Iniciando Servidor Frida"
   & $ADB shell su -c "nohup /data/local/tmp/frida-server &"  
   
}

function caminho-pacote{
   Write-Host "Mostrar Caminho do APK"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm path $pacote
   
}

function clean-pacote{
   Write-Host "Limpar dados de um aplicativo"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm clean $pacote
 
}

function disable-pacote{
   Write-Host "Desativar pacote"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm disable $pacote
 
}

function enable-pacote{
   Write-Host "Reativar pacote"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm enable $pacote
 
}

function hide-pacote{
   Write-Host "Esconde o pacote"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm hide $pacote
 
}

function unhide-pacote{
   Write-Host "Exibição de pacote oculto"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm unhide $pacote
 
}

function grant-pacote{
   Write-Host "Concede permissao"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm grant $pacote
 
}

function revoke-pacote{
   Write-Host "Revogar permissao"
   & $ADB shell pm list packages 
   $pacote = Read-Host "Qual nome do pacote:"
   & $ADB shell pm revoke $pacote
 
}


function contatos{
   Write-Host "Ver contatos"
   & $ADB shell content query --uri content://com.android.contacts/data 
}

function logcat{
   Write-Host "Iniciando Logcat"
   & $ADB shell su -c "logcat"  
   
}

function logcat-grep{
   Write-Host "Iniciando Logcat com Grep"
   $grep = Read-Host "Digite a palavra de pesquisa:"
   & $ADB shell su -c "logcat | grep -E $grep"  
   
}

function access-url{
   $pacote = Read-Host "Digite a URL para acessar:"
   & $ADB shell am start -a android.intent.action.VIEW  $pacote
 
}

function call-number{
   $pacote = Read-Host "Ligar para o numero:"
   & $ADB shell am start -a android.intent.action.CALL -d tel:$pacote
 
}

function geo{
   $pacote = Read-Host "Pesquisar no Geolocalização:"
   & $ADB shell am start -a android.intent.action.VIEW geo:0,0?q=$pacote
 
}

function limpar-log-cat{
   Write-Host "Limpando o Logcat"
   & $ADB shell logcat -c
 
}

function processos{
   Write-Host "Show Processos"
   & $ADB shell ps -A 
 
}

function PID-log-cat{
   $PIDs = Read-Host "Digite o PID para filtro:"
   & $ADB shell logcat --pid=$PIDs
 
}


function inject-mult{
    echo "FRIDA MODULO - List Installed Applications"
    frida-ps -Uai
    Write-Host "Obs: Para alguns script, só funciona se o AVD for iniciado em modo Write"
    echo "Frida run script"

    $identifier = Read-Host "Select Identifier:"

    $count = Read-Host "Quantos scripts você quer carregar? (digite 0 para nenhum)"
    if (-not [int]::TryParse($count, [ref]$null)) {
        Write-Host "Entrada inválida. Usando 1 script por padrão."
        $count = 1
    } else {
        $count = [int]$count
        if ($count -lt 0) { $count = 0 }
    }

    $scriptPaths = @()
    for ($i = 1; $i -le $count; $i++) {
        $p = Read-Host "Caminho do script #$i (ex: C:\pasta\meu.js)"
        if ($p -ne "") { $scriptPaths += $p }
    }

    if ($scriptPaths.Count -eq 0) {
        $single = Read-Host "Select script.js:"
        if ($single -ne "") { $scriptPaths += $single }
    }

    $args = @('-U', '-f', $identifier)
    foreach ($sp in $scriptPaths) {
        $args += '-l'
        $args += $sp
    }

    Write-Host "Executando: frida $($args -join ' ')"
    & frida @args
}



#function  {
   #Write-Host ""
   
#}



function Banner1 {
    $banner = @'

    ____             _     ______             __ __ _ __ 
   / __ \_________  (_)___/ / __ \___  ____  / //_/(_) /_
  / / / / ___/ __ \/ / __  / /_/ / _ \/ __ \/ ,<  / / __/
 / /_/ / /  / /_/ / / /_/ / ____/  __/ / / / /| |/ / /_  
/_____/_/   \____/_/\__,_/_/    \___/_/ /_/_/ |_/_/\__/  
                               by bl4dsc4n version 1.0                                       

Use:  .\DroidPenKit.ps1 5

1  = Shell ou Shell CMD
2  = Listar Devices
3  = Kill Server
4  = Start Server
5  = Iniciar Monitor
6  = Download File Device
7  = Upload File Device
8  = Install APK Device
9  = Reinstala APK mantendo os dados 
10 = Install Permite downgrade
11 = Install com todas as permissões
12 = Install instantanea
13 = Remove APK Device
14 = Remover Pacote do device
15 = Desinstala, mas mantendo os dados
16 = Limpar dados de um aplicativo
17 = Desativar pacote
18 = Ativar pacote
19 = Esconder pacote
20 = Reexibir Pacote oculto
21 = Concede permissao
22 = Remover permissao
23 = List AVDS
24  = Emular AVDS
25  = Emular AVDS Write
26  = Emular AVDS Write-nocache
27  = Emular AVDS Wipe Data
28  = Ininicar Activi
29  = Proxy
30  = Frida - List Running Processes
31  = Frida - List Running Applications
32  = Frida - List Installed Applications
33  = Frida - Inject Script 
34  = Listar Regras do IPtables 
35  = List Packages
36  = List Packages system
37  = List Packages Terceiros
38  = Iniciar Servidor Frida /data/local/frida-server
39  = Verificar caminho do APK
40  = Abrir URL
41  = Call Number
42  = Pesquisar Geolocal
43  = Ver contatos
44  = Exec logcat
45  = Exec logcat + grep
46  = Limpar logcat
47  = Exec logcat filter PID
48  = Show Processos
49  = Frida - Inject multiplos Script
'@

    Write-Host $banner
}


switch ($p1) {
    1 { Shell }
    2 { listar }
    3 { kill }
    4 { start }
    5 { Monitor }
    6 { download }
    7 { upload }
    8 { install }
    9 { install1 }
    10 { install2 }
    11 { install3 }
    12 { install4 }
    13 { remove }
    14 { remove1 }
    15 { remove2 }
    16 { clean-pacote }
    17 { disable-pacote }
    18 { enable-pacote }
    19 { hide-pacote }
    20 { unhide-pacote }
    21 { grant-pacote }
    22 { revoke-pacote }
    23 { list-devices }
    24 { emular-avd }
    25 { emular-avd-write }
    26 { emulaor-adv-write-nocache }
    27 { emulaor-adv-wipe-data }
    28 { activis }
    29 { proxy }
    30 { processes }
    31 { applications }
    32 { installed }
    33 { inject }
    34 { iptable }
    35 { list-packages }
    36 { list-packages-s }
    37 { list-packages-3 }
    38 { frida-exec }
    39 { caminho-pacote }
    40 { access-url }
    41 { call-number }
    42 { geo }
    43 { contatos }
    44 { logcat }
    45 { logcat-grep }
    46 { limpar-log-cat }
    47 { PID-log-cat }
    48 { processos }
    49 { inject-mult }
    default { banner1 }
}
