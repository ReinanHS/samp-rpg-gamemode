// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <a_zones>
#include <DOF2>
#include <zcmd>
#include <sscanf2>
#include <CpsTream>

//------------------------- { - DEFINIÇÕES - } ---------------------------------
// Init Gamemode + configs
#define SERVER_NAME_INIT "• [SL] Iniciando Servidor... •"
#define SERVER_NAME "• [SL] Skylandia Cidade Vida Real •"
#define SERVER_GAMEMODE "Brasil RPG ® 2018"
#define SERVER_PASSWORD "29n7nd7jak3" // Senha aleatoria, só para evitar de alguém logar antes do servidor liberar.
#define SERVER_LANGUAGE "Português - Brasil"
//==========[ DIALOGS ]=======       ==[ IDs ]==
#define     DialogRegistro              (1)		// DEFINE DIALOG REGISTRO (ID= 1)
#define     DialogLogin                 (2)		// DEFINE DIALOG LOGIN   (ID= etc..)
#define     DialogEmail                 (3)		// DEFINE DIALOG Email
#define     DialogSexo                  (4)		// DEFINE DIALOG Sexo
#define     DialogMercado               (5)		// DEFINE DIALOG Da Loja 27/7
#define     DialogGPS                   (6)		// DEFINE DIALOG Do GPS
#define     DialogMenuAgencia           (7)		// DEFINE DIALOG Do Menu da Agência de empregos
#define     DialogHonestas              (8)		// DEFINE DIALOG Do Menu da Agência de empregos
#define     DialogTransportes           (9)		// DEFINE DIALOG Do Menu da Agência de empregos
#define     DialogPolicias              (10)	// DEFINE DIALOG Do Menu da Agência de empregos
#define     DialogForcasArmadas         (11)	// DEFINE DIALOG Do Menu da Agência de empregos
#define     DialogAutoEscola            (12)	// Auto Escola
#define     DialogCarregarPetroleiro    (13)	// Petroleiro
#define     DialogProfissao             (14)	// Profissao
#define     DialogScore                 (15)	// Score ou Level
#define     DialogPostoDeGasolina       (16)	// Posto De Gasolina
#define     DialogPostoGasolina       	(17)	// Posto Table de Gasolina
#define     DialogPostoEtanol       	(18)	// Posto Table de Etanol 
#define     DialogPostoGNV       		(19)	// Posto Table de GNV 
#define     DialogPostoDiesel       	(20)	// Posto Table de Diesel 
#define 	DialogAdmins				(21)	// Administrador Online


//------------------------- { - DEFINIÇÕES - COR} ---------------------------------
#define COR_ERRO            0xFF0000FF
#define COR_SUCCESS         0x008000AA
#define COR_WARNING         0xFF8000AA

//Profissões

#define Desempregado              0

// - Honestas

#define Fotografo                 1
#define Paramedico                2

// - Transportes

#define Petroleiro                3
#define Concreteiro               4

// - Policias

#define PMilitar                  5
#define Interpol                  6

// - Forças Armadas

#define Exercito                  7
#define Aeronautica               8

//Cores Profissão

// Cores - Honestas

#define C_Fotografo                0x808080AA
#define C_Paramedico               0xFF1493AA

// Cores - Tranportes

#define C_Petroleiro               0x1E90FFAA
#define C_Concreteiro              0x778899AA

// Cores - Policias

#define C_PMilitar                 0x6495EDAA
#define C_Interpol                 0x00FFFFAA

// Cores - Forças Armadas

#define C_Exercito                 0x6B8E23AA
#define C_Aeronautica              0x7FFFD4AA

// Salários

#define Salario_Desempregado       100

// Salário - Honestas

#define Salario_Fotografo          600
#define Salario_Paramedico         700

// Salário - Transportes

#define Salario_Petroleiro          1100
#define Salario_Concreteiro         1200

// Salário - Policias

#define Salario_PMilitar            2100
#define Salario_Interpol            2500

// Salário - Forças Armadas

#define Salario_Exercito            3000
#define Salario_Aeronautica         3500

//Cores

#define Vermelho                                                                0xFF0000AA
#define Branco                                                                  0xFFFFFFAA
#define Amarelo                                                                 0xFFFF00AA

#define VALOR_LITRO 2.0                           //- Definir valor por litro da gasolina
#define RETIRAR_KM  16                            //- A Cada 16 KM ,retirar 1 de gasolina

// GPS
#define GPS_ID		1
#define GPS_ICON	41

//------------------------------------------------------------------------------

//------------------------- { - VARIÁVEIS - } ----------------------------------


new InAutoEscola[MAX_PLAYERS];
new InAutoEscolaType[MAX_PLAYERS];
new carroauto[MAX_PLAYERS];
new CPAutoEscola;
new carregado[MAX_PLAYERS] = 0;
new Aviso[MAX_PLAYERS];
new Log[256];

new point[MAX_PLAYERS];
new Float:AutoPoints[16][3] = //Cordenadas dos Race Checkpoints
{
    {1535.5942,-1457.8770,12.0806},
    {1468.1927,-1438.7798,13.2615},
    {1426.9215,-1580.5010,13.2443},
    {1426.1265,-1718.1543,13.2614},
    {1386.0983,-1747.1523,13.2613},
    {1412.6836,-1875.0875,13.2613},
    {1665.5758,-1873.0076,13.2670},
    {1691.4797,-1817.2625,13.2671},
    {1811.8418,-1834.3431,13.2771},
    {1815.5009,-1729.4799,13.2613},
    {1692.3575,-1730.3171,13.2646},
    {1690.5511,-1598.3267,13.2634},
    {1660.3773,-1578.7968,13.2690},
    {1660.3748,-1456.0530,13.2638},
    {1535.1095,-1437.5797,13.2614},
    {1535.1095,-1437.5797,13.2614}
};

new Float:PostosDeGasolina[17][3] = 
{
	{614.2350,1688.6681,6.6966}, 		// Posto de Bone County
	{2147.2913,2748.4233,10.5247}, 		// Posto de Spinybed
	{2639.6121,1106.8522,10.3771}, 		// Posto de Las Venturas
	{1942.4498,-1772.7539,13.3906},		// posto
	{1004.0529,-938.4166,41.7306}, 		// Posto de Temple
	{-1607.2217,-2714.9656,48.1127}, 	// posto de whetstone
	{-2244.1399,-2558.9602,31.4957}, 	// posto de angel pine
	{-2028.1998,156.6336,28.3998}, 		// Posto de Doherty
	{-1676.0660,413.3091,6.7472}, 		// Posto de Easter Basin
	{-2409.0630,976.4838,44.8595}, 		// Posto de Juniper Hollow
	{-1329.1506,2677.6660,49.6365}, 	// Posto de Tirra Robada
	{-1471.1528,1863.7711,32.2063}, 	// Posto de Tirra Robada 2
	{70.7164,1219.1143,18.3873}, 		// Posto de Fort Carson
	{1595.3184,2199.4099,10.3948}, 		// Posto de Redsands west
	{2202.8074,2474.8928,10.3939}, 		// Posto de The Emerald Isle
	{2114.5654,921.0345,10.3901}, 		// Posto de Las Venturas
	{1382.3008,460.9545,19.6525} 		// Posto de Montgomery
};

// Give Veiculo
new Vehicle[MAX_PLAYERS];

enum pDados
{
        Admin,
        Profissao,
        exp,
        ultimoLogin,
        bool:trabalhando,
		multas,
		bool:HabN,
		bool:HabA,
		bool:HabT_1,
		bool:HabT_2,
		bool:HabT_3,
		bool:TaPreso,
		MinPreso,
		SegPreso,
        gasolina,
        etanol,
        gnv,
        diesel,
        bool: vip

}
enum mInfo
{
    bool:Celular,
    bool:PedagioSemPagar,
    bool:GPS,
    bool:Oculos,
    bool:Bone,
    bool:Gorro,
    bool:Capacete,
    bool:Arara
}
new MercadoInfo[MAX_PLAYERS][mInfo];

new PlayerDados[MAX_PLAYERS][pDados];
new bool:Logado[MAX_PLAYERS char];
new SenhaErrada[MAX_PLAYERS];
new Str[210];

new Text:Logo;
new Text:Versao;
new Text:site;
new Text:Rodape;

new Text:textVelocimetro[5];

// (Vendo o velocimetro ou não}
new bool:PlayerVelocimetro[MAX_PLAYERS];
new PlayerText:textPlayerVelocimetro[6][MAX_PLAYERS];
 
// (Timer velocimetro}
new PlayerVelocimetroTimer[MAX_PLAYERS];

new VehicleNames[212][] =
{
    {"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
    {"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
    {"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
    {"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
    {"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
    {"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
    {"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
    {"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
    {"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
    {"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
    {"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
    {"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
    {"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
    {"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
    {"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
    {"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
    {"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
    {"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
    {"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
    {"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
    {"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
    {"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
    {"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
    {"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
    {"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
    {"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},
    {"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
    {"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
    {"Utility Trailer"}
};

new
bool:Avisado[500],
Retirada[MAX_PLAYERS],
Motor[MAX_PLAYERS]
;

new Float:pPosX[MAX_PLAYERS];
new Float:pPosY[MAX_PLAYERS];
new Float:pPosZ[MAX_PLAYERS];

new Float:iPosX[MAX_PLAYERS];
new Float:iPosY[MAX_PLAYERS];
new Float:iPosZ[MAX_PLAYERS];

forward ProcessGameTime(playerid);
forward MapIcon(playerid);
//Checkpoints

new CheckAgencia;
new
    petroleiroCar[18],
    taxiCar[7],
    VeiculoPublico[37];

new bool:HQ[MAX_PLAYERS] = false;
new respawntrailer;

//------------------------------------------------------------------------------

#if defined GAMEMODE
#endif

main()
{
	print("\n=======================================================\n");
	print(" [SL] Iniciando Servidor...");
	print("\n Aguardando A Inicialização Para Liberação Do Servidor.");
	print("\n=======================================================\n");
}

public OnGameModeInit()
{
    // Basic Config
    new Gamemode[256], Hostname[256], Password[256], Language[256];
	format(Gamemode, sizeof(Gamemode), "%s", SERVER_GAMEMODE);
	format(Hostname, sizeof(Hostname), "hostname %s", SERVER_NAME_INIT);
	format(Password, sizeof(Password), "password %s", SERVER_PASSWORD);
	format(Language, sizeof(Language), "language %s", SERVER_LANGUAGE);
	SetGameModeText(Gamemode);
	SendRconCommand(Hostname);
	SendRconCommand(Password);
	SendRconCommand(Language);

    print("\n----------------------------------");
	print(" Skylandia Cidade Vida Real");
    print(" v0.0.1");
    print(" BY ReinanHS");
	print("----------------------------------\n");

    if(fexist("/Contas/")) print("A pasta Contas foi encontrada!"), print("Sistema De Login carregado com sucesso!");
    else print("A pasta Contas não foi encontrada!"), SendRconCommand("exit");
    SetGameModeText("Brasil: SLR RPG v0.0.1");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
    DisableInteriorEnterExits(); // desativar entradas em lojas/casas ( pikcups amarelos ) do jogo normal
    EnableStuntBonusForAll(0); // desativar stunt bonus ( grana por empinar, ficar maior tempo no ar, etc...)
    UsePlayerPedAnims();
    ManualVehicleEngineAndLights();
    SetTimer("ProcessGameTime", 1000, 1);

    //Texto da tela de login e registro
    Logo = TextDrawCreate(160.000000, 310.000000, "SKYLANDIA CIDADE VIDA REAL");
    TextDrawBackgroundColor(Logo, 255);
    TextDrawFont(Logo, 3);
    TextDrawLetterSize(Logo, 0.700000, 5.000000);
    TextDrawColor(Logo, -5963521);
    TextDrawSetOutline(Logo, 1);
    TextDrawSetProportional(Logo, 1);
    TextDrawSetSelectable(Logo, 0);

    Versao = TextDrawCreate(290.000000, 363.000000, "v0.0.1");
    TextDrawBackgroundColor(Versao, 255);
    TextDrawFont(Versao, 2);
    TextDrawLetterSize(Versao, 0.600000, 2.000000);
    TextDrawColor(Versao, -172935425);
    TextDrawSetOutline(Versao, 1);
    TextDrawSetProportional(Versao, 1);
    TextDrawSetSelectable(Versao, 0);

    site = TextDrawCreate(177.000000, 389.000000, "www.skylandia.com.br");
    TextDrawBackgroundColor(site, 255);
    TextDrawFont(site, 2);
    TextDrawLetterSize(site, 0.600000, 2.000000);
    TextDrawColor(site, -421075201);
    TextDrawSetOutline(site, 1);
    TextDrawSetProportional(site, 1);
    TextDrawSetSelectable(site, 0);

    Rodape = TextDrawCreate(3.000000, 429.000000, "Skylandia Cidade Vida Real v0.0.1");
    TextDrawBackgroundColor(Rodape, 255);
    TextDrawFont(Rodape, 1);
    TextDrawLetterSize(Rodape, 0.450000, 1.699998);
    TextDrawColor(Rodape, -2686721);
    TextDrawSetOutline(Rodape, 1);
    TextDrawSetProportional(Rodape, 1);
    TextDrawUseBox(Rodape, 1);
    TextDrawBoxColor(Rodape, 269554431);
    TextDrawTextSize(Rodape, 637.000000, -129.000000);
    TextDrawSetSelectable(Rodape, 0);

    /*              PICKUPS De lugares Publicos             */
    AddStaticPickup(1318,23,1733.5103,-1912.0349,13.5620);// Entrada Da Agência de Empregos
    AddStaticPickup(1318,23,390.7674,173.7650,1008.3828);// Saida Da Agência de Empregos
    AddStaticPickup(1318,23,1833.7811,-1842.6208,13.5781);// Entrada Mercado 24/7 (ID: 0)
    AddStaticPickup(1318,23,-27.3571,-58.2683,1003.5469);// Saida Mercado 24/7 (ID: 0)
    AddStaticPickup(1239,23,-22.1867,-55.6953,1003.5469);// Menu Mercado 24/7 De Compras
    AddStaticPickup(1318,23,1519.1331,-1453.9199,14.2084);// Entrada Auto Escola (ID: 0)
    AddStaticPickup(1318,23,1494.325195,1304.942871,1093.289062);// Saida Auto Escola (ID: 0)
    /*              3D TEXTS                               */
    Create3DTextLabel("{FFFFFF}Agência de Empregos\nAperte {00FFFF}'F' {FFFFFF}Para Entrar",50,1733.5103,-1912.0349,13.5620,15,0);// Entrada Da Agência de Empregos
    Create3DTextLabel("{FFFFFF}Agência de Empregos\nAperte {00FFFF}'F' {FFFFFF}Para Sair",50,390.7674,173.7650,1008.3828,15,0);// Saida Da Agência de Empregos
    Create3DTextLabel("{FFFFFF}Mercado 24/7\nAperte {00FFFF}'F' {FFFFFF}Para Entrar",50,1833.7811,-1842.6208,13.5781,15,0);// Entrada Mercado 24/7 (ID: 0)
    Create3DTextLabel("{FFFFFF}Mercado 24/7\nAperte {00FFFF}'F' {FFFFFF}Para Sair",50,-27.3571,-58.2683,1003.5469,15,0);//Saida Mercado 24/7 (ID: All)
    Create3DTextLabel("{FFFFFF}Menu do Mercado 24/7\nAperte {00FFFF}'F' Ou Use /mercado\n{FFFFFF}Para Comprar",50,-22.1867,-55.6953,1003.5469,15,0);// Menu do Mercado 24/7
    Create3DTextLabel("{FFFFFF}Auto Escola\nAperte {00FFFF}'F' {FFFFFF}Para Entrar",50,1519.1331,-1453.9199,14.2084,15,0);// Entrada Mercado 24/7 (ID: 0)
    Create3DTextLabel("{FFFFFF}Auto Escola\nAperte {00FFFF}'F' {FFFFFF}Para Sair",50,1494.325195,1304.942871,1093.289062,15,0);//Saida Mercado 24/7 (ID: All)
    // Petroleiro
    Create3DTextLabel("{FF0000}Área de Carregamento -->",50,258.6384,1416.1042,10.1746,30,0);//Área de Carregamento - Petroleiro
    Create3DTextLabel("{FF0000}<-- Área de Carregamento",50,269.8310,1484.4167,10.2540,30,0);//Área de Carregamento - Petroleiro
    Create3DTextLabel("{FF0000}Entrada",50,293.1352,1416.2681,10.6482,30,0);//Entrada - Petroleiro
    Create3DTextLabel("{FF0000}Saída",50,293.4501,1408.0776,10.6007,30,0);//Saída - Petroleiro


    //Checks
	CheckAgencia = CPS_AddCheckpoint(363.0818,173.8653,1008.3828, 1.0, 50);// Local de pegar Profissão
    CPAutoEscola = CPS_AddCheckpoint(1490.9628,1305.9032,1093.2964,1.0,50);// Auto Escola

    // Veiculos de petoleiro
    petroleiroCar[0] = AddStaticVehicleEx(514,321.0000000,1395.5996000,8.5000000,73.9930000,37,37,15); //Tanker
	petroleiroCar[1] = AddStaticVehicleEx(514,319.1000100,1389.9000000,8.8000000,73.9980000,37,37,15); //Tanker
	petroleiroCar[2] = AddStaticVehicleEx(514,317.3999900,1384.9000000,8.7000000,73.9980000,37,37,15); //Tanker
	petroleiroCar[3] = AddStaticVehicleEx(514,315.0000000,1375.9000000,9.0000000,73.9980000,37,37,15); //Tanker
	petroleiroCar[4] = AddStaticVehicleEx(514,312.5000000,1370.8000000,9.4000000,73.9980000,37,37,15); //Tanker
	petroleiroCar[5] = AddStaticVehicleEx(514,311.0000000,1365.7000000,9.9000000,73.9980000,37,37,15); //Tanker
	petroleiroCar[6] = AddStaticVehicleEx(514,308.7998000,1355.2002000,9.9000000,73.9930000,37,37,15); //Tanker
	petroleiroCar[7] = AddStaticVehicleEx(514,307.3999900,1349.9000000,9.9000000,73.9930000,37,37,15); //Tanker
	petroleiroCar[8] = AddStaticVehicleEx(514,305.3999900,1343.9000000,9.9000000,73.9930000,37,37,15); //Tanker
	petroleiroCar[9] = AddStaticVehicleEx(514,331.5000000,1470.6000000,8.2000000,79.9910000,37,37,15); //Tanker
	petroleiroCar[10] = AddStaticVehicleEx(514,334.0000000,1483.2002000,8.5000000,79.9910000,37,37,15); //Tanker
	petroleiroCar[11] = AddStaticVehicleEx(514,333.2000100,1476.7000000,8.3000000,79.9910000,37,37,15); //Tanker
	petroleiroCar[12] = AddStaticVehicleEx(514,330.6000100,1464.4000000,8.1000000,79.9910000,37,37,15); //Tanker
	petroleiroCar[13] = AddStaticVehicleEx(514,329.7000100,1458.7000000,8.1000000,79.9910000,37,37,15); //Tanker
	petroleiroCar[14] = AddStaticVehicleEx(514,327.9003900,1452.0000000,8.1000000,79.9910000,37,37,15); //Tanker
	petroleiroCar[15] = AddStaticVehicleEx(514,304.3999900,1471.0000000,10.2000000,267.9900000,37,37,15); //Tanker
	petroleiroCar[16] = AddStaticVehicleEx(514,306.2999900,1464.4000000,10.2000000,267.9900000,37,37,15); //Tanker

	// Veiculos De Taxi

	taxiCar[0] = AddStaticVehicleEx(420,1802.4000000,-1908.1000000,13.3000000,87.9950000,215,142,15); //Taxi
	taxiCar[1] = AddStaticVehicleEx(420,1802.3000000,-1912.2000000,13.3000000,87.9950000,215,142,15); //Taxi
	taxiCar[2] = AddStaticVehicleEx(420,1802.6000000,-1903.9000000,13.3000000,87.9950000,215,142,15); //Taxi
	taxiCar[3] = AddStaticVehicleEx(420,1802.2000000,-1917.0000000,13.3000000,87.9950000,215,142,15); //Taxi
	taxiCar[4] = AddStaticVehicleEx(420,1802.0000000,-1922.3000000,13.3000000,87.9950000,215,142,15); //Taxi
	taxiCar[5] = AddStaticVehicleEx(420,1802.0000000,-1927.3000000,13.3000000,87.9950000,215,142,15); //Taxi
	taxiCar[6] = AddStaticVehicleEx(420,1802.0000000,-1932.3000000,13.3000000,87.9950000,215,142,15); //Taxi

    /*=========================[  VEICULO PUBLICOS ]============================*/

	VeiculoPublico[0] = AddStaticVehicle(533,1177.2534,-1339.2512,13.6410,270.2252,166,166); // veiculo publico hosp LS
 	VeiculoPublico[1] = AddStaticVehicle(533,1176.2803,-1308.2930,13.6276,268.5153,166,166); // veiculo publico 2 hops LS
 	VeiculoPublico[2] = AddStaticVehicleEx(400,1836.5000000,-1853.3000000,13.5000000,0.0000000,32,32,15); //Landstalker
 	VeiculoPublico[3] = AddStaticVehicleEx(400,1840.0000000,-1853.3000000,13.5000000,0.0000000,32,32,15); //Landstalker
	VeiculoPublico[4] = AddStaticVehicle(533,2001.0774,-1413.2158,16.7013,178.6218,166,166); // veiculo puclico hosp groove LS
	VeiculoPublico[5] = AddStaticVehicle(533,2033.3418,-1447.0807,16.9472,87.6349,166,166); // veiculo publico hosp groove LS
	VeiculoPublico[6] = AddStaticVehicle(533,1316.0635,-1372.9760,13.3378,129.7551,166,166); // veiculo publico banco LS
    VeiculoPublico[7] = AddStaticVehicle(533,2287.7800,-1683.8911,13.5867,359.7079,166,166); // veiculo publico Groove Street
	VeiculoPublico[8] = AddStaticVehicle(533,356.7217,-1809.6923,4.2307,0.5768,166,166); // veiculo publico praia LS
	VeiculoPublico[9] = AddStaticVehicle(533,695.2949,-473.2573,16.0451,268.3583,166,166); //
	VeiculoPublico[10] = AddStaticVehicle(533,219.0612,-170.7969,1.2872,90.6037,166,166); //
	VeiculoPublico[11] = AddStaticVehicle(533,-305.6332,1036.3745,19.3028,269.9891,166,166); //
	VeiculoPublico[12] = AddStaticVehicle(533,-305.5352,1031.9607,19.3028,269.7962,166,166); //
	VeiculoPublico[13] = AddStaticVehicle(533,-2241.1777,2357.1633,4.6886,41.3484,166,166); //
	VeiculoPublico[14] = AddStaticVehicle(533,-2589.9038,622.2837,14.1683,270.9962,166,166); //
	VeiculoPublico[15] = AddStaticVehicle(533,-2589.6951,627.7159,14.1683,270.0329,166,166); //
	VeiculoPublico[16] = AddStaticVehicle(533,1602.1212,1839.6050,10.5294,0.5195,166,166); //
	VeiculoPublico[17] = AddStaticVehicle(533,1597.8785,1839.6631,10.5294,1.2302,166,166); //
	VeiculoPublico[18] = AddStaticVehicle(533,-2142.6628,-2258.1833,30.3376,51.8007,166,166); //
 	VeiculoPublico[19] = AddStaticVehicle(533,-1525.2711,-2749.9724,48.2481,169.2007,166,166); //
	VeiculoPublico[20] = AddStaticVehicle(533,-1530.1477,-2748.2825,48.2481,170.4409,166,166); //
	VeiculoPublico[21] = AddStaticVehicle(533,-2093.9834,-84.1647,34.8732,1.0069,166,166); //
	VeiculoPublico[22] = AddStaticVehicle(533,-1651.8678,1311.8181,6.7432,135.6502,166,166); //
	VeiculoPublico[23] = AddStaticVehicle(533,-866.1396,1563.2594,24.2470,270.8895,166,166); //
	VeiculoPublico[24] = AddStaticVehicle(533,-1525.4843,2525.2244,55.4696,0.9549,166,166); //
	VeiculoPublico[25] = AddStaticVehicle(533,-225.8166,2594.8748,62.4122,0.3951,166,166); //
	VeiculoPublico[26] = AddStaticVehicle(533,1422.3186,277.1342,19.2638,123.3392,166,166); //
	VeiculoPublico[27] = AddStaticVehicle(533,2470.1538,-44.9585,26.1934,1.3549,166,166); //
	VeiculoPublico[28] = AddStaticVehicle(533,1715.3514,1472.8787,10.4524,163.3114,166,166); //
	VeiculoPublico[29] = AddStaticVehicle(533,1711.3990,1459.5245,10.4567,163.3424,166,166); //
	VeiculoPublico[30] = AddStaticVehicle(533,2410.1479,2334.2329,10.5294,181.0676,166,166); //
	VeiculoPublico[31] = AddStaticVehicle(533,2455.2422,1357.6515,10.5294,180.8293,166,166); //
	VeiculoPublico[32] = AddStaticVehicle(533,1152.2407,1369.3727,10.3810,270.9418,166,166); //
	VeiculoPublico[33] = AddStaticVehicle(533,-86.9006,1221.8394,19.4513,182.0488,166,166); //
	VeiculoPublico[34] = AddStaticVehicle(533,-13.7728,-2519.3652,36.3645,30.2527,166,166); //
	VeiculoPublico[35] = AddStaticVehicle(533,1536.0165,-1677.9349,13.0919,180.9664,166,166); //
	VeiculoPublico[36] = AddStaticVehicle(562,2746.4739,-2459.2637,13.3080,271.7818,166,166); //

    SetTimer("ServerInit", 1000, false);

    return 1;
}

public OnGameModeExit()
{

	for(new i,a = GetMaxPlayers(); i < a; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Logado{i} == true) {
				printf("A conta do player %s salva!", getName(i));

		    	GetPlayerPos(i, pPosX[i], pPosY[i], pPosZ[i]);
		    	SalvarDados(i);
		    	Logado{i} = false;
		    }
		    else{
		    	printf("A conta do player %s não pode ser salva!", getName(i));
		    }
		    Kick(i);  	
		}
	}


    DOF2_Exit();
    TextDrawDestroy(Logo);
    TextDrawDestroy(Versao);
    TextDrawDestroy(site);
    TextDrawDestroy(Rodape);

	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
        TogglePlayerSpectating(playerid, true);
		InterpolateCameraPos(playerid, 1392.9325, -1733.4246, 91.8287, 1112.7428, -1593.4954, 65.8049, 8000, CAMERA_CUT);
		InterpolateCameraLookAt(playerid, 1393.7410, -1732.8302, 91.1735, 1113.0087, -1594.4611, 65.4747, 8000, CAMERA_CUT);

        new str[80];

        if(!DOF2_FileExists ( PegarConta (playerid) ) )
        {
            format(str, sizeof(str), "Seja bem-vindo %s pela primeira vez em nosso servidor!", getName(playerid));
            SendClientMessage(playerid, 0x808080AA, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            SendClientMessage(playerid, 0x13A9F6AA, str);
            SendClientMessage(playerid, 0x13A9F6AA, "» Para ver os comandos do servidor Digite: /Ajuda Comandos");
            SendClientMessage(playerid, 0x808080AA, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            format(Str, sizeof(Str), "{FFFFFF}Bem-vindo(a) ao {FFA500}SKYLANDIA {26AB0C}RPG{FFFFFF}\n\nConta: %s\nStatus: {FF0000}Não registrada{26AB0C}\n\nVersão 0.1 {FFFFFF}- Não há notícias, fique atento ao fórum!\n* Insira sua senha abaixo para registrar-se:\n> {FF0000}OBS: {FFFFFF}Por segurança, jamais compartilhe sua senha!", getName(playerid));
            ShowPlayerDialog(playerid, DialogRegistro, DIALOG_STYLE_PASSWORD, "{FFA500}Registro", Str, "Registrar", "Sair");
        }
        else
        {
            format(str, sizeof(str), "» Seja bem-vindo %s novamente em nosso servidor!", getName(playerid));
            SendClientMessage(playerid, 0x808080AA, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            SendClientMessage(playerid, 0x13A9F6AA, str);
            SendClientMessage(playerid, 0x13A9F6AA, "» Para ver os comandos do servidor Digite: /Ajuda Comandos");
            SendClientMessage(playerid, 0x808080AA, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            format(Str, sizeof(Str), "{FFFFFF}Bem-vindo(a) ao {FFA500}SKYLANDIA {26AB0C}RPG{FFFFFF}\n\nConta: %s\nStatus: {00FF00}Registrada{26AB0C}\n\nVersão 1.6 {FFFFFF}- Não há notícias, fique atento ao fórum!\n* Insira sua senha abaixo para logar:", getName(playerid));
            ShowPlayerDialog(playerid, DialogLogin, DIALOG_STYLE_PASSWORD, "{FFD700}Login", Str, "Logar", "Sair");
        }
        return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, 0x0080FFAA, "| INFO | Aguarde... Carregando os dados!");
    Logado{playerid} = false;

    TextDrawShowForPlayer(playerid,Logo);
    TextDrawShowForPlayer(playerid,Versao);
    TextDrawShowForPlayer(playerid,site);

    // Velocimetro:

	textPlayerVelocimetro[0][playerid] = CreatePlayerTextDraw(playerid,191.000000, 362.000000, "SANCHEZ");
	PlayerTextDrawBackgroundColor(playerid,textPlayerVelocimetro[0][playerid], 255);
	PlayerTextDrawFont(playerid,textPlayerVelocimetro[0][playerid], 2);
	PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[0][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,textPlayerVelocimetro[0][playerid], 512819199);
	PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[0][playerid], 0);
	PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[0][playerid], 1);
	PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[0][playerid], 1);
	PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[0][playerid], 0);

	textPlayerVelocimetro[1][playerid] = CreatePlayerTextDraw(playerid,140.000000, 357.000000, "200");
	PlayerTextDrawBackgroundColor(playerid,textPlayerVelocimetro[1][playerid], 255);
	PlayerTextDrawFont(playerid,textPlayerVelocimetro[1][playerid], 2);
	PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[1][playerid], 0.600000, 2.900000);
	PlayerTextDrawColor(playerid,textPlayerVelocimetro[1][playerid], -1);
	PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[1][playerid], 1);
	PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[1][playerid], 1);
	PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[1][playerid], 0);

	textPlayerVelocimetro[2][playerid] = CreatePlayerTextDraw(playerid,187.000000, 382.000000, "0 Litros");
	PlayerTextDrawBackgroundColor(playerid,textPlayerVelocimetro[2][playerid], 255);
	PlayerTextDrawFont(playerid,textPlayerVelocimetro[2][playerid], 2);
	PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[2][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,textPlayerVelocimetro[2][playerid], -1);
	PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[2][playerid], 1);
	PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[2][playerid], 1);
	PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[2][playerid], 0);

	textPlayerVelocimetro[3][playerid] = CreatePlayerTextDraw(playerid,140.000000, 350.000000, "Las Barrancas");
	PlayerTextDrawBackgroundColor(playerid,textPlayerVelocimetro[3][playerid], 255);
	PlayerTextDrawFont(playerid,textPlayerVelocimetro[3][playerid], 2);
	PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[3][playerid], 0.300000, 1.000000);
	PlayerTextDrawColor(playerid,textPlayerVelocimetro[3][playerid], -1);
	PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[3][playerid], 1);
	PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[3][playerid], 1);
	PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[3][playerid], 0);

	textPlayerVelocimetro[4][playerid] = CreatePlayerTextDraw(playerid,191.000000, 372.000000, "KM/H");
	PlayerTextDrawBackgroundColor(playerid,textPlayerVelocimetro[4][playerid], 255);
	PlayerTextDrawFont(playerid,textPlayerVelocimetro[4][playerid], 2);
	PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[4][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,textPlayerVelocimetro[4][playerid], -1697828097);
	PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[4][playerid], 1);
	PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[4][playerid], 1);
	PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[4][playerid], 0);

	textPlayerVelocimetro[5][playerid] = CreatePlayerTextDraw(playerid,141.000000, 382.000000, "GASOLINA");
	PlayerTextDrawBackgroundColor(playerid,textPlayerVelocimetro[5][playerid], 255);
	PlayerTextDrawFont(playerid,textPlayerVelocimetro[5][playerid], 2);
	PlayerTextDrawLetterSize(playerid,textPlayerVelocimetro[5][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,textPlayerVelocimetro[5][playerid], -1697828097);
	PlayerTextDrawSetOutline(playerid,textPlayerVelocimetro[5][playerid], 0);
	PlayerTextDrawSetProportional(playerid,textPlayerVelocimetro[5][playerid], 1);
	PlayerTextDrawSetShadow(playerid,textPlayerVelocimetro[5][playerid], 1);
	PlayerTextDrawSetSelectable(playerid,textPlayerVelocimetro[5][playerid], 0);

	// Fim Do Velocimetro

    MapIcon(playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(Logado{playerid} == true) {
    	GetPlayerPos(playerid, pPosX[playerid], pPosY[playerid], pPosZ[playerid]);
    	SalvarDados(playerid);
    	Logado{playerid} = false;
    }
    else{
    	printf("A conta do player %s não pode ser salva!", getName(playerid));
    }
    
    if (PlayerVelocimetro[playerid]) {
        KillTimer(PlayerVelocimetroTimer[playerid]);
    }
	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerSkin(playerid, DOF2_GetInt(PegarConta(playerid), "SkinAtual"));
    TextDrawHideForPlayer(playerid,Logo);
    TextDrawHideForPlayer(playerid,Versao);
    TextDrawHideForPlayer(playerid,site);
    TextDrawHideForPlayer(playerid,Rodape);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    if(InAutoEscola[playerid] == 1)
	{
	    new currentveh;
     	currentveh = GetPlayerVehicleID(playerid);
      	DestroyVehicle(currentveh);
      	InAutoEscola[playerid] = 0;
      	DisablePlayerRaceCheckpoint(playerid);
	}
	return 1;
}

public ProcessGameTime(playerid)
{
    //new newtext[206], name[MAX_PLAYER_NAME];
    //GetPlayerName(playerid, name, MAX_PLAYER_NAME);
    new Year, Month, Day, Hour, Minute;
    getdate(Year, Month, Day);
    gettime(Hour, Minute);
    //format(newtext, sizeof(newtext), "Nome: %s ID: %d Score: %d Ping: %d Data: %d/%d/%d Hora: %d:%d", name, playerid , GetPlayerScore(playerid), GetPlayerPing(playerid), Day, Month, Year, Hour, Minute);
    //TextDrawSetString(Rodape, newtext);
    SetWorldTime(Hour);
}

public MapIcon(playerid)
{
    SetPlayerMapIcon(playerid, 50, 1733.5028,-1912.0034,13.5620, 23, 0, MAPICON_LOCAL); //Agencia de empregos
    SetPlayerMapIcon(playerid, 51, 1833.7811,-1842.6208,13.5781, 17, 0, MAPICON_LOCAL); //Mercados 24/7 (id: 0)
    SetPlayerMapIcon(playerid, 52, 1519.1331,-1453.9199,14.2084, 36, 0, MAPICON_LOCAL); //Auto Escola (id: 0)
    SetPlayerMapIcon(playerid, 53, 231.8930,1412.7786,10.5859, 51, 0, MAPICON_LOCAL); //Petroleiro
    //PostosDeGasolina
    for (new a = 0; a < sizeof(PostosDeGasolina); a++)
	{
		SetPlayerMapIcon(playerid, (54+a), PostosDeGasolina[a][0],PostosDeGasolina[a][1],PostosDeGasolina[a][2], 55, 0, MAPICON_LOCAL); //Auto Escola (id: 0)		
	}

}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
    new AutoAviso[128];
 	if(strfind(text, "puta", true) != -1 || strfind(text, "CÚ", true) != -1
	|| strfind(text, ":7777", true) != -1
	|| strfind(text, ":7800", true) != -1 || strfind(text, "cú", true) != -1
	|| strfind(text, ":7795", true) != -1
	|| strfind(text, ":7785", true) != -1
    || strfind(text, ":8888", true) != -1 || strfind(text, "fdp", true) != -1
	|| strfind(text, ":9999", true) != -1
	|| strfind(text, ":1234", true) != -1 || strfind(text, "FDP", true) != -1
    || strfind(text, ";7777", true) != -1 || strfind(text, "bvr", true) != -1
	|| strfind(text, ";7800", true) != -1
	|| strfind(text, ";7785", true) != -1
    || strfind(text, ";7795", true) != -1
	|| strfind(text, ";8888", true) != -1
	|| strfind(text, ";9999", true) != -1
    || strfind(text, ";1234", true) != -1
	|| strfind(text, "bcv", true) != -1
	|| strfind(text, "brv", true) != -1
	|| strfind(text, "bvv", true) != -1
    || strfind(text, "cvr", true) != -1
	|| strfind(text, "bvi", true) != -1
    || strfind(text, "bpl", true) != -1
	|| strfind(text, "bmv", true) != -1
	|| strfind(text, "brl", true) != -1
	|| strfind(text, "stt", true) != -1
	|| strfind(text, "mdb", true) != -1
	|| strfind(text, "tssa", true) != -1
    || strfind(text, "cu", true) != -1
    || strfind(text, "CU", true) != -1 )
	{
		Aviso[playerid]++;

		if(Aviso[playerid] <= 2)
		{
  			format(AutoAviso, sizeof(AutoAviso), "| INFO-SERVER | O Jogador %s Levou Um Aviso! ( Motivo: Palavras Inadequadas! ) [%d/03]", getName(playerid),Aviso[playerid]);
   			SendClientMessageToAll(COR_WARNING, AutoAviso);
   		}
	 	if(Aviso[playerid] == 3)
	 	{
	  		format(AutoAviso, sizeof(AutoAviso), "| INFO-SERVER | O Jogador %s Foi Kickado ( Motivo: Limite de Avisos )",getName(playerid));
	   		SendClientMessageToAll(COR_WARNING, AutoAviso);
	   		SalvarDados(playerid);

            Aviso[playerid] = 0;
	    	Kick(playerid);
		}
    }
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
        // Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	SendClientMessage(playerid, COR_WARNING, "| INFO | Para ligar ou desligar o veiculo '{B5B5B5}/LigarVeiculo{FFFFFF}' - '{B5B5B5}/DesligarVeiculo{FFFFFF}' ou '{B5B5B5}Y{FFFFFF}'");
	if(PlayerDados[playerid][gasolina] == 0){
		SendClientMessage(playerid,COR_ERRO,"| INFO | A Gasolina Deste carro acabou chame o Guincho");
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(carroauto[playerid] == vehicleid && InAutoEscola[playerid] == 1)
    {
        SendClientMessage(playerid,-1,"(AUTO ESCOLA) Reprovado! Você você saiu do veículo.");
        DisablePlayerRaceCheckpoint(playerid);
	    //PlayerDados[playerid][Habilitacao] = true;
	    InAutoEscola[playerid] = 0;
        DestroyVehicle(vehicleid);
        SetPlayerInterior(playerid, 3);
        SetPlayerPos(playerid, 1494.325195,1304.942871,1093.289062);
        if(IsPlayerInCheckpoint(playerid))
        {
            DisablePlayerCheckpoint(playerid);
        }
    }
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new car = GetPlayerVehicleID(playerid);//armazena na váriavel car o carro em q ele está.
    if(newstate == PLAYER_STATE_DRIVER)//se O Player entrar como motorista
	{
    	for(new i = 0; i < sizeof(petroleiroCar); i ++)
		{
			if(car == petroleiroCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Petroleiro)
		    	{
					SendClientMessage(playerid, 0x008000AA, "[Erro] Você não é um petroleiro, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
				}
			}
		}

	}

	if ( newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER) {
        ShowPlayerVelocimetro(playerid) ;
    } else {
        HidePlayerVelocimetro(playerid) ;
    }
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    new Checkpoint = CPS_GetPlayerCheckpoint(playerid);
    //Abrir o menu de Profissões

	if(Checkpoint == CheckAgencia)
	{
	    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "Honestas\nTransporte\nPolicia\nForças Armadas", "Selecionar", "Fechar");
	}
    if(Checkpoint == CPAutoEscola )
    {
    	ShowPlayerDialog(playerid, DialogAutoEscola, DIALOG_STYLE_TABLIST_HEADERS, "AUTO ESCOLA » Habilitações", "Categoria\t{008000}Preço\nMotocicleta\t{008000}$600,00\nAutomóvel\t{008000}$1400,00\nCaminhão\t{008000}$2400,00", "Selecionar", "Voltar");
    }
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    switch(point[playerid])
     {
         case 1:
         {
       		  DisablePlayerRaceCheckpoint(playerid);
       		  SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[1][0], AutoPoints[1][1], AutoPoints[1][2],AutoPoints[2][0], AutoPoints[2][1], AutoPoints[2][2], 10);
       		  point[playerid] = 2;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [1|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
   	    	  return 1;
         }
         case 2:
         {
              DisablePlayerRaceCheckpoint(playerid);
       		  SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[2][0], AutoPoints[2][1], AutoPoints[2][2],AutoPoints[3][0], AutoPoints[3][1], AutoPoints[3][2], 10);
              point[playerid] = 3;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [2|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
          	  return 1;
         }
         case 3:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[3][0], AutoPoints[3][1], AutoPoints[3][2],AutoPoints[4][0], AutoPoints[4][1], AutoPoints[4][2], 10);
              point[playerid] = 4;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [3|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 4:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[4][0], AutoPoints[4][1], AutoPoints[4][2],AutoPoints[5][0], AutoPoints[5][1], AutoPoints[5][2], 10);
              point[playerid] = 5;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [4|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 5:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[5][0], AutoPoints[5][1], AutoPoints[5][2],AutoPoints[6][0], AutoPoints[6][1], AutoPoints[6][2], 10);
              point[playerid] = 6;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [5|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 6:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[6][0], AutoPoints[6][1], AutoPoints[6][2],AutoPoints[7][0], AutoPoints[7][1], AutoPoints[7][2], 10);
              point[playerid] = 7;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [6|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 7:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[7][0], AutoPoints[7][1], AutoPoints[7][2],AutoPoints[8][0], AutoPoints[8][1], AutoPoints[8][2], 10);
              point[playerid] = 8;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [7|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 8:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[8][0], AutoPoints[8][1], AutoPoints[8][2],AutoPoints[9][0], AutoPoints[9][1], AutoPoints[9][2], 10);
              point[playerid] = 9;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [8|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 9:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[9][0], AutoPoints[9][1], AutoPoints[9][2],AutoPoints[10][0], AutoPoints[10][1], AutoPoints[10][2], 10);
              point[playerid] = 10;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [9|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 10:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[10][0], AutoPoints[10][1], AutoPoints[10][2],AutoPoints[11][0], AutoPoints[11][1], AutoPoints[11][2], 10);
              point[playerid] = 11;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [10|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 11:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[11][0], AutoPoints[11][1], AutoPoints[11][2],AutoPoints[12][0], AutoPoints[12][1], AutoPoints[12][2], 10);
              point[playerid] = 12;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [11|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 12:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[12][0], AutoPoints[12][1], AutoPoints[12][2],AutoPoints[13][0], AutoPoints[13][1], AutoPoints[13][2], 10);
              point[playerid] = 13;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [12|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 13:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[13][0], AutoPoints[13][1], AutoPoints[13][2],AutoPoints[14][0], AutoPoints[14][1], AutoPoints[14][2], 10);
              point[playerid] = 14;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [13|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 14:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[14][0], AutoPoints[14][1], AutoPoints[14][2],AutoPoints[14][0], AutoPoints[14][1], AutoPoints[14][2], 10);
              point[playerid] = 15;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [14|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 15:
         {
              DisablePlayerRaceCheckpoint(playerid);
              SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[15][0], AutoPoints[15][1], AutoPoints[15][2],AutoPoints[15][0], AutoPoints[15][1], AutoPoints[15][2], 10);
              point[playerid] = 16;
              SendClientMessage(playerid,COR_WARNING,"| AUTO ESCOLA | Agora só falta [15|15] de pontos espalhados pelo mapa!");
              PlayerPlaySound(playerid, 1057, 0, 0, 0);
              return 1;
         }
         case 16:
         {
            if(IsPlayerInVehicle(playerid, carroauto[playerid]))
            {
			  new Float:lataria;
			  GetVehicleHealth(carroauto[playerid], lataria);
			  if(lataria < 87)
			  {
			    DisablePlayerRaceCheckpoint(playerid);
           	    new currentveh;
   		      	currentveh = GetPlayerVehicleID(playerid);
              	DestroyVehicle(currentveh);
              	SendClientMessage(playerid,COR_ERRO,"| INFO | Reprovado! Você danificou muito a lataria do veículo.");
                SetPlayerInterior(playerid, 3);
                SetPlayerPos(playerid, 1494.325195,1304.942871,1093.289062);
              	return 1;
			  }
              
              DisablePlayerRaceCheckpoint(playerid);
              GameTextForPlayer(playerid, "AUTO ESCOLA COMPLETA", 3000, 1);

              if(InAutoEscolaType[playerid] == 1){
              	PlayerDados[playerid][HabT_1] = true;
              }

              if(InAutoEscolaType[playerid] == 2){
              	PlayerDados[playerid][HabT_2] = true;
              }

              if(InAutoEscolaType[playerid] == 3){
              	PlayerDados[playerid][HabT_3] = true;
              }


			  InAutoEscola[playerid] = 0;
			  new currentveh;
   		      currentveh = GetPlayerVehicleID(playerid);
              DestroyVehicle(currentveh);
              SetPlayerInterior(playerid, 3);
              SetPlayerPos(playerid, 1494.325195,1304.942871,1093.289062);
              return 1;
           	}
           	else
           	{
           	    DisablePlayerRaceCheckpoint(playerid);
           	    new currentveh;
   		      	currentveh = GetPlayerVehicleID(playerid);
              	DestroyVehicle(currentveh);
              	SendClientMessage(playerid,-1,"| AUTO ESCOLA | Reprovado! Você não está em um veículo da Auto Escola.");
                SetPlayerInterior(playerid, 3);
                SetPlayerPos(playerid, 1494.325195,1304.942871,1093.289062);
              	return 1;
           	}
         }
     }
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    /*              Ao Apertar "F" Ir para o local informado              */
    if ((newkeys==KEY_SECONDARY_ATTACK))
    {
    //sistema de entrada e saida
        if(IsPlayerInRangeOfPoint(playerid, 2.0, 1733.5103,-1912.0349,13.5620))
        {
            //Agencia de Enpregos Entrada
            GetPlayerPos(playerid, iPosX[playerid], iPosY[playerid], iPosZ[playerid]);
            SetPlayerInterior(playerid, 3);
            SetPlayerPos(playerid, 388.1492,173.6989,1008.3828);
        }

        if(IsPlayerInRangeOfPoint(playerid, 2.0, 390.7674,173.7650,1008.3828))
        {
            //Agencia de Empregos Saida
            SetPlayerInterior(playerid, 0);
            SetPlayerPos(playerid, iPosX[playerid],iPosY[playerid],iPosZ[playerid]);
        }

        if(IsPlayerInRangeOfPoint(playerid, 2.0, 1833.7811,-1842.6208,13.5781)){ //Mercados 24/7 ID(0) Entrada
        GetPlayerPos(playerid, iPosX[playerid], iPosY[playerid], iPosZ[playerid]);
        SetPlayerInterior(playerid, 6);
        SetPlayerPos(playerid, -26.691598,-55.714897,1003.546875);}

        if(IsPlayerInRangeOfPoint(playerid, 2.0, -27.3571,-58.2683,1003.5469)){//Mercados 24/7 ID(0) Saida
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, iPosX[playerid],iPosY[playerid],iPosZ[playerid]);}

        if(IsPlayerInRangeOfPoint(playerid, 2.0, 1519.1331,-1453.9199,14.2084)){ //Auto Escola ID(0) Entrada
        GetPlayerPos(playerid, iPosX[playerid], iPosY[playerid], iPosZ[playerid]);
        SetPlayerInterior(playerid, 3);
        SetPlayerPos(playerid, 1494.325195,1304.942871,1093.289062);}

        if(IsPlayerInRangeOfPoint(playerid, 2.0, 1494.325195,1304.942871,1093.289062)){//Auto Escola 24/7 ID(0) Saida
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, iPosX[playerid],iPosY[playerid],iPosZ[playerid]);}

        //Sistema de Compras ou Outros
        if(IsPlayerInRangeOfPoint(playerid, 2.0, -22.1867,-55.6953,1003.5469)){
           // cmd_mercado(playerid);
        }
    }

    if (newkeys==KEY_YES )
	{
	   if(IsPlayerInAnyVehicle(playerid) && PlayerDados[playerid][gasolina] > 0)
	   {
	   motorcarro(playerid);
	   }
	}

	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(IsPlayerInAnyVehicle(playerid)) {
		TextDrawHideForPlayer(playerid,Logo);
		new carro = GetPlayerVehicleID(playerid);
		if(Motor[carro] == 1){
			if(PlayerDados[playerid][gasolina] == 0 && Avisado[playerid] == false) {
		        SendClientMessage(playerid,COR_ERRO,"| INFO | A Gasolina Deste carro acabou chame o Guincho");
		        //Motor[carro] = 0;
		        //TogglePlayerControllable(playerid, false);
		        motorcarro(playerid);

		        Avisado[playerid] = true;
		    }
		    if(PlayerDados[playerid][gasolina] > 0) {
		        Retirada[playerid]+=1;
		        if(Retirada[playerid] >= (RETIRAR_KM*13)) {
		            PlayerDados[playerid][gasolina] = PlayerDados[playerid][gasolina] - 1;
		            Retirada[playerid]=0;
		            Avisado[playerid] = false;
		        }
		    }
		}
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
	{
        //Dialog
        case DialogMercado:
        {
            if(response){
                if(listitem == 0){
                    if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid,0xFF0000AA,"Você não possui R$ 1000 para comprar!");
                    if(MercadoInfo[playerid][Celular] == false){
                        SendClientMessage(playerid, 0x008000AA ,"Agora você pode usar o comando /celular [ID] [SMS] para enviar uma mensagem.");
                        GivePlayerMoney(playerid, -1000);
                        MercadoInfo[playerid][Celular] = true;}
                    else{SendClientMessage(playerid, 0x008000AA ,"você já tem um celular portanto não pode comprar outro.");}
                }
                if(listitem == 1){
                    if(GetPlayerMoney(playerid) < 50000) return SendClientMessage(playerid,0xFF0000AA,"Você não possui R$ 50000 para comprar!");
                    if(MercadoInfo[playerid][PedagioSemPagar] == false){
                        SendClientMessage(playerid, 0x008000AA ,"Compra realizada com sucesso obrigado volte sempre.");
                        GivePlayerMoney(playerid, -50000);
                        MercadoInfo[playerid][PedagioSemPagar] = true;}
                    else{SendClientMessage(playerid, 0x008000AA ,"você já está utilizando o nosso serviço de pedágio.");}
                }
            }
            return 1;
        }
        //Dialog
	    case DialogRegistro:
	    {
	        if(!response) return Kick(playerid);
	        if(response)
	        {
	            if(strlen(inputtext) < 5 || strlen(inputtext) > 20)
	            {
                    SendClientMessage(playerid, 0xFF0000AA, "Sua senha deve conter entre 5 e 20 Caracteres");
	                format(Str, sizeof(Str), "{FFFFFF}Bem-vindo(a) ao {FFA500}SKYLANDIA {26AB0C}RPG{FFFFFF}\n\nConta: %s\nStatus: {FF0000}Não registrada{26AB0C}\n\nVersão 0.1 {FFFFFF}- Não há notícias, fique atento ao fórum!\nOBS: 5 a 20 Caracteres!", getName(playerid));
	                return ShowPlayerDialog(playerid, DialogRegistro, DIALOG_STYLE_PASSWORD, "{FFA500}Registro", Str, "Registrar", "Sair");
				}
                DOF2_CreateFile(PegarConta(playerid));
				DOF2_SetString(PegarConta(playerid),"Senha",inputtext);
                DOF2_SetString(PegarConta(playerid),"Email","Nao Informado");
                DOF2_SetString(PegarConta(playerid),"Sexo","Nao Informado");
				DOF2_SaveFile();
                format(Str, sizeof(Str), "{FFA500}E-mail {FFFFFF}para recuperação de conta para prevenções futuras.\n\nDigite um e-mail válido e ativo e ativo:", getName(playerid));
                ShowPlayerDialog(playerid, DialogEmail, DIALOG_STYLE_INPUT, "{FFA500}E-mail para recuperação.", Str, "Salvar", "");
			}
		}
        case DialogEmail:
	    {
            if(!response) return Kick(playerid);
	        if(response)
	        {
	            if(strlen(inputtext) < 16 || strlen(inputtext) > 40)
	            {
                    SendClientMessage(playerid, 0xFF0000AA, "Coloque um e-mail válido!");
	                format(Str, sizeof(Str), "{FFA500}E-mail {FFFFFF}para recuperação de conta para prevenções futuras.\n\nDigite um e-mail válido e ativo e ativo:", getName(playerid));
                    ShowPlayerDialog(playerid, DialogEmail, DIALOG_STYLE_INPUT, "{FFA500}E-mail para recuperação.", Str, "Salvar", "");
                    return 0;
				}
				DOF2_SetString(PegarConta(playerid),"Email",inputtext);
				DOF2_SaveFile();
                ShowPlayerDialog(playerid, DialogSexo, DIALOG_STYLE_MSGBOX, "{FFA500}Selecione o seu Sexo", "{FFFFFF}Olá, informe-nos seu sexo.\nVocê é do sexo {3761ED}Masculino{37ED4C} {FFFFFF}ou {F20FF2}Feminino{FFFFFF}?", "Masculino", "Feminino");
                return 1;
			}
		}
        case DialogSexo:
	    {
            if(response){
    			SendClientMessage(playerid, 0xFFA500AA, "Ok, seu sexo é masculino.");
                new InfoSenha[65];
    			format(InfoSenha,sizeof(InfoSenha),"Conta registrada com sucesso!");
    			SendClientMessage(playerid,0xFFA500AA,InfoSenha);
    			DOF2_CreateFile(PegarConta(playerid));
    			DOF2_SetString(PegarConta(playerid),"Sexo","Masculino");
                DOF2_SetInt(PegarConta(playerid), "SkinAtual", 23);
    			DOF2_SaveFile();
    			SetSpawnInfo(playerid, 0, 0, 1722.5123, -1912.7931, 13.5647, 269.15, 0, 0, 0, 0, 0, 0);
    	  		SpawnPlayer(playerid);
    			TogglePlayerSpectating(playerid, false);
    			Logado{playerid} = true;
                MercadoInfo[playerid][Celular] = false;
                MercadoInfo[playerid][PedagioSemPagar] = false;
                MercadoInfo[playerid][GPS] = false;
                MercadoInfo[playerid][Capacete] = false;
                MercadoInfo[playerid][Oculos] = false;
                MercadoInfo[playerid][Bone] = false;
                MercadoInfo[playerid][Gorro] = false;
                MercadoInfo[playerid][Arara] = false;

                PlayerDados[playerid][vip] = false;
            	PlayerDados[playerid][exp] = 0;

            	PlayerDados[playerid][gasolina] = 14;
            	PlayerDados[playerid][etanol] = 14;
            	PlayerDados[playerid][gnv] = 14;
            	PlayerDados[playerid][diesel] = 14;

            	PlayerDados[playerid][Admin] = 0;

    			SendClientMessage(playerid,0xFFA500AA,"Registrado e Logado com sucesso!");
    			GivePlayerMoney(playerid,1000);
            }
		    else if(!response){
                SendClientMessage(playerid, 0xFFA500AA, "Ok, seu sexo é feminino.");
                new InfoSenha[65];
    			format(InfoSenha,sizeof(InfoSenha),"Conta registrada com sucesso!");
    			SendClientMessage(playerid,0xFFA500AA,InfoSenha);
       			DOF2_CreateFile(PegarConta(playerid));
    			DOF2_SetString(PegarConta(playerid),"Sexo","Masculino");
                DOF2_SetInt(PegarConta(playerid), "SkinAtual", 56);
    			DOF2_SaveFile();
    			SetSpawnInfo(playerid, 0, 0, 1722.5123, -1912.7931, 13.5647, 269.15, 0, 0, 0, 0, 0, 0);
    	  		SpawnPlayer(playerid);
    			TogglePlayerSpectating(playerid, false);
    			Logado{playerid} = true;
                MercadoInfo[playerid][Celular] = false;
                MercadoInfo[playerid][PedagioSemPagar] = false;
                MercadoInfo[playerid][GPS] = false;
                MercadoInfo[playerid][Capacete] = false;
                MercadoInfo[playerid][Oculos] = false;
                MercadoInfo[playerid][Bone] = false;
                MercadoInfo[playerid][Gorro] = false;
                MercadoInfo[playerid][Arara] = false;

                PlayerDados[playerid][vip] = false;
            	PlayerDados[playerid][exp] = 0;

            	PlayerDados[playerid][gasolina] = 14;
            	PlayerDados[playerid][etanol] = 14;
            	PlayerDados[playerid][gnv] = 14;
            	PlayerDados[playerid][diesel] = 14;

            	PlayerDados[playerid][Admin] = 0;

    			SendClientMessage(playerid,0xFFA500AA,"Registrado e Logado com sucesso!");
    			GivePlayerMoney(playerid,1000);
           }
            return 1;
        }
	    case DialogLogin:
	    {
	        if(!response) return Kick(playerid);
	        if(response)
	        {
	            if(!strlen(inputtext))
	            {
                    format(Str, sizeof(Str), "{FFFFFF}Bem-vindo(a) ao {FFA500}SKYLANDIA {26AB0C}RPG{FFFFFF}\n\nConta: %s\nStatus: {00FF00}Registrada{26AB0C}\n\nVersão 1.6 {FFFFFF}- Não há notícias, fique atento ao fórum!\n* Insira sua senha abaixo para logar:", getName(playerid));
	                return ShowPlayerDialog(playerid, DialogLogin, DIALOG_STYLE_PASSWORD, "{FFD700}Login", Str, "Logar", "Sair");
				}

				if(!strcmp(DOF2_GetString(PegarConta(playerid),"Senha"), inputtext))
				{
				    CarregarDados(playerid);
                    SetPlayerInterior(playerid, DOF2_GetInt(PegarConta(playerid), "pPosI"));
				    SetSpawnInfo(playerid, 0, 0, DOF2_GetFloat(PegarConta(playerid), "PosX"), DOF2_GetFloat(PegarConta(playerid), "PosY"), DOF2_GetFloat(PegarConta(playerid), "PosZ"), 269.15, 0, 0, 0, 0, 0, 0);
	  				SpawnPlayer(playerid);
				    TogglePlayerSpectating(playerid, false);
				    Logado{playerid} = true;
				    SendClientMessage(playerid,-1,"Logado com sucesso!");
				}
				else
				{
				    if(SenhaErrada[playerid] >= 3)
				    {
				        SendClientMessage(playerid,COR_ERRO,"Você foi kickado por errar a senha 3 vezes!");
				        SenhaErrada[playerid] = 0;
				        Kick(playerid);
					}
					else
					{
						SenhaErrada[playerid] ++;
						new str[50];
						format(str, sizeof(str), "Senha Incorreta [%d/3]: por favor digite uma senha para acessar", SenhaErrada[playerid]);
                        SendClientMessage(playerid, 0xFF0000AA, str);
            			ShowPlayerDialog(playerid, DialogLogin, DIALOG_STYLE_PASSWORD, "{FFD700}Login", Str, "Logar", "Sair");
					}
				}
			}
        }
        //Profissões
        case DialogMenuAgencia:{
            if(response){
    	        if(listitem == 0){
    	            ShowPlayerDialog(playerid, DialogHonestas, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Honestas", "Profissão\t{33AAFF}Level\t{008000}Salário\nFotografo\t{33AAFF}0\t{008000}$600,00\nParamedico\t{33AAFF}5\t{008000}$700,00", "Selecionar", "Voltar");
    	        }
    	        if(listitem == 1){
    	            ShowPlayerDialog(playerid, DialogTransportes, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Transportes", "Profissão\t{33AAFF}Level\t{008000}Salário\nPetroleiro\t{33AAFF}0\t{008000}$1.100,00\nConcreteiro\t{33AAFF}10\t{008000}$1.200,00", "Selecionar", "Voltar");
    	        }
    	        if(listitem == 2){
    	            ShowPlayerDialog(playerid, DialogPolicias, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Policias", "Profissão\t{33AAFF}Level\t{008000}Salário\nPolícia Militar\t{33AAFF}50\t{008000}$2.100,00\nInterpol\t{33AAFF}200\t{008000}$2.500,00", "Selecionar", "Voltar");
    	        }
    	        if(listitem == 3){
    	            ShowPlayerDialog(playerid, DialogForcasArmadas, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » ForcasArmadas", "Profissão\t{33AAFF}Level\t{008000}Salário\nExército\t{33AAFF}700\t{008000}$3.000,00\nAéronautica\t{33AAFF}800\t{008000}$3.500,00", "Selecionar", "Voltar");
    	        }
    	    }
        }
        case DialogHonestas:{
        	if(response)
    	    {
    	        if(listitem == 0)
    	        {
    	            if(GetPlayerScore(playerid) >= 0)
    	            {
    		        	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Fotografo ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Fotografo!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$600,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Fotografo ~~~~~~~~~~~~~~~~~~~~~~~");

    					PlayerDados[playerid][Profissao] = Fotografo;
    				}
    			}
    			if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 5)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Paramedico ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Paramedico!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$700,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Paramedico ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Paramedico;
    				}
    				else
    				{
    				    SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "Honestas\nTransporte\nPolicia\nForças Armadas", "Selecionar", "Fechar");
    		}
        }
        case DialogTransportes:{
            if(response)
    	    {
    	        if(listitem == 0)
    	        {
    	            if(GetPlayerScore(playerid) >= 0)
    	            {
    		        	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Petroleiro ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Petroleiro!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1.100,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Petroleiro ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Petroleiro;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, 0xFFFFFFAA, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        new Float:X,Float:Y,Float:Z;
        			    GetPlayerPos(playerid,X,Y,Z);
                        PlayerPlaySound(playerid, 716, X, Y, Z);
    				}
    			}
    			if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 10)
    	            {
    				    SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Concreteiro ~~~~~~~~~~~~~~~~~~~~~~~");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Concreteiro!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1.200,00");
    		            SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Concreteiro ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Concreteiro;
    				}
    				else
    				{
    				    SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "Honestas\nTransporte\nPolicia\nForças Armadas", "Selecionar", "Fechar");
    		}
        }
        case DialogPolicias:{
            if(response)
    	    {
    	        if(listitem == 0)
    	        {
    	            if(GetPlayerScore(playerid) >= 50)
    	            {
    			        SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia Militar ~~~~~~~~~~~~~~~~~~~~~~~");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você é um Polícial Militar!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2.100,00");
    		            SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia Militar ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = PMilitar;
    				}
    				else
    				{
    				    SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 200)
    	            {
    				    SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Interpol ~~~~~~~~~~~~~~~~~~~~~~~");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você é da Polícia Interpol!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2.500,00");
    		            SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Interpol ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Interpol;
    				}
    				else
    				{
    				    SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "Honestas\nTransporte\nPolicia\nForças Armadas", "Selecionar", "Fechar");
    		}
        }
        case DialogForcasArmadas:{
            if(response)
    	    {
    	        if(listitem == 0)
    	        {
    	            if(GetPlayerScore(playerid) >= 700)
    	            {
    			        SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Exército ~~~~~~~~~~~~~~~~~~~~~~~");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você é do Exército!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$3.000,00");
    		            SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Exército ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Exercito;
    				}
    				else
    				{
    				    SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 800)
    	            {
    				    SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Aéronautica ~~~~~~~~~~~~~~~~~~~~~~~");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você é da Aéronautica!");
    		            SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$3.500,00");
    		            SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Aéronautica ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Aeronautica;
    				}
    				else
    				{
    				    SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "Honestas\nTransporte\nPolicia\nForças Armadas", "Selecionar", "Fechar");
    		}
        }
        case DialogAutoEscola:{
            if(response == 1){
                SetPlayerInterior(playerid, 0);
                SetPlayerPos(playerid, 1535.5942,-1457.8770,12.0806);
                InAutoEscola[playerid] = 1;
                carroauto[playerid] = CreateVehicle(583, 1517.0026,-1475.8237,9.5000,297.6633, 0, 0, -1);
                PutPlayerInVehicle(playerid, carroauto[playerid], 0);
                SendClientMessage(playerid,-1,"(AUTO ESCOLA) Voce iniciou a auto escola,siga as setas.");
                SetPlayerRaceCheckpoint(playerid, 0, AutoPoints[0][0], AutoPoints[0][1], AutoPoints[0][2],AutoPoints[1][0], AutoPoints[1][1], AutoPoints[1][2], 10);
                point[playerid] = 1;
                GivePlayerMoney(playerid, -200);
                return 1;
            }
            if(response == 0){
                SendClientMessage(playerid,-1,"(AUTO ESCOLA) Voce desistiu da auto escola.");
                GivePlayerMoney(playerid, -200);
                return 1;
            }
        }
        case DialogCarregarPetroleiro:{
            if(response)
    	    {
    	        if(listitem == 0)
    	        {
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Spinybed!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 1;
                    SetPlayerMapIcon(playerid, 41, 2147.2913,2748.4233,10.5247, 0, 0, MAPICON_GLOBAL);
                }
    			else if(listitem == 1)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Las Venturas!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 2;
                    SetPlayerMapIcon(playerid, 41, 2639.6121,1106.8522,10.3771, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 2)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Temple!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 3;
                    SetPlayerMapIcon(playerid, 41, 1004.0529,-938.4166,41.7306, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 3)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Whetstone!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 4;
                    SetPlayerMapIcon(playerid, 41, -1607.2217,-2714.9656,48.1127, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 4)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Doherty!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 5;
                    SetPlayerMapIcon(playerid, 41, -2028.1998,156.6336,28.3998, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 5)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Easter Basin!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 6;
                    SetPlayerMapIcon(playerid, 41, -1676.0660,413.3091,6.7472, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 6)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Juniper Hollow!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 7;
                    SetPlayerMapIcon(playerid, 41, -2409.0630,976.4838,44.8595, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 7)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Tirra Robada!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 8;
                    SetPlayerMapIcon(playerid, 41, -1329.1506,2677.6660,49.6365, 0, 0, MAPICON_GLOBAL);
                }
                else if(listitem == 8)
    			{
                    SendClientMessage(playerid, COR_WARNING, "INFO | Sua carreta foi carregada!");
                    SendClientMessage(playerid, COR_WARNING, "INFO | Foi marcado no seu Radar um Checkpoint, siga-o para descarregar no Posto de Fort Carson!");
                    RemovePlayerMapIcon(playerid, 41);
                    carregado[playerid] = 9;
                    SetPlayerMapIcon(playerid, 41, 70.7164,1219.1143,18.3873, 0, 0, MAPICON_GLOBAL);
                }
    		}
    		else
    		{
                SendClientMessage(playerid, COR_ERRO, "| ERRO | Você cancelou o carregamento!");
    		}
        }
        case DialogGPS:{
            if(response)
    	    {
    	        if(listitem == 0)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 1727.1736,-1912.1122,13.5636, GPS_ICON, 0, MAPICON_GLOBAL);
	   				SendClientMessage(playerid, COR_SUCCESS, "| OK | A Agencia Foi Marcada No Seu GPS, Vá Até O Checkpoint!");
	   				return 1;
				}
				if(listitem == 1)
	          	{
	          		PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 1553.0168,-1675.6111,16.1953, GPS_ICON, 0, MAPICON_GLOBAL);
	           		SendClientMessage(playerid, COR_SUCCESS, "| OK | Departamento De Policia De Los Santos Foi Marcado, Vá Até O Checkpoint!");
	           		return true;
	          	}
	          	if(listitem == 2)
	          	{
	          		PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 1177.3458,-1323.4841,14.0661, GPS_ICON, 0, MAPICON_GLOBAL);
	          		SendClientMessage(playerid, COR_SUCCESS, "| OK | Hospital De Los Santos Foi Marcado Em Seu GPS, Vá Até O Checkpoint!");
	            	return 1;
				}
				if(listitem == 3)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 1365.3500,-1279.0601,13.5469, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | Loja De Armas De Los Santos Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 4)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 2244.4800,-1664.0601,15.4766, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | Loja De Roupas Da Groove Street LS Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 5)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 2033.9954,-1402.7242,17.2931, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | Hospital Groove Street LS Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 6)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 1310.0978,-1368.0890,13.5445, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | Banco De Los Santos Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 7)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 1522.2417,-1447.7319,13.4202, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | A Auto Escola Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 8)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, -1704.9392,1349.1104,7.1797, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | Pier 69 Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 9)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 2748.5149,-2450.8518,13.6484, GPS_ICON, 0, MAPICON_GLOBAL);
					SendClientMessage(playerid, COR_SUCCESS, "| OK | Docas Los Santos Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 10)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, -1493.6295,920.2054,7.1875, GPS_ICON, 0, MAPICON_GLOBAL);
				    SendClientMessage(playerid, COR_SUCCESS, "| OK | Banco San Fierro Foi Marcado, Vá Até O Checkpoint!");
				    return 1;
				}
				if(listitem == 11)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 2015.6973,1151.5333,10.8203, GPS_ICON, 0, MAPICON_GLOBAL);
				    SendClientMessage(playerid, COR_SUCCESS, "| OK | Banco Las Venturas Foi Marcado, Vá Até O Checkpoint!");
				    return 1;
				}
				if(listitem == 12)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 2446.9980,2376.0732,12.1635, GPS_ICON, 0, MAPICON_GLOBAL);
				    SendClientMessage(playerid, COR_SUCCESS, "| OK | Agencia Las Venturas Foi Marcado, Vá Até O Checkpoint!");
				    return 1;
				}
				if(listitem == 13)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, -1881.5525,823.1663,35.1766, GPS_ICON, 0, MAPICON_GLOBAL);
				    SendClientMessage(playerid, COR_SUCCESS, "| OK | Agencia San Fierro Foi Marcado, Vá Até O Checkpoint!");
				    return 1;
				}
				if(listitem == 14)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, -1605.5826,711.8022,13.8672, GPS_ICON, 0, MAPICON_GLOBAL);
				    SendClientMessage(playerid, COR_SUCCESS, "| OK | Departamento de Policia De San Fierro Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 15)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SetPlayerMapIcon(playerid, GPS_ID, 2287.0947,2432.0647,10.8203, GPS_ICON, 0, MAPICON_GLOBAL);
				    SendClientMessage(playerid, COR_SUCCESS, "| OK | Departamento de Policia De Las Venturas Foi Marcado, Vá Até O Checkpoint!");
					return 1;
				}
				if(listitem == 16)
				{
					PlayerPlaySound(playerid, 1057, 0, 0, 0);
					SendClientMessage(playerid, COR_SUCCESS, "INFO | Você desativou o GPS!");
        			RemovePlayerMapIcon(playerid, GPS_ID);
					return 1;
				}
    		}
        }
        case DialogPostoDeGasolina:{
            if(response)
    	    {
    	        if(listitem == 0)
				{
					ShowPlayerDialog(playerid, DialogPostoGasolina, DIALOG_STYLE_INPUT, "» Posto de combustível", "{008000}Preço do litro da Gasolina R$ 5{FFFFFF}", "Abastecer", "Cancelar");
	   				return 1;
				}
				if(listitem == 1)
	          	{
					ShowPlayerDialog(playerid, DialogPostoEtanol, DIALOG_STYLE_INPUT, "» Posto de combustível", "{008000}Preço do litro de Etanol R$ 4{FFFFFF}", "Abastecer", "Cancelar");
	           		return true;
	          	}
	          	if(listitem == 2)
	          	{
					ShowPlayerDialog(playerid, DialogPostoGNV, DIALOG_STYLE_INPUT, "» Posto de combustível", "{008000}Preço do litro de GNV R$ 25{FFFFFF}", "Abastecer", "Cancelar");
	            	return 1;
				}
				if(listitem == 3)
				{
					ShowPlayerDialog(playerid, DialogPostoDiesel, DIALOG_STYLE_INPUT, "» Posto de combustível", "{008000}Preço do litro de Diesel R$ 3{FFFFFF}", "Abastecer", "Cancelar");
					return 1;
				}
    		}
        }
        case DialogPostoGasolina:{
            if(response)
    	    {
    	        if(strlen(inputtext) < 0 || strlen(inputtext) > 3 || !IsNumeric(inputtext))
	            {
                    SendClientMessage(playerid, COR_ERRO, "| ERROR | Informe um valor válido!");
                    return 1;
				}else{
                    new iValue = strval(inputtext);
                    new fValue = (iValue * 5);
					if(iValue > 0 && iValue <= 100){
						if(GetPlayerMoney(playerid) >= fValue)
	    	            {
	    	            	if(PlayerDados[playerid][gasolina] < 100){

	    	            		new bValue = ( (PlayerDados[playerid][gasolina] + iValue) - 100);
	    	            		if(bValue > 0){
	    	            			iValue -= bValue;
	    	            			fValue = (iValue * 5);
	    	            		}

	    	            		new str[256];
								format(str, sizeof(str), "| INFO | Você Pagou R$ %d por %d litros", fValue, iValue);
								SendClientMessage(playerid, COR_WARNING, str);

								PlayerDados[playerid][gasolina] += iValue;
						        GivePlayerMoney(playerid, fValue*-1);

		    			    }else{
		    			        SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O tanque do veiculo já está cheio!");
		    				}
	    			    }
		    			else
		    			{
		    				SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem dinheiro suficiente!");
		    			}
					}else{
						SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O limite de combustível é 100 litros");
					}
				}

				return 1;
    		}
        }
        case DialogPostoEtanol:{
            if(response)
    	    {
    			if(strlen(inputtext) < 0 || strlen(inputtext) > 3 || !IsNumeric(inputtext))
	            {
                    SendClientMessage(playerid, COR_ERRO, "| ERROR | Informe um valor válido!");
                    return 1;
				}else{
                    new iValue = strval(inputtext);
                    new fValue = (iValue * 4);
					if(iValue > 0 && iValue <= 100){
						if(GetPlayerMoney(playerid) >= fValue)
	    	            {
	    	            	if(PlayerDados[playerid][etanol] < 100){

	    	            		new bValue = ( (PlayerDados[playerid][etanol] + iValue) - 100);
	    	            		if(bValue > 0){
	    	            			iValue -= bValue;
	    	            			fValue = (iValue * 4);
	    	            		}

	    	            		new str[256];
								format(str, sizeof(str), "| INFO | Você Pagou R$ %d por %d litros", fValue, iValue);
								SendClientMessage(playerid, COR_WARNING, str);

								PlayerDados[playerid][etanol] += iValue;
						        GivePlayerMoney(playerid, fValue*-1);

		    			    }else{
		    			        SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O tanque do veiculo já está cheio!");
		    				}
	    			    }
		    			else
		    			{
		    				SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem dinheiro suficiente!");
		    			}
					}else{
						SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O limite de combustível é 100 litros");
					}
				}

				return 1;        
    		}
        }
        case DialogPostoGNV:{
            if(response)
    	    {
   				if(strlen(inputtext) < 0 || strlen(inputtext) > 3 || !IsNumeric(inputtext))
	            {
                    SendClientMessage(playerid, COR_ERRO, "| ERROR | Informe um valor válido!");
                    return 1;
				}else{
                    new iValue = strval(inputtext);
                    new fValue = (iValue * 25);
					if(iValue > 0 && iValue <= 100){
						if(GetPlayerMoney(playerid) >= fValue)
	    	            {
	    	            	if(PlayerDados[playerid][gnv] < 100){

	    	            		new bValue = ( (PlayerDados[playerid][gnv] + iValue) - 100);
	    	            		if(bValue > 0){
	    	            			iValue -= bValue;
	    	            			fValue = (iValue * 25);
	    	            		}

	    	            		new str[256];
								format(str, sizeof(str), "| INFO | Você Pagou R$ %d por %d litros", fValue, iValue);
								SendClientMessage(playerid, COR_WARNING, str);

								PlayerDados[playerid][gnv] += iValue;
						        GivePlayerMoney(playerid, fValue*-1);

		    			    }else{
		    			        SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O tanque do veiculo já está cheio!");
		    				}
	    			    }
		    			else
		    			{
		    				SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem dinheiro suficiente!");
		    			}
					}else{
						SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O limite de combustível é 100 litros");
					}
				}

				return 1;	        
    		}
        }
        case DialogPostoDiesel:{
            if(response)
    	    {
    			if(strlen(inputtext) < 0 || strlen(inputtext) > 3 || !IsNumeric(inputtext))
	            {
                    SendClientMessage(playerid, COR_ERRO, "| ERROR | Informe um valor válido!");
                    return 1;
				}else{
                    new iValue = strval(inputtext);
                    new fValue = (iValue * 3);
					if(iValue > 0 && iValue <= 300){
						if(GetPlayerMoney(playerid) >= fValue)
	    	            {
	    	            	if(PlayerDados[playerid][diesel] < 300){

	    	            		new bValue = ( (PlayerDados[playerid][diesel] + iValue) - 300);
	    	            		if(bValue > 0){
	    	            			iValue -= bValue;
	    	            			fValue = (iValue * 3);
	    	            		}

	    	            		new str[256];
								format(str, sizeof(str), "| INFO | Você Pagou R$ %d por %d litros", fValue, iValue);
								SendClientMessage(playerid, COR_WARNING, str);

								PlayerDados[playerid][diesel] += iValue;
						        GivePlayerMoney(playerid, fValue*-1);

		    			    }else{
		    			        SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O tanque do veiculo já está cheio!");
		    				}
	    			    }
		    			else
		    			{
		    				SendClientMessage(playerid, 0xFF0000AA, "| ERRO | Você não tem dinheiro suficiente!");
		    			}
					}else{
						SendClientMessage(playerid, 0xFF0000AA, "| ERRO | O limite de combustível é 100 litros");
					}
				}

				return 1;        
    		}
        }
    }
    return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
stock PlayerToPoint(playerid, Float:radi, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
    {
        new Float:oldposx, Float:oldposy, Float:oldposz;
        new Float:tempposx, Float:tempposy, Float:tempposz;
        GetPlayerPos(playerid, oldposx, oldposy, oldposz);
        tempposx = (oldposx -x);
        tempposy = (oldposy -y);
        tempposz = (oldposz -z);
        if ( (tempposx < radi) && (tempposx > -radi) && (tempposy < radi) && (tempposy > -radi) && (tempposz < radi) && (tempposz > -radi) )
        {
            return 1;
        }
    }
    return 0;
}
//------------------------- { - Login Carregando Infomacoes - } -------------------------------------
stock getName(playerid)
{
        static Nome[MAX_PLAYER_NAME]; GetPlayerName(playerid, Nome, sizeof(Nome)); return Nome;
}
stock PegarConta(playerid)
{
        static Arquivo[33]; format(Arquivo, sizeof(Arquivo), "Contas/%s.ini", getName(playerid)); return Arquivo;
}
stock SalvarDados(playerid)
{
    DOF2_SetInt(PegarConta(playerid), "Level", GetPlayerScore(playerid));
    DOF2_SetInt(PegarConta(playerid), "Dinheiro", GetPlayerMoney(playerid));
    DOF2_SetInt(PegarConta(playerid), "LevelProcurado", GetPlayerWantedLevel(playerid));
    DOF2_SetInt(PegarConta(playerid), "SkinAtual", GetPlayerSkin(playerid));
    DOF2_SetInt(PegarConta(playerid), "AdminLevel", PlayerDados[playerid][Admin]);

    DOF2_SetInt(PegarConta(playerid), "Profissao", PlayerDados[playerid][Profissao]);
    DOF2_SetBool(PegarConta(playerid), "Trabalhando", PlayerDados[playerid][trabalhando]);

    DOF2_SetBool(PegarConta(playerid), "Vip", PlayerDados[playerid][vip]);
    DOF2_SetInt(PegarConta(playerid), "Exp", PlayerDados[playerid][exp]);
    DOF2_SetString(PegarConta(playerid), "UltimoLogin", PlayerDados[playerid][ultimoLogin]);

    DOF2_SetInt(PegarConta(playerid), "Multas", PlayerDados[playerid][multas]);

    DOF2_SetBool(PegarConta(playerid), "HabN", PlayerDados[playerid][HabN]);
    DOF2_SetBool(PegarConta(playerid), "HabA", PlayerDados[playerid][HabA]);

    DOF2_SetBool(PegarConta(playerid), "HabT_1", PlayerDados[playerid][HabT_1]);
    DOF2_SetBool(PegarConta(playerid), "HabT_2", PlayerDados[playerid][HabT_2]);
    DOF2_SetBool(PegarConta(playerid), "HabT_3", PlayerDados[playerid][HabT_3]);

    DOF2_SetBool(PegarConta(playerid), "TaPreso", PlayerDados[playerid][TaPreso]);
    DOF2_SetInt(PegarConta(playerid), "MinPreso", PlayerDados[playerid][MinPreso]);
    DOF2_SetInt(PegarConta(playerid), "SegPreso", PlayerDados[playerid][SegPreso]);

    DOF2_SetInt(PegarConta(playerid), "Gasolina", PlayerDados[playerid][gasolina]);
    DOF2_SetInt(PegarConta(playerid), "Etanol", PlayerDados[playerid][etanol]);
    DOF2_SetInt(PegarConta(playerid), "GNV", PlayerDados[playerid][gnv]);
    DOF2_SetInt(PegarConta(playerid), "Diesel", PlayerDados[playerid][diesel]);

    DOF2_SetInt(PegarConta(playerid), "pPosI", GetPlayerInterior(playerid));
    DOF2_SetFloat(PegarConta(playerid), "PosX", pPosX[playerid]);
    DOF2_SetFloat(PegarConta(playerid), "PosY", pPosY[playerid]);
    DOF2_SetFloat(PegarConta(playerid), "PosZ", pPosZ[playerid]);
    DOF2_SetFloat(PegarConta(playerid), "lPosX", iPosX[playerid]);
    DOF2_SetFloat(PegarConta(playerid), "lPosY", iPosY[playerid]);
    DOF2_SetFloat(PegarConta(playerid), "lPosZ", iPosZ[playerid]);
    DOF2_SetBool(PegarConta(playerid), "Celular", MercadoInfo[playerid][Celular]);
    DOF2_SetBool(PegarConta(playerid), "Pedagio", MercadoInfo[playerid][PedagioSemPagar]);
    DOF2_SetBool(PegarConta(playerid), "GPS", MercadoInfo[playerid][GPS]);
    DOF2_SetBool(PegarConta(playerid), "Capacete", MercadoInfo[playerid][Capacete]);
    DOF2_SetBool(PegarConta(playerid), "Oculos", MercadoInfo[playerid][Oculos]);
    DOF2_SetBool(PegarConta(playerid), "Bone", MercadoInfo[playerid][Bone]);
    DOF2_SetBool(PegarConta(playerid), "Gorro", MercadoInfo[playerid][Gorro]);
    DOF2_SetBool(PegarConta(playerid), "Arara", MercadoInfo[playerid][Arara]);
    DOF2_SaveFile();
}
stock CarregarDados(playerid)
{
        if(DOF2_FileExists (PegarConta(playerid)))
        {
            // Info do Player
            SetPlayerScore(playerid, DOF2_GetInt(PegarConta(playerid), "Level"));
            GivePlayerMoney(playerid, DOF2_GetInt(PegarConta(playerid), "Dinheiro"));
            SetPlayerWantedLevel(playerid, DOF2_GetInt(PegarConta(playerid), "LevelProcurado"));

            PlayerDados[playerid][Admin] = DOF2_GetInt(PegarConta(playerid), "AdminLevel");

            PlayerDados[playerid][Profissao] = DOF2_GetInt(PegarConta(playerid), "Profissao");
            PlayerDados[playerid][trabalhando] = DOF2_GetBool(PegarConta(playerid), "Trabalhando");

            PlayerDados[playerid][vip] = DOF2_GetBool(PegarConta(playerid), "Vip");
            PlayerDados[playerid][exp] = DOF2_GetInt(PegarConta(playerid), "Exp");


            PlayerDados[playerid][multas] = DOF2_GetBool(PegarConta(playerid), "Multas");
			PlayerDados[playerid][HabN] = DOF2_GetBool(PegarConta(playerid), "HabN");
			PlayerDados[playerid][HabA] = DOF2_GetBool(PegarConta(playerid), "HabA");
			PlayerDados[playerid][HabT_1] = DOF2_GetBool(PegarConta(playerid), "HabT_1");
			PlayerDados[playerid][HabT_2] = DOF2_GetBool(PegarConta(playerid), "HabT_2");
			PlayerDados[playerid][HabT_3] = DOF2_GetBool(PegarConta(playerid), "HabT_3");
			PlayerDados[playerid][TaPreso] = DOF2_GetBool(PegarConta(playerid), "TaPreso");
			PlayerDados[playerid][MinPreso] = DOF2_GetInt(PegarConta(playerid), "MinPreso");
			PlayerDados[playerid][SegPreso] = DOF2_GetInt(PegarConta(playerid), "SegPreso");


            PlayerDados[playerid][gasolina] = DOF2_GetInt(PegarConta(playerid), "Gasolina");
            PlayerDados[playerid][etanol] = DOF2_GetInt(PegarConta(playerid), "Etanol");
            PlayerDados[playerid][gnv] = DOF2_GetInt(PegarConta(playerid), "GNV");
            PlayerDados[playerid][diesel] = DOF2_GetInt(PegarConta(playerid), "Diesel");


            // Mercado
            MercadoInfo[playerid][Celular] = DOF2_GetBool(PegarConta(playerid), "Celular");
            MercadoInfo[playerid][PedagioSemPagar] = DOF2_GetBool(PegarConta(playerid), "Pedagio");
            MercadoInfo[playerid][GPS] = DOF2_GetBool(PegarConta(playerid), "GPS");
            MercadoInfo[playerid][Capacete] = DOF2_GetBool(PegarConta(playerid), "Capacete");
            MercadoInfo[playerid][Oculos] = DOF2_GetBool(PegarConta(playerid), "Oculos");
            MercadoInfo[playerid][Bone] = DOF2_GetBool(PegarConta(playerid), "Bone");
            MercadoInfo[playerid][Gorro] = DOF2_GetBool(PegarConta(playerid), "Gorro");
            MercadoInfo[playerid][Arara] = DOF2_GetBool(PegarConta(playerid), "Arara");
            // Posição do jogador
            iPosX[playerid] = DOF2_GetFloat(PegarConta(playerid), "lPosX");
            iPosY[playerid] = DOF2_GetFloat(PegarConta(playerid), "lPosY");
            iPosZ[playerid] = DOF2_GetFloat(PegarConta(playerid), "lPosZ");
        }
}
//------------------------------------------------------------------------------
forward ServerInit();
public ServerInit()
{
	new str[256];
	format(str, sizeof(str), "hostname %s", SERVER_NAME);
	SendRconCommand("password 0");
	SendRconCommand(str);
	print("* Servidor Iniciado, Senha Removida.");
}
public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
    if(!Logado{playerid}) return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você Ainda Não Está Logado!");

	if(!success)
	{
		new string[256];
		format(string, sizeof(string), "| ERRO | O Comando %s Não Existe!.",cmdtext);
		PlayerPlaySound(playerid, 1055, 0, 0, 0);
		SendClientMessage(playerid, COR_ERRO, string);
	}
	return 1;
}
forward UpdatePlayerVelocimetro(playerid);
public UpdatePlayerVelocimetro(playerid) {
 
        new playervehicle;

        if ( (playervehicle = GetPlayerVehicleID(playerid)) != INVALID_VEHICLE_ID) {
 
            new string_velo[15];
 
            format(string_velo, sizeof (string_velo), "%02d", GetVehicleSpeed(playervehicle));
            PlayerTextDrawSetString(playerid, textPlayerVelocimetro[1][playerid], string_velo);

            new string_litro[20];
			format(string_litro, sizeof(string_litro), "%02d Litros",PlayerDados[playerid][gasolina]);

            PlayerTextDrawSetString(playerid, textPlayerVelocimetro[2][playerid], string_litro);

            new Processo[41], Zona[MAX_PLAYER_NAME];//aqui ele vai checar a zona.
		    GetPlayer2DZone(playerid, Zona, MAX_ZONE_NAME);//ele procura a zona que vc esta e te da!
		    format(Processo, sizeof(Processo), "%s", Zona);//formata tudo
		    PlayerTextDrawSetString(playerid, textPlayerVelocimetro[3][playerid], Processo);
        }
        return 1;
}
stock ShowPlayerVelocimetro(playerid) {
        if ( PlayerVelocimetro[playerid] ) {
            return 0;
        }

        PlayerTextDrawSetString(playerid, textPlayerVelocimetro[0][playerid], getVehicleName(GetPlayerVehicleID(playerid)));

        for( new text; text != 5; text++) TextDrawShowForPlayer(playerid, textVelocimetro[text]);
        for( new text; text != 6; text++) PlayerTextDrawShow(playerid, textPlayerVelocimetro[text][playerid]);
        PlayerVelocimetro[playerid] = true ;
        PlayerVelocimetroTimer[playerid] = SetTimerEx("UpdatePlayerVelocimetro", 100, true, "i", playerid);
        return 1;
}
 
stock HidePlayerVelocimetro(playerid) {
        if ( !PlayerVelocimetro[playerid] ) {
            return 0;
        }
        for( new text; text != 5; text++) TextDrawHideForPlayer(playerid, textVelocimetro[text]);
        for( new text; text != 6; text++) PlayerTextDrawHide(playerid, textPlayerVelocimetro[text][playerid]);
        PlayerVelocimetro[playerid] = false ;
        KillTimer(PlayerVelocimetroTimer[playerid]);
        return 1;
}
stock getVehicleName(vehicleid){
        new vehmodel = GetVehicleModel(vehicleid);
        new nameVeh[75];

        if (vehmodel < 400 || vehmodel > 611) {
                strcat(nameVeh, "Nenhum");
                return nameVeh;
        }
        strcat(nameVeh, VehicleNames[vehmodel - 400]);
        return nameVeh;
}
 
stock GetVehicleSpeed(vehicleid)
{
        new Float:xPos[3];
        GetVehicleVelocity(vehicleid, xPos[0], xPos[1], xPos[2]);
        return floatround(floatsqroot(xPos[0] * xPos[0] + xPos[1] * xPos[1] + xPos[2] * xPos[2]) * 170.00);
}

stock motorcarro(playerid)
{
    	if( GetPlayerState(playerid) == PLAYER_STATE_DRIVER )
		{
		
			new mot, lu, alar, por, cap, porma, ob;
			new carro = GetPlayerVehicleID(playerid);
			new Float:vidacarro;
			GetVehicleHealth(carro, vidacarro);
			GetVehicleParamsEx(carro, mot, lu, alar, por, cap, porma, ob);
			

			if(Motor[carro] == 0 && PlayerDados[playerid][gasolina] > 0)
			{
				SetVehicleParamsEx(carro, VEHICLE_PARAMS_ON, VEHICLE_PARAMS_ON, alar, por, cap, porma, ob);
				Motor[carro] = 1;
				SendClientMessage(playerid, 0xFFFFFFAA, "Veiculo {2F991A}Ligado!");
			}
			else if(Motor[carro] == 1)
			{
				SetVehicleParamsEx(carro, VEHICLE_PARAMS_OFF, VEHICLE_PARAMS_OFF, alar, por, cap, porma, ob);
				Motor[carro] = 0;
				SendClientMessage(playerid, 0xFFFFFFAA, "Veiculo {2F991A}Desligado!");
			}
			return 1;
		}
     	return 1;
}
stock IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
		if (string[i] > '9' || string[i] < '0') return 0;
	}
    return 1;
}
stock fileLog(file[], string[]) // Creditos "im" do forum samp.
{
    new time[6], timestr[32], data[256], File:hFile, thefile[32];
    gettime(time[0], time[1], time[2]);
    getdate(time[3], time[4], time[5]);
    format(timestr,32,"[%02d/%02d/%02d - %02d:%02d:%02d] ", time[5],time[4], time[3], time[0], time[1], time[2]);
    format(data, sizeof(data), "%s%s\r\n",timestr, string);
    format(thefile, sizeof(thefile), "Logs/%s.log", file);
    hFile = fopen(thefile, io_append);
    fwrite(hFile, data);
    fclose(hFile);
    return 1;
}
//Comandos é outros
COMMAND:givecar(playerid, params[])
{
	if (IsPlayerAdmin(playerid))
	{
        new car;
        new string[128];
        new Float:X, Float:Y, Float:Z; //This will be where the vehicle spawns!
        GetPlayerPos(playerid, Float:X, Float:Y, Float:Z);
        if(sscanf(params,"i", car))
        {
            return SendClientMessage(playerid,COR_ERRO,"USAGE: /givecar <Vehicle ID 400 - 611>");
        }
        else if(car < 400 || car >611){
            return SendClientMessage(playerid, COR_ERRO, "ERROR: Cannot go under 400 or above 611.");
        }
        else
        {
            if(Vehicle[playerid] != 0)
            {
            	DestroyVehicle(Vehicle[playerid]);
            }
            Vehicle[playerid] = CreateVehicle(car, X, Y, Z + 2.0, 0, -1, -1, 1);
            PutPlayerInVehicle(playerid, Vehicle[playerid], 0);
            format(string,sizeof(string),"You Have Spawned Vehicle ID %i",car);
            SendClientMessage(playerid, COR_SUCCESS, string);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Only admins can use this command!");
	return 1;
}
CMD:hq(playerid)
{
    if(HQ[playerid] == true)
    {
        SendClientMessage(playerid, COR_ERRO, "INFO | Você desmarcou do seu radar o local da sua profissão!");
        RemovePlayerMapIcon(playerid, GPS_ID);
        HQ[playerid] = false;
    }
    else if(HQ[playerid] == false)
    {
       if(PlayerDados[playerid][Profissao] == Petroleiro)
        {
            SetPlayerMapIcon(playerid, GPS_ID, 312.1143,1477.8135,8.8824, GPS_ICON, 0, MAPICON_GLOBAL);
            SendClientMessage(playerid, COR_SUCCESS, "INFO | Foi marcado em seu radar o local de sua HQ / Profissão!");

            PlayerPlaySound(playerid, 1057, 0 ,0, 0);
            HQ[playerid] = true;
        }
    }
    return 1;
}
CMD:carregar(playerid)
{
    if(PlayerDados[playerid][Profissao] == Petroleiro)
    {
        if(PlayerToPoint(playerid, 30.0, 234.8112,1411.8942,11.1719))
        {
            if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 514)
            {
                if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
                {
                    ShowPlayerDialog(playerid, DialogCarregarPetroleiro, DIALOG_STYLE_TABLIST_HEADERS, "Cargas » Disponiveis", "Local\t{008000}Valor\nPosto de Spinybed\t{008000}$900\nPosto de Las Venturas\t{008000}$800\nPosto de Temple\t{008000}$1000\nPosto de Whetstone\t{008000}$1800\nPosto de Doherty\t{008000}$1400\nPosto de Easter Basin\t{008000}$1450\nPosto de Juniper Hollow\t{008000}$1600\nPosto de Tirra Robada\t{008000}$1300\nPosto de Fort Carson\t{008000}$70", "Selecionar", "Voltar");
                }
                else SendClientMessage(playerid, COR_ERRO, "ERRO | Você não está com um 'Trailer de petroleo'");
            }
            else SendClientMessage(playerid, COR_ERRO, "ERRO | Você só pode carregar se estiver dirigindo uma carreta de petroleo!");
         }
         else SendClientMessage(playerid, COR_ERRO, "ERRO | Você não está na área de carregamento!");
    }
    return 1;
}
CMD:descarregar(playerid)
{
    if(PlayerDados[playerid][Profissao] == Petroleiro)
    {
        if(carregado[playerid] == 0)
        {
            SendClientMessage(playerid, COR_ERRO, "ERRO | O seu caminhão não está carregado!");
        }
        else
        {
        	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 514)
            {
                if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
                {
                	if(Motor[GetPlayerVehicleID(playerid)] == 0)
                	{
                		// Posto de Spinybed
                		if(PlayerToPoint(playerid, 20.0, 2147.2913,2748.4233,10.5247) && carregado[playerid] == 1)
			            {
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$900");
	                        GivePlayerMoney(playerid, 900);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Las Venturas
			            else if(PlayerToPoint(playerid, 20.0, 2639.6121,1106.8522,10.3771) && carregado[playerid] == 2){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$800");
	                        GivePlayerMoney(playerid, 800);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Temple
			            else if(PlayerToPoint(playerid, 20.0, 1004.0529,-938.4166,41.7306) && carregado[playerid] == 3){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$1000");
	                        GivePlayerMoney(playerid, 1000);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Whetstone
			            else if(PlayerToPoint(playerid, 20.0, -1607.2217,-2714.9656,48.1127) && carregado[playerid] == 4){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$1800");
	                        GivePlayerMoney(playerid, 1800);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Doherty
			            else if(PlayerToPoint(playerid, 20.0, -2028.1998,156.6336,28.3998) && carregado[playerid] == 5){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$1400");
	                        GivePlayerMoney(playerid, 1400);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Easter Basin
			            else if(PlayerToPoint(playerid, 20.0, -1676.0660,413.3091,6.7472) && carregado[playerid] == 6){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$1450");
	                        GivePlayerMoney(playerid, 1450);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Juniper Hollow
			            else if(PlayerToPoint(playerid, 20.0, -2409.0630,976.4838,44.8595) && carregado[playerid] == 7){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$1600");
	                        GivePlayerMoney(playerid, 1600);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Tirra Robada
			            else if(PlayerToPoint(playerid, 20.0, -1329.1506,2677.6660,49.6365) && carregado[playerid] == 8){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$1300");
	                        GivePlayerMoney(playerid, 1300);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            // Posto de Fort Carson
			            else if(PlayerToPoint(playerid, 20.0, 70.7164,1219.1143,18.3873) && carregado[playerid] == 9){
			            	SendClientMessage(playerid, COR_SUCCESS, "Você descarregou o seu caminhão e ganhou R$70");
	                        GivePlayerMoney(playerid, 70);
	                        respawntrailer = (GetVehicleTrailer(GetPlayerVehicleID(playerid)));
	                        SetVehicleToRespawn(respawntrailer);
	                        RemovePlayerMapIcon(playerid, 41);
	                        carregado[playerid] = 0;
			            }
			            else SendClientMessage(playerid, COR_ERRO, "ERRO | Você não está na área de descarregamento!");
                	}else{
                		SendClientMessage(playerid, COR_ERRO, "| ERRO | Você tem que desligar o veiculo!");
                	}
                }
                else SendClientMessage(playerid, COR_ERRO, "ERRO | Você não está com um 'Trailer de petroleo'");
            }
            else SendClientMessage(playerid, COR_ERRO, "ERRO | Você só pode descarregar se estiver dirigindo uma carreta de petroleo!");
        }
    }
    return 1;
}
/*==================[ level = status ]=====================*/

CMD:level (playerid)
{
	new str[600];
	format(str, sizeof(str), "{16d300}• Seu Level Atual É {0097FF}%d\n{17f300}• Seu EXP Atual É %d/10000\n\n{c0c0c0}Digite /AjudaLevel Para Mais Informações.\n", GetPlayerScore(playerid), 0);
	ShowPlayerDialog(playerid, DialogScore, DIALOG_STYLE_MSGBOX, "{0097FF}Level", str, "OK", "");
	return 1;
}
/*==============[ Profissao ]=================*/
CMD:profissao (playerid)
{
	if(PlayerDados[playerid][Profissao] == Desempregado) return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você Está Desempregado! Vá Até Uma Agência de Empregos!");

	if(PlayerDados[playerid][Profissao] == Petroleiro)
	{
	    new str[1280];
	    strcat(str, "{FF0000}Transportador de Concretos:\n\n{c0c0c0}Você Trabalha Transportando Concretos Com Caminhões!\n\nNa Base De Transp. Concretos, Tem Os Caminhões, Os Quais Você Deve Usar Para Transportar As Cargas De Concreto!\nApós Entregar O Concreto, Você Recebera Uma Quantia Referente A Carga Selecionada.\n\n");
	    strcat(str, "/Carregar - Para Selecionar A Carga A Ser Entregue\n/Descarregar - Para Descarregar A Carga Em Seu Destino\n/Cp - Chat Profissão\n\n{00FF04}Salario: $1800");
	    ShowPlayerDialog(playerid, DialogProfissao, DIALOG_STYLE_MSGBOX, "{FF0000}Profissão", str, "OK", "");
	}
	return 1;
}
/*==================[ ChatProfissao ]================*/

CMD:cp (playerid, params[])
{
	if(PlayerDados[playerid][Profissao] == Desempregado) return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você É Desempregado!");
	new texto[256], str[256];
	if(sscanf(params, "s[256]", texto)) return SendClientMessage(playerid, COR_ERRO, "| COMANDO | Use: /Cp [ Texto ]");
	format(str, sizeof(str), "| Chat Profissão | %s[%i]: %s", getName(playerid), playerid, texto);
	for(new i; i < MAX_PLAYERS; i++)
	{
		if(Logado{i} == true)
		{
		    if(PlayerDados[i][Profissao] == PlayerDados[playerid][Profissao])
		    {
		        SendClientMessage(i, 0x25d969ff, str);
		    }
		}
	}

	return 1;
}
/*===============[ Ajuda ]===============*/

CMD:ajuda (playerid, params[])
{
	new ajuda[256], msg[256];
	if(sscanf(params, "s[256]", msg)) return SendClientMessage(playerid, COR_ERRO, "| COMANDO | Use: /Ajuda [ Texto ]");
	format(ajuda, sizeof(ajuda), "| AJUDA | %s[ID:%d]:  %s", getName(playerid), playerid,  msg);
	for(new i,a = GetMaxPlayers(); i < a; i++)
	{
		if(IsPlayerConnected(i))
	    {
	        if(PlayerDados[i][Admin] > 0)
	        {
	            SendClientMessage(i, COR_WARNING, ajuda);
	            PlayerPlaySound(i, 1057, 0 ,0, 0);
	        }
		}
	}
	SendClientMessage(playerid, COR_SUCCESS, "| OK | Seu Pedido De Ajuda Foi Enviado Com Sucesso Para Os Administradores!");
	
	format(Log, sizeof(Log), "O %s Pede Ajuda: %s", getName(playerid), msg);
	fileLog("Ajuda", Log);
	return 1;
}
/*===========================[ RespawnV ]====================*/

CMD:respawnv (playerid)
{
	if(PlayerDados[playerid][Admin] == 0) return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você Não Pode Usar Este Comando!");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você Não Está Em Um Veículo!");
	new V = GetPlayerVehicleID(playerid);
	SetVehicleToRespawn(V);
	SendClientMessage(playerid, COR_SUCCESS, "| OK | Veículo Respawnado Com Sucesso!");
	return 1;
}
/*===============[ GPS ]==============*/

CMD:gps (playerid, params[])
{
	new Gps[500];
	format(Gps, sizeof(Gps), "{FFFFFF}Agencia LS\nDepartamento De Policia Los Santos\nHospital De Los Santos\nLoja De Armas De Los Santos\nLoja De Roupas Groove S. LS\nHospital Groove Street LS\nBanco Los Santos\nArena DM/X1\nPier 69\nDocas Los Santos\nBanco San Fierro\nBanco Las Venturas\nAgencia Las Venturas\nAgencia San Fierro\nDepartamento de Policia SF\nDepartamento de Policia LV\n{FF4500}Desativar GPS{FFFFFF}");
	ShowPlayerDialog(playerid, DialogGPS, DIALOG_STYLE_LIST, "{FFFFFF}GPS", Gps, "Selecionar", "Cancelar");
	return 1;
}
//------------------------------------------------------------------------------
/*===============[ Abastecer ]==============*/
CMD:abastecer(playerid)
{
	for (new a = 0; a < sizeof(PostosDeGasolina); a++)
	{
		if(PlayerToPoint(playerid, 8.0, PostosDeGasolina[a][0],PostosDeGasolina[a][1],PostosDeGasolina[a][2]))
	    {
	    	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você Não Está Em Um Veículo!");
	    	else{
	    		new carro = GetPlayerVehicleID(playerid);
	    		if(Motor[carro] == 1){
	    			SendClientMessage(playerid, COR_ERRO, "| ERRO | Você tem que desligar o veiculo!");
	    		}else{
	    			ShowPlayerDialog(playerid, DialogPostoDeGasolina, DIALOG_STYLE_LIST, "» Posto de combustível", "{FFFFFF}Gasolina\nEtanol\nGNV\nDiesel", "Selecionar", "Cancelar");
	    		}
	    	}
	    	return 1;
	    }			
	}

	SendClientMessage(playerid, COR_ERRO, "| ERROR | Você não está em um posto de gasolina!");
    return 1;
}
/*===================[ Admins ]================*/

CMD:admins (playerid)
{

    new Adms[650],ADMsDialog[810],admscount;

	for(new i,a = GetMaxPlayers(); i < a; i++)
	{
		if(IsPlayerConnected(i))
		    {
		    	if(PlayerDados[i][Admin] > 0)
		        {
		            if(PlayerDados[i][Admin] == 1)
		            {
		            if(admscount < 15)
		            format(Adms, sizeof(Adms), "%s\n{FFFFFF}%s {FFFFFF} ID: %i - [ {4169E1}Ajudante {FFFFFF}]", Adms,getName(i),i);
		            admscount++;
		            }
		            //
		            if(PlayerDados[i][Admin] == 2)
		            {
		            if(admscount < 15)
		            format(Adms, sizeof(Adms), "%s\n{FFFFFF}%s {FFFFFF} ID %i - [ {32CD32}Moderador {FFFFFF}]", Adms,getName(i),i);
		            admscount++;
		            }
		            //
		            if(PlayerDados[i][Admin] == 3)
		            {
		            if(admscount < 15)
		            format(Adms, sizeof(Adms), "%s\n{FFFFFF}%s {FFFFFF} ID %i - [ {FFD700}Administrador {FFFFFF}]", Adms,getName(i),i);
		            admscount++;
		            }
		            // 
		            if(PlayerDados[i][Admin] > 3)
		            {
		            if(admscount < 15)
		            format(Adms, sizeof(Adms), "%s\n{FFFFFF}%s {FFFFFF} ID %i - [ {FF4500}Diretoria {FFFFFF}]", Adms,getName(i),i);
		            admscount++;
		            }
		        }
		    }
	}
	
	if(admscount > 0){
		new str[100];
		format(str, sizeof(str), "{FFFFFF}Administradores Online: {FFFF00}%i", admscount);
		format(ADMsDialog, sizeof(ADMsDialog), "%s\n", Adms);
		ShowPlayerDialog(playerid, DialogAdmins, DIALOG_STYLE_MSGBOX, str,ADMsDialog,"Ok","");		
	} 
	else{
		format(ADMsDialog, sizeof(ADMsDialog), "{FF0000}Nenhum Administrador Online!\n", admscount,Adms);
		ShowPlayerDialog(playerid, DialogAdmins, DIALOG_STYLE_MSGBOX,"{FFAE00}Administradores Online:",ADMsDialog,"Ok","");
	}

    return 1;

}

//------------------------------------------------------------------------------
