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
#define SERVER_PASSWORD "sklyandia456123" // Senha aleatoria, só para evitar de alguém logar antes do servidor liberar.
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
#define     DialogGoverno         		(11)	// DEFINE DIALOG Do Menu da Agência de empregos
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
#define COR_ERRO            0xFF0000AA
#define COR_SUCCESS         0x008000AA
#define COR_WARNING         0xFF8000AA

//Profissões

#define Desempregado 			0

// - Honestas

#define Gari 					1
#define PizzaBoy 				2
#define MotoBoy 				3
#define Pescador 				4
#define Mecanico 				5
#define Correios 				6
#define Fazendeiro 				7
#define AgenteFunerario 		8
#define Fotografo               9
#define Jornalista 				10
#define Meteorologista			11
#define Advogador 				12
#define Paramedico              13

// - Transportes

#define MotoTaxi 				14
#define Entregador 				15
#define Taxistas				16
#define MotoristaOnibus         17
#define Transportador 			18
#define Maquinista         		19
#define Petroleiro              20
#define Concreteiro             21
#define TaxiAereo             	22
#define Piloto         			23
#define MotoristacarroForte 	24

// - Policias

#define PMilitar                25
#define PFederal               	26
#define PRodoviaria             27
#define Delegado                28
#define FBI                		29
#define CIA                		30
#define SWAT                	31
#define Interpol                32

// - Governo

#define Bombeiro                33
#define Corregedoria            34
#define Marinha                	35
#define Exercito                36
#define Aeronautica             37

//Cores Profissão

// Cores - Honestas

#define C_Gari 					0x008000AA
#define C_PizzaBoy              0xFF8040AA
#define C_MotoBoy               0x808000AA
#define C_Pescador              0x408080AA
#define C_Mecanico              0x008040AA
#define C_Correios              0xF3D70CAA
#define C_Fazendeiro            0xCECE00AA
#define C_AgenteFunerario       0x333333AA
#define C_Fotografo             0xA518DAAA
#define C_Jornalista            0x00C4C4AA
#define C_Meteorologista        0x009B9BAA
#define C_Advogador             0x0000A0AA
#define C_Paramedico            0x00DEEAAA

// Cores - Tranportes

#define C_MotoTaxi              0xF3BF0CAA
#define C_Entregador            0x84B4C6AA
#define C_Taxistas              0xF3BF0CAA
#define C_MotoristaOnibus       0xBFC486AA
#define C_Transportador         0x00D200AA
#define C_Maquinista            0xF99B46AA
#define C_Petroleiro            0x009EEAAA
#define C_Concreteiro           0xFFA346AA
#define C_TaxiAereo             0xF3BF0CAA
#define C_Piloto                0xA6D9ADAA
#define C_MotoristacarroForte   0x9A9A9AAA

// Cores - Policias

#define C_PMilitar              0x0080FFAA
#define C_PFederal              0x0067CEAA
#define C_PRodoviaria           0x005CB9AA
#define C_Delegado              0x022BB5AA
#define C_FBI                   0x02249BAA
#define C_CIA                   0x011A6BAA
#define C_SWAT                  0x3C0C8BAA
#define C_Interpol              0x0F2E68AA

// Cores - Governo

#define C_Bombeiro               0xEF7829AA
#define C_Corregedoria           0x9B0000AA
#define C_Marinha                0x8CC6FFAA
#define C_Exercito               0x006400AA
#define C_Aeronautica            0xD8C01BAA

// Salários

#define Salario_Desempregado       100

// Salário - Honestas

#define Salario_Gari 				580
#define Salario_PizzaBoy 			600
#define Salario_MotoBoy 			620
#define Salario_Pescador 			680
#define Salario_Mecanico 			780
#define Salario_Correios 			900
#define Salario_Fazendeiro 			1800
#define Salario_AgenteFunerario 	1480
#define Salario_Fotografo           1480
#define Salario_Jornalista 			1580
#define Salario_Meteorologista		1600
#define Salario_Advogador 			1800
#define Salario_Paramedico          2000

// Salário - Transportes

#define Salario_MotoTaxi 			700
#define Salario_Entregador 			750
#define Salario_Taxistas			800
#define Salario_MotoristaOnibus     820
#define Salario_Transportador 		840
#define Salario_Maquinista         	860
#define Salario_Petroleiro          880
#define Salario_Concreteiro         890
#define Salario_TaxiAereo           900
#define Salario_Piloto         		980
#define Salario_MotoristacarroForte 1000

// Salário - Policias

#define Salario_PMilitar            1800
#define Salario_PFederal            1900
#define Salario_PRodoviaria         2000
#define Salario_Delegado            2100
#define Salario_FBI                	2200
#define Salario_CIA                	2300
#define Salario_SWAT               	2400
#define Salario_Interpol            2500

// Salário - Governo

#define Salario_Bombeiro            3000
#define Salario_Corregedoria        4000
#define Salario_Marinha             5000
#define Salario_Exercito            5100
#define Salario_Aeronautica         5200

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

// Lixos Pela Cidade Lata
new Text3D:lixosLatasText[148];
new Float:lixosLatasPos[148][4] = 
{
	{1659.880615,2159.108154,10.820312, 3.0}, // MakeABigLove Local: Redsands West
	{1659.870849,2161.945068,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1659.960327,2124.111328,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1665.887329,2108.989746,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1659.797973,2084.208007,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1665.851318,2055.916992,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1665.807373,2034.607177,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1445.339965,1917.659301,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1427.905151,1905.005737,10.820312, 3.0}, // oArthurTV Local: Redsands West
	{1576.840820,2091.516357,10.820312, 3.0}, // MakeABigLove Local: Redsands West
	{1576.841552,2118.924804,10.820312, 3.0}, // MakeABigLove Local: Redsands West
	{1576.852294,2161.098632,10.820312, 3.0}, // MakeABigLove Local: Redsands West
	{1612.264038,-1896.164794,13.547922, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1619.213012,-1896.258056,13.549642, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1625.992797,-1896.330078,13.551314, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1629.861328,-1906.063476,13.551663, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1643.702880,-1907.518798,13.552103, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{-2759.328613,144.504440,7.031250, 3.0}, // oArthurTV Local: Ocean Flats
	{-2762.186767,114.866287,6.965419, 3.0}, // oArthurTV Local: Ocean Flats
	{-2765.158691,86.311645,6.970289, 3.0}, // oArthurTV Local: Ocean Flats
	{-2761.418457,64.072830,6.967107, 3.0}, // oArthurTV Local: Ocean Flats
	{-2765.370605,52.514404,7.031250, 3.0}, // oArthurTV Local: Ocean Flats
	{-2718.954833,77.910636,4.335937, 3.0}, // oArthurTV Local: Ocean Flats
	{-2718.016113,74.651329,4.335937, 3.0}, // oArthurTV Local: Ocean Flats
	{-2755.222412,90.086982,7.031250, 3.0}, // oArthurTV Local: Ocean Flats
	{-2755.479736,93.639083,7.031250, 3.0}, // oArthurTV Local: Ocean Flats
	{-2756.908691,96.029754,7.031250, 3.0}, // oArthurTV Local: Ocean Flats
	{-2652.299804,92.387336,4.096681, 3.0}, // oArthurTV Local: Ocean Flats
	{-2655.657714,115.290832,4.111680, 3.0}, // oArthurTV Local: Ocean Flats
	{-2652.956542,133.424789,4.179687, 3.0}, // oArthurTV Local: Ocean Flats
	{-2656.724609,135.285125,4.179687, 3.0}, // oArthurTV Local: Ocean Flats
	{-2655.534912,71.669174,4.108856, 3.0}, // oArthurTV Local: Ocean Flats
	{-2650.855468,52.585090,4.179687, 3.0}, // oArthurTV Local: Ocean Flats
	{1627.364501,-1847.431152,13.537542, 3.0}, // Davi_Satler Local: Verdant Bluffs
	{1648.491088,-1841.342895,13.544188, 3.0}, // Davi_Satler Local: Commerce
	{1635.785888,-1847.031372,13.539696, 3.0}, // Davi_Satler Local: Verdant Bluffs
	{1601.165771,-1831.938598,13.488179, 3.0}, // Davi_Satler Local: Commerce
	{1597.069458,-1809.257202,13.396594, 3.0}, // Davi_Satler Local: Commerce
	{-2657.260498,-89.587234,4.177209, 3.0}, // oArthurTV Local: Ocean Flats
	{1593.646484,-1784.680908,13.284209, 3.0}, // Davi_Satler Local: Commerce
	{-2658.227294,-125.212974,4.081083, 3.0}, // oArthurTV Local: Ocean Flats
	{-2654.726074,-124.595207,4.091534, 3.0}, // oArthurTV Local: Ocean Flats
	{-2657.929687,-169.006225,4.093238, 3.0}, // oArthurTV Local: Ocean Flats
	{-2654.434326,-167.380996,4.086997, 3.0}, // oArthurTV Local: Ocean Flats
	{-2656.882324,-189.503646,4.164876, 3.0}, // oArthurTV Local: Ocean Flats
	{-2653.840576,-188.273513,4.149031, 3.0}, // oArthurTV Local: Ocean Flats
	{-2754.998046,-178.563842,6.940709, 3.0}, // oArthurTV Local: Ocean Flats
	{-2754.359130,-149.845672,6.933187, 3.0}, // oArthurTV Local: Ocean Flats
	{-2758.210693,-136.260482,6.956016, 3.0}, // oArthurTV Local: Ocean Flats
	{-2754.321533,-121.648780,6.942591, 3.0}, // oArthurTV Local: Ocean Flats
	{-2758.155273,-120.928550,6.945843, 3.0}, // oArthurTV Local: Ocean Flats
	{-2758.760742,-96.556129,6.970007, 3.0}, // oArthurTV Local: Ocean Flats
	{-2755.475585,-85.449035,7.031250, 3.0}, // oArthurTV Local: Ocean Flats
	{1902.564575,-1789.789062,13.546875, 3.0}, // Davi_Satler Local: Idlewood
	{1902.561767,-1778.837890,13.546875, 3.0}, // Davi_Satler Local: Idlewood
	{-2755.905273,-56.767398,7.031614, 3.0}, // oArthurTV Local: Ocean Flats
	{-2759.664062,-54.228942,7.039062, 3.0}, // oArthurTV Local: Ocean Flats
	{-2756.962158,-36.343055,6.959138, 3.0}, // oArthurTV Local: Ocean Flats
	{-2762.647460,-13.587108,6.961468, 3.0}, // oArthurTV Local: Ocean Flats
	{-2760.518066,7.775696,6.959648, 3.0}, // oArthurTV Local: Ocean Flats
	{-2764.978027,25.035526,7.039062, 3.0}, // oArthurTV Local: Ocean Flats
	{1939.674316,-1887.528442,13.538429, 3.0}, // adrian2098 Local: El Corona
	{1862.334594,-1887.739135,13.462883, 3.0}, // MakeABigLove Local: El Corona
	{1891.161254,-1887.640380,13.491042, 3.0}, // adrian2098 Local: El Corona
	{1840.525512,-1887.938964,13.425951, 3.0}, // MakeABigLove Local: El Corona
	{1847.039550,-1861.520385,13.578125, 3.0}, // adrian2098 Local: El Corona
	{1855.890258,-1861.876464,13.578125, 3.0}, // adrian2098 Local: El Corona
	{1667.040893,-998.542114,24.054567, 3.0}, // adrian2098 Local: Mulholland Intersection
	{1611.966308,-994.903137,24.078125, 3.0}, // Davi_Satler Local: Mulholland Intersection
	{1660.705932,-1001.342468,24.046083, 3.0}, // adrian2098 Local: Mulholland Intersection
	{1631.104492,-988.457275,24.075675, 3.0}, // Davi_Satler Local: Mulholland Intersection
	{1633.130126,-991.195434,24.077634, 3.0}, // Davi_Satler Local: Mulholland Intersection
	{1658.965332,-1064.715698,23.903686, 3.0}, // Davi_Satler Local: Mulholland Intersection
	{1829.539916,-1113.947998,23.876493, 3.0}, // Davi_Satler Local: Glen Park
	{1829.538818,-1097.306030,23.882259, 3.0}, // Davi_Satler Local: Glen Park
	{1829.539794,-1084.294067,23.881219, 3.0}, // Davi_Satler Local: Glen Park
	{1829.584960,-1143.868652,23.880861, 3.0}, // Davi_Satler Local: Glen Park
	{1829.540405,-1147.415039,23.882211, 3.0}, // Davi_Satler Local: Glen Park
	{1800.407714,-1147.258056,23.841415, 3.0}, // Davi_Satler Local: Mulholland Intersection
	{1786.255737,-1147.261718,23.872426, 3.0}, // Davi_Satler Local: Mulholland Intersection
	{-2135.744628,-2263.161865,30.631902, 3.0}, // oArthurTV Local: Angel Pine
	{-2137.922119,-2261.443359,30.631902, 3.0}, // oArthurTV Local: Angel Pine
	{-2088.535888,-2342.689941,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2175.499511,-2425.128417,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2184.750732,-2448.105224,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{1788.734375,-1116.109619,24.085935, 3.0}, // adrian2098 Local: Mulholland Intersection
	{-2146.089599,-2463.277587,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2137.213623,-2451.346923,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{1788.872192,-1112.386108,24.085935, 3.0}, // adrian2098 Local: Mulholland Intersection
	{-2088.625000,-2440.140380,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2107.786865,-2456.887939,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2106.756591,-2457.106445,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{1521.220581,-1018.233886,23.917407, 3.0}, // adrian2098 Local: Mulholland Intersection
	{1521.233276,-1014.792907,23.975431, 3.0}, // adrian2098 Local: Mulholland Intersection
	{-2213.313476,-2340.107421,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2218.013916,-2336.744873,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-2102.879882,-2480.225585,30.625000, 3.0}, // oArthurTV Local: Angel Pine
	{-77.833663,-1189.046630,1.750000, 3.0}, // oArthurTV Local: Flint County
	{-64.218757,-1107.193725,1.078125, 3.0}, // oArthurTV Local: Flint County
	{-69.038307,-1105.630126,1.078125, 3.0}, // oArthurTV Local: Flint County
	{255.072708,-133.658996,1.578125, 3.0}, // oArthurTV Local: Blueberry
	{259.476562,-133.844665,1.578125, 3.0}, // oArthurTV Local: Blueberry
	{668.137512,-623.402221,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{665.149963,-623.338806,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{724.840026,-465.785980,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{339.040435,53.780426,3.607334, 3.0}, // oArthurTV Local: Blueberry
	{340.475677,55.427253,3.658917, 3.0}, // oArthurTV Local: Blueberry
	{694.326110,-455.964691,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{655.935729,-440.320159,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{653.797607,-496.443328,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{653.850524,-499.335296,16.335937, 3.0}, // Davi_Satler Local: Dillimore
	{-25.856176,1165.398681,19.360418, 3.0}, // oArthurTV Local: Fort Carson
	{-44.115924,1178.239624,19.413167, 3.0}, // oArthurTV Local: Fort Carson
	{-88.740135,1164.346435,19.742187, 3.0}, // oArthurTV Local: Fort Carson
	{-149.645629,1163.064086,19.749988, 3.0}, // oArthurTV Local: Fort Carson
	{-161.052108,1175.032592,19.742187, 3.0}, // oArthurTV Local: Fort Carson
	{-170.299285,1170.099365,19.749988, 3.0}, // oArthurTV Local: Fort Carson
	{-148.805740,1133.948974,19.742187, 3.0}, // oArthurTV Local: Fort Carson
	{-122.764945,1079.321777,19.781459, 3.0}, // oArthurTV Local: Fort Carson
	{-89.552352,1128.303588,19.742187, 3.0}, // oArthurTV Local: Fort Carson
	{308.949340,-254.097839,1.583575, 3.0}, // Davi_Satler Local: Blueberry
	{306.045654,-254.049346,1.583575, 3.0}, // Davi_Satler Local: Blueberry
	{253.449447,-264.151428,1.583575, 3.0}, // Davi_Satler Local: Blueberry
	{251.410354,-263.587066,1.578125, 3.0}, // Davi_Satler Local: Blueberry
	{1337.552734,-1774.017456,13.546875, 3.0}, // MakeABigLove Local: Commerce
	{1337.083129,-1842.888061,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1337.528808,-1816.234130,13.546875, 3.0}, // MakeABigLove Local: Commerce
	{1420.383666,-1844.273071,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1420.489013,-1846.539306,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1466.204345,-1847.898437,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1468.807495,-1847.749755,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1485.991088,-1847.321899,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1516.799438,-1849.293090,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1538.220703,-1849.323730,13.546875, 3.0}, // MakeABigLove Local: Verdant Bluffs
	{1352.587280,204.583236,19.554687, 3.0}, // Davi_Satler Local: Montgomery
	{1546.319213,-1808.654785,13.546875, 3.0}, // MakeABigLove Local: Commerce
	{1352.121337,201.396667,19.554687, 3.0}, // Davi_Satler Local: Montgomery
	{1461.677001,-1488.477172,13.546875, 3.0}, // MakeABigLove Local: Commerce
	{1534.896972,-1480.240844,9.500000, 3.0}, // MakeABigLove Local: Commerce
	{1537.656372,-1479.913818,9.500000, 3.0}, // MakeABigLove Local: Commerce
	{1593.078247,-1201.418579,19.816234, 3.0}, // MakeABigLove Local: Downtown Los Santos
	{1616.499877,-1201.411865,19.806867, 3.0}, // MakeABigLove Local: Downtown Los Santos
	{1660.520141,-1201.406250,19.793170, 3.0}, // MakeABigLove Local: Downtown Los Santos
	{1322.311645,-1236.913940,13.546875, 3.0}, // MakeABigLove Local: Market
	{1425.616577,-1080.529907,17.558263, 3.0}, // MakeABigLove Local: Downtown Los Santos
	{1425.553344,-1084.289428,17.553672, 3.0}, // MakeABigLove Local: Downtown Los Santos
	{1435.805297,-1094.766479,17.596670, 3.0}, // MakeABigLove Local: Downtown Los Santos
	{1438.203125,-1094.812866,17.609136, 3.0} // MakeABigLove Local: Downtown Los Santos
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
		segundoUP,
        minutoUP,
        saude,
        sono,
        sede,
        fome, 
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
// Status
new Text:textStatus[14];
new PlayerText:textStatusBar[MAX_PLAYERS][8];
// Textos Info da Profissão
new PlayerText:textProfissaoInfo[MAX_PLAYERS][5];
// Status Update
new timer_StatusFome[MAX_PLAYERS];
new timer_StatusSede[MAX_PLAYERS];
new timer_StatusSaude[MAX_PLAYERS];
new timer_UpdatePlayerLevel[MAX_PLAYERS];

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
    taxiCar[10],
    mecanicoCar[10],
	carroForteCar[13],
	gariCar[4],
	pescaCar[8],
	transportadorCar[7],
	pizzaBoyCar[10],
	entregadorCar[8],
	motoTaxiCar[11],
    VeiculoPublico[37];

new bool:HQ[MAX_PLAYERS] = false;
new bool:profissaoUniforme[MAX_PLAYERS] = false;
new profissaoCar[MAX_PLAYERS] = false;
new profissaoCarregandoOJG[MAX_PLAYERS] = false;
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
    new Password[256];
	format(Password, sizeof(Password), "password %s", SERVER_PASSWORD);
	SendRconCommand(Password);

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
    //SetTimer("ProcessGameTime", 1000, 1);

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


    // Status

	textStatus[0] = TextDrawCreate(543.938537, 242.499938, "box");
	TextDrawLetterSize(textStatus[0], 0.000000, 16.659065);
	TextDrawTextSize(textStatus[0], 633.000000, 0.000000);
	TextDrawAlignment(textStatus[0], 1);
	TextDrawColor(textStatus[0], -1);
	TextDrawUseBox(textStatus[0], 1);
	TextDrawBoxColor(textStatus[0], 319555162);
	TextDrawSetShadow(textStatus[0], 0);
	TextDrawSetOutline(textStatus[0], 0);
	TextDrawBackgroundColor(textStatus[0], -1378294017);
	TextDrawFont(textStatus[0], 1);
	TextDrawSetProportional(textStatus[0], 1);
	TextDrawSetShadow(textStatus[0], 0);

	textStatus[1] = TextDrawCreate(544.950195, 244.233551, "box");
	TextDrawLetterSize(textStatus[1], 0.000000, 1.886672);
	TextDrawTextSize(textStatus[1], 631.745849, 0.000000);
	TextDrawAlignment(textStatus[1], 1);
	TextDrawColor(textStatus[1], -1);
	TextDrawUseBox(textStatus[1], 1);
	TextDrawBoxColor(textStatus[1], 1246118721);
	TextDrawSetShadow(textStatus[1], 0);
	TextDrawSetOutline(textStatus[1], 0);
	TextDrawBackgroundColor(textStatus[1], 255);
	TextDrawFont(textStatus[1], 1);
	TextDrawSetProportional(textStatus[1], 0);
	TextDrawSetShadow(textStatus[1], 0);

	textStatus[2] = TextDrawCreate(559.354797, 244.533126, "Status");
	TextDrawLetterSize(textStatus[2], 0.400000, 1.600000);
	TextDrawAlignment(textStatus[2], 1);
	TextDrawColor(textStatus[2], -1);
	TextDrawSetShadow(textStatus[2], 0);
	TextDrawSetOutline(textStatus[2], 0);
	TextDrawBackgroundColor(textStatus[2], 255);
	TextDrawFont(textStatus[2], 2);
	TextDrawSetProportional(textStatus[2], 1);
	TextDrawSetShadow(textStatus[2], 0);

	textStatus[3] = TextDrawCreate(544.950195, 269.835113, "box");
	TextDrawLetterSize(textStatus[3], 0.000000, 1.886672);
	TextDrawTextSize(textStatus[3], 631.745849, 0.000000);
	TextDrawAlignment(textStatus[3], 1);
	TextDrawColor(textStatus[3], -1);
	TextDrawUseBox(textStatus[3], 1);
	TextDrawBoxColor(textStatus[3], 1246118721);
	TextDrawSetShadow(textStatus[3], 0);
	TextDrawSetOutline(textStatus[3], 0);
	TextDrawBackgroundColor(textStatus[3], 255);
	TextDrawFont(textStatus[3], 1);
	TextDrawSetProportional(textStatus[3], 0);
	TextDrawSetShadow(textStatus[3], 0);

	textStatus[4] = TextDrawCreate(544.950195, 293.336547, "box");
	TextDrawLetterSize(textStatus[4], 0.000000, 1.886672);
	TextDrawTextSize(textStatus[4], 631.745849, 0.000000);
	TextDrawAlignment(textStatus[4], 1);
	TextDrawColor(textStatus[4], -1);
	TextDrawUseBox(textStatus[4], 1);
	TextDrawBoxColor(textStatus[4], 1246118721);
	TextDrawSetShadow(textStatus[4], 0);
	TextDrawSetOutline(textStatus[4], 0);
	TextDrawBackgroundColor(textStatus[4], 255);
	TextDrawFont(textStatus[4], 1);
	TextDrawSetProportional(textStatus[4], 0);
	TextDrawSetShadow(textStatus[4], 0);

	textStatus[5] = TextDrawCreate(544.950195, 317.138000, "box");
	TextDrawLetterSize(textStatus[5], 0.000000, 1.886672);
	TextDrawTextSize(textStatus[5], 631.745849, 0.000000);
	TextDrawAlignment(textStatus[5], 1);
	TextDrawColor(textStatus[5], -1);
	TextDrawUseBox(textStatus[5], 1);
	TextDrawBoxColor(textStatus[5], 1246118721);
	TextDrawSetShadow(textStatus[5], 0);
	TextDrawSetOutline(textStatus[5], 0);
	TextDrawBackgroundColor(textStatus[5], 255);
	TextDrawFont(textStatus[5], 1);
	TextDrawSetProportional(textStatus[5], 0);
	TextDrawSetShadow(textStatus[5], 0);

	textStatus[6] = TextDrawCreate(544.950195, 341.139465, "box");
	TextDrawLetterSize(textStatus[6], 0.000000, 1.886672);
	TextDrawTextSize(textStatus[6], 631.745849, 0.000000);
	TextDrawAlignment(textStatus[6], 1);
	TextDrawColor(textStatus[6], -1);
	TextDrawUseBox(textStatus[6], 1);
	TextDrawBoxColor(textStatus[6], 1246118721);
	TextDrawSetShadow(textStatus[6], 0);
	TextDrawSetOutline(textStatus[6], 0);
	TextDrawBackgroundColor(textStatus[6], 255);
	TextDrawFont(textStatus[6], 1);
	TextDrawSetProportional(textStatus[6], 0);
	TextDrawSetShadow(textStatus[6], 0);

	textStatus[7] = TextDrawCreate(544.950195, 364.840911, "box");
	TextDrawLetterSize(textStatus[7], 0.000000, 1.886672);
	TextDrawTextSize(textStatus[7], 631.745849, 0.000000);
	TextDrawAlignment(textStatus[7], 1);
	TextDrawColor(textStatus[7], -1);
	TextDrawUseBox(textStatus[7], 1);
	TextDrawBoxColor(textStatus[7], 1246118721);
	TextDrawSetShadow(textStatus[7], 0);
	TextDrawSetOutline(textStatus[7], 0);
	TextDrawBackgroundColor(textStatus[7], 255);
	TextDrawFont(textStatus[7], 1);
	TextDrawSetProportional(textStatus[7], 0);
	TextDrawSetShadow(textStatus[7], 0);

	textStatus[8] = TextDrawCreate(593.058959, 384.866729, "Skylandia");
	TextDrawLetterSize(textStatus[8], 0.259000, 0.899999);
	TextDrawAlignment(textStatus[8], 2);
	TextDrawColor(textStatus[8], -1);
	TextDrawSetShadow(textStatus[8], 0);
	TextDrawSetOutline(textStatus[8], 0);
	TextDrawBackgroundColor(textStatus[8], 255);
	TextDrawFont(textStatus[8], 2);
	TextDrawSetProportional(textStatus[8], 1);
	TextDrawSetShadow(textStatus[8], 0);

	textStatus[9] = TextDrawCreate(533.472961, 256.816284, "");
	TextDrawLetterSize(textStatus[9], 0.000000, 0.000000);
	TextDrawTextSize(textStatus[9], 40.000000, 44.000000);
	TextDrawAlignment(textStatus[9], 1);
	TextDrawColor(textStatus[9], -1);
	TextDrawSetShadow(textStatus[9], 0);
	TextDrawSetOutline(textStatus[9], 0);
	TextDrawBackgroundColor(textStatus[9], 0);
	TextDrawFont(textStatus[9], 5);
	TextDrawSetProportional(textStatus[9], 0);
	TextDrawSetShadow(textStatus[9], 0);
	TextDrawSetPreviewModel(textStatus[9], 19576);
	TextDrawSetPreviewRot(textStatus[9], 0.000000, 0.000000, 0.000000, 1.000000);

	textStatus[10] = TextDrawCreate(535.772399, 288.718231, "");
	TextDrawLetterSize(textStatus[10], 0.000000, 0.000000);
	TextDrawTextSize(textStatus[10], 37.000000, 27.000000);
	TextDrawAlignment(textStatus[10], 1);
	TextDrawColor(textStatus[10], -1);
	TextDrawSetShadow(textStatus[10], 0);
	TextDrawSetOutline(textStatus[10], 0);
	TextDrawBackgroundColor(textStatus[10], 0);
	TextDrawFont(textStatus[10], 5);
	TextDrawSetProportional(textStatus[10], 0);
	TextDrawSetShadow(textStatus[10], 0);
	TextDrawSetPreviewModel(textStatus[10], 19570);
	TextDrawSetPreviewRot(textStatus[10], 0.000000, 0.000000, 0.000000, 1.000000);

	textStatus[11] = TextDrawCreate(539.671447, 306.319305, "");
	TextDrawLetterSize(textStatus[11], 0.000000, 0.000000);
	TextDrawTextSize(textStatus[11], 31.000000, 37.000000);
	TextDrawAlignment(textStatus[11], 1);
	TextDrawColor(textStatus[11], -1);
	TextDrawSetShadow(textStatus[11], 0);
	TextDrawSetOutline(textStatus[11], 0);
	TextDrawBackgroundColor(textStatus[11], 0);
	TextDrawFont(textStatus[11], 5);
	TextDrawSetProportional(textStatus[11], 0);
	TextDrawSetShadow(textStatus[11], 0);
	TextDrawSetPreviewModel(textStatus[11], 11738);
	TextDrawSetPreviewRot(textStatus[11], 0.000000, 0.000000, 0.000000, 1.000000);

	textStatus[12] = TextDrawCreate(544.170349, 338.321258, "");
	TextDrawLetterSize(textStatus[12], 0.000000, 0.000000);
	TextDrawTextSize(textStatus[12], 24.000000, 23.000000);
	TextDrawAlignment(textStatus[12], 1);
	TextDrawColor(textStatus[12], -1);
	TextDrawSetShadow(textStatus[12], 0);
	TextDrawSetOutline(textStatus[12], 0);
	TextDrawBackgroundColor(textStatus[12], 0);
	TextDrawFont(textStatus[12], 5);
	TextDrawSetProportional(textStatus[12], 0);
	TextDrawSetShadow(textStatus[12], 0);
	TextDrawSetPreviewModel(textStatus[12], 1247);
	TextDrawSetPreviewRot(textStatus[12], 0.000000, 0.000000, 0.000000, 1.000000);

	textStatus[13] = TextDrawCreate(545.470031, 363.222778, "");
	TextDrawLetterSize(textStatus[13], 0.000000, 0.000000);
	TextDrawTextSize(textStatus[13], 24.000000, 23.000000);
	TextDrawAlignment(textStatus[13], 1);
	TextDrawColor(textStatus[13], -1);
	TextDrawSetShadow(textStatus[13], 0);
	TextDrawSetOutline(textStatus[13], 0);
	TextDrawBackgroundColor(textStatus[13], 0);
	TextDrawFont(textStatus[13], 5);
	TextDrawSetProportional(textStatus[13], 0);
	TextDrawSetShadow(textStatus[13], 0);
	TextDrawSetPreviewModel(textStatus[13], 1277);
	TextDrawSetPreviewRot(textStatus[13], 0.000000, 0.000000, 30.000000, 1.000000);

    /*              PICKUPS De lugares Publicos             */
    AddStaticPickup(1318,23,1733.5103,-1912.0349,13.5620);// Entrada Da Agência de Empregos
    AddStaticPickup(1318,23,390.7674,173.7650,1008.3828);// Saida Da Agência de Empregos
    AddStaticPickup(1318,23,1833.7811,-1842.6208,13.5781);// Entrada Mercado 24/7 (ID: 0)
    AddStaticPickup(1318,23,-27.3571,-58.2683,1003.5469);// Saida Mercado 24/7 (ID: 0)
    AddStaticPickup(1239,23,-22.1867,-55.6953,1003.5469);// Menu Mercado 24/7 De Compras
    AddStaticPickup(1318,23,1519.1331,-1453.9199,14.2084);// Entrada Auto Escola (ID: 0)
    AddStaticPickup(1318,23,1494.325195,1304.942871,1093.289062);// Saida Auto Escola (ID: 0)
    // Gari
    AddStaticPickup(1210, 23, 2176.1892,-1976.0012,13.5547); // Pegar emprego
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
    // Gari
    Create3DTextLabel("{FFA500}Emprego Gari\n{FFFFFF}Digite /uniforme",0xFFA500AA,2176.1892,-1976.0012,13.5547,10.0,0);
    // Lixos pela cidade 
    for(new i = 0; i < sizeof(lixosLatasPos); i ++)
	{
		lixosLatasText[i] = Create3DTextLabel("{30e551}Lixeira 3/3:\n{FFFFFF}/coletarlixo",0x008080FF,lixosLatasPos[i][0],lixosLatasPos[i][1],lixosLatasPos[i][2],10.0,0);
	}

    //Checks
	CheckAgencia = CPS_AddCheckpoint(363.0818,173.8653,1008.3828, 1.0, 50);// Local de pegar Profissão
    CPAutoEscola = CPS_AddCheckpoint(1490.9628,1305.9032,1093.2964,1.0,50);// Auto Escola

    // Veiculos de petoleiro
    petroleiroCar[0] = AddStaticVehicleEx(514,321.0000000,1395.5996000,8.5000000,73.9930000,108,125,60); //Tanker
	petroleiroCar[1] = AddStaticVehicleEx(514,319.1000100,1389.9000000,8.8000000,73.9980000,108,125,60); //Tanker
	petroleiroCar[2] = AddStaticVehicleEx(514,317.3999900,1384.9000000,8.7000000,73.9980000,108,125,60); //Tanker
	petroleiroCar[3] = AddStaticVehicleEx(514,315.0000000,1375.9000000,9.0000000,73.9980000,108,125,60); //Tanker
	petroleiroCar[4] = AddStaticVehicleEx(514,312.5000000,1370.8000000,9.4000000,73.9980000,108,125,60); //Tanker
	petroleiroCar[5] = AddStaticVehicleEx(514,311.0000000,1365.7000000,9.9000000,73.9980000,108,125,60); //Tanker
	petroleiroCar[6] = AddStaticVehicleEx(514,308.7998000,1355.2002000,9.9000000,73.9930000,108,125,60); //Tanker
	petroleiroCar[7] = AddStaticVehicleEx(514,307.3999900,1349.9000000,9.9000000,73.9930000,108,125,60); //Tanker
	petroleiroCar[8] = AddStaticVehicleEx(514,305.3999900,1343.9000000,9.9000000,73.9930000,108,125,60); //Tanker
	petroleiroCar[9] = AddStaticVehicleEx(514,331.5000000,1470.6000000,8.2000000,79.9910000,108,125,60); //Tanker
	petroleiroCar[10] = AddStaticVehicleEx(514,334.0000000,1483.2002000,8.5000000,79.9910000,108,125,60); //Tanker
	petroleiroCar[11] = AddStaticVehicleEx(514,333.2000100,1476.7000000,8.3000000,79.9910000,108,125,60); //Tanker
	petroleiroCar[12] = AddStaticVehicleEx(514,330.6000100,1464.4000000,8.1000000,79.9910000,108,125,60); //Tanker
	petroleiroCar[13] = AddStaticVehicleEx(514,329.7000100,1458.7000000,8.1000000,79.9910000,108,125,60); //Tanker
	petroleiroCar[14] = AddStaticVehicleEx(514,327.9003900,1452.0000000,8.1000000,79.9910000,108,125,60); //Tanker
	petroleiroCar[15] = AddStaticVehicleEx(514,304.3999900,1471.0000000,10.2000000,267.9900000,108,125,60); //Tanker
	petroleiroCar[16] = AddStaticVehicleEx(514,306.2999900,1464.4000000,10.2000000,267.9900000,108,125,60); //Tanker

    AddStaticVehicleEx(584,295.5000000,1440.4004000,11.5000000,267.9950000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,296.0996100,1446.0996000,11.6000000,267.9950000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,296.0000000,1452.3000000,11.6000000,267.9950000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,295.2000100,1458.6000000,10.8000000,267.9950000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,295.7998000,1464.7002000,11.5000000,267.9950000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,294.7999900,1471.3000000,11.5000000,267.9950000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,330.5000000,1392.8000000,9.0000000,74.0000000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,329.0000000,1387.3000000,9.0000000,73.9980000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,327.6000100,1382.1000000,9.0000000,73.9980000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,324.8999900,1372.9000000,9.0000000,73.9980000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,323.3999900,1367.8000000,9.6000000,73.9930000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,321.5680500,1362.7539000,9.7997200,73.9930000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,318.9580100,1352.2363000,10.4462500,73.9930000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,317.3999900,1346.9000000,10.5000000,73.9980000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,314.2999900,1341.4000000,11.3000000,73.9930000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,344.2027900,1481.3641000,8.9986500,79.9910000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,343.2000100,1475.0000000,9.0000000,79.9910000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,341.7999900,1469.3000000,8.7000000,81.9910000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,340.2999900,1462.7000000,8.7000000,79.9910000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,339.5996100,1456.7002000,8.7000000,79.9910000,245,245,60); //Trailer 3
    AddStaticVehicleEx(584,338.0000000,1450.4004000,8.7000000,79.9910000,245,245,60); //Trailer 3

    // Taxi
    taxiCar[0] = AddStaticVehicleEx(438,1802.4004000,-1908.0996000,13.7169400,87.9950000,006,000,120); //Cabbie
    taxiCar[1] = AddStaticVehicleEx(420,1802.3000000,-1912.2000000,13.3000000,87.9950000,006,000,120); //Taxi
    taxiCar[2] = AddStaticVehicleEx(420,1802.6000000,-1903.9000000,13.3000000,87.9950000,006,000,120); //Taxi
    taxiCar[3] = AddStaticVehicleEx(438,1802.2002000,-1917.0000000,13.7169400,87.9950000,006,000,120); //Cabbie
    taxiCar[4] = AddStaticVehicleEx(420,1802.0000000,-1922.3000000,13.3000000,87.9950000,006,000,120); //Taxi
    taxiCar[5] = AddStaticVehicleEx(438,1802.0000000,-1927.2998000,13.7169400,87.9950000,006,000,120); //Cabbie
    taxiCar[6] = AddStaticVehicleEx(420,1802.0000000,-1932.2998000,13.3000000,87.9950000,006,000,120); //Taxi
    taxiCar[7] = AddStaticVehicleEx(438,1779.2002000,-1932.2998000,13.7169400,267.9950000,006,000,120); //Cabbie
    taxiCar[8] = AddStaticVehicleEx(420,1779.2000000,-1927.2000000,13.3000000,267.9950000,006,000,120); //Taxi
    taxiCar[9] = AddStaticVehicleEx(438,1779.4004000,-1922.0996000,13.7169400,267.9950000,006,000,120); //Cabbie

    // Moto Taxi
    motoTaxiCar[0] = AddStaticVehicleEx(586,1775.9000000,-1886.3000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[1] = AddStaticVehicleEx(586,1777.5000000,-1886.4000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[2] = AddStaticVehicleEx(586,1779.4000000,-1886.3000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[3] = AddStaticVehicleEx(586,1781.5000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[4] = AddStaticVehicleEx(586,1783.4000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[5] = AddStaticVehicleEx(586,1785.4000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[6] = AddStaticVehicleEx(586,1787.6000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[7] = AddStaticVehicleEx(586,1789.9000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[8] = AddStaticVehicleEx(586,1792.1000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[9] = AddStaticVehicleEx(586,1794.3000000,-1886.1000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    motoTaxiCar[10] = AddStaticVehicleEx(586,1796.4000000,-1886.2000000,13.0000000,182.0000000,006,006,120); //Wayfarer
    
    // Entregador de mercadorias
    entregadorCar[0] = AddStaticVehicleEx(414,1766.4000000,-1691.5000000,13.6000000,180.0000000,241,243,120); //Mule
    entregadorCar[1] = AddStaticVehicleEx(414,1771.1000000,-1691.5000000,13.6000000,180.0000000,200,052,120); //Mule
    entregadorCar[2] = AddStaticVehicleEx(414,1775.8000000,-1691.5000000,13.6000000,179.9950000,006,058,120); //Mule
    entregadorCar[3] = AddStaticVehicleEx(414,1780.6000000,-1691.5000000,13.6000000,179.9950000,025,098,120); //Mule
    entregadorCar[4] = AddStaticVehicleEx(414,1786.1000000,-1691.5000000,13.6000000,179.9950000,100,068,120); //Mule
    entregadorCar[5] = AddStaticVehicleEx(414,1791.6000000,-1691.6000000,13.6000000,179.9950000,005,108,120); //Mule
    entregadorCar[6] = AddStaticVehicleEx(414,1797.2000000,-1691.6000000,13.6000000,179.9950000,058,250,120); //Mule
    entregadorCar[7] = AddStaticVehicleEx(414,1804.3000000,-1691.7000000,13.6000000,179.9950000,009,115,120); //Mule

    pizzaBoyCar[0] = AddStaticVehicleEx(448,2122.8999000,-1784.3000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[1] = AddStaticVehicleEx(448,2121.0000000,-1784.4000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[2] = AddStaticVehicleEx(448,2119.2000000,-1784.4000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[3] = AddStaticVehicleEx(448,2117.2000000,-1784.4000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[4] = AddStaticVehicleEx(448,2115.3000000,-1784.5000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[5] = AddStaticVehicleEx(448,2113.2000000,-1784.5000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[6] = AddStaticVehicleEx(448,2111.1001000,-1784.5000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[7] = AddStaticVehicleEx(448,2108.8000000,-1784.4000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[8] = AddStaticVehicleEx(448,2106.7000000,-1784.4000000,13.1000000,0.0000000,175,181,120); //Pizzaboy
    pizzaBoyCar[9] = AddStaticVehicleEx(448,2104.6001000,-1784.3000000,13.1000000,0.0000000,175,181,120); //Pizzaboy

    
    transportadorCar[0] = AddStaticVehicleEx(403,2672.0000000,-2486.1001000,14.4000000,180.0000000,006,159,120); //Linerunner
    transportadorCar[1] = AddStaticVehicleEx(403,2671.8000000,-2466.8999000,14.3000000,180.0000000,058,139,120); //Linerunner
    transportadorCar[2] = AddStaticVehicleEx(403,2667.4004000,-2507.3994000,14.4000000,270.0000000,069,128,120); //Linerunner
    transportadorCar[3] = AddStaticVehicleEx(403,2647.8999000,-2507.2000000,14.4000000,270.0000000,098,058,120); //Linerunner
    transportadorCar[4] = AddStaticVehicleEx(403,2626.8000000,-2507.2000000,14.4000000,270.0000000,036,069,120); //Linerunner
    transportadorCar[5] = AddStaticVehicleEx(403,2605.6001000,-2507.3000000,14.4000000,270.0000000,024,123,120); //Linerunner
    transportadorCar[6] = AddStaticVehicleEx(403,2584.6006000,-2507.2998000,14.4000000,270.0000000,015,048,120); //Linerunner

    AddStaticVehicleEx(435,2672.0000000,-2476.7000000,14.3000000,180.0000000,058,158,60); //Trailer 1
    AddStaticVehicleEx(435,2671.8000000,-2457.5000000,14.3000000,180.0000000,006,085,60); //Trailer 1
    AddStaticVehicleEx(435,2658.5000000,-2507.3999000,14.1000000,269.9950000,045,125,60); //Trailer 1
    AddStaticVehicleEx(435,2638.3999000,-2507.3000000,14.1000000,269.9950000,063,054,60); //Trailer 1
    AddStaticVehicleEx(435,2617.4004000,-2507.2998000,14.1000000,270.0000000,058,026,60); //Trailer 1
    AddStaticVehicleEx(435,2595.8999000,-2507.3999000,14.1000000,270.0000000,128,169,60); //Trailer 1
    AddStaticVehicleEx(435,2575.1001000,-2507.2000000,14.1000000,270.0000000,068,052,60); //Trailer 1

    pescaCar[0] = AddStaticVehicleEx(453,2640.3999000,-2480.3000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[1] = AddStaticVehicleEx(453,2633.7000000,-2480.3000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[2] = AddStaticVehicleEx(453,2626.7000000,-2480.2000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[3] = AddStaticVehicleEx(453,2619.8999000,-2480.2000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[4] = AddStaticVehicleEx(453,2613.0000000,-2480.0000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[5] = AddStaticVehicleEx(453,2606.5000000,-2480.0000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[6] = AddStaticVehicleEx(453,2600.3000000,-2480.0000000,0.0000000,179.9950000,001,106,120); //Reefer
    pescaCar[7] = AddStaticVehicleEx(453,2593.8000000,-2480.0000000,0.0000000,179.9950000,001,106,120); //Reefer

    gariCar[0] = AddStaticVehicleEx(408,2163.4500,-1971.7676,14.0909,180.5521,026,026,120); //Trashmaster
    gariCar[1] = AddStaticVehicleEx(408,2159.6819,-1971.6329,14.1798,178.5353,026,026,120); //Trashmaster
    gariCar[2] = AddStaticVehicleEx(408,2152.7742,-1971.7693,14.0779,179.7092,026,026,120); //Trashmaster
    gariCar[3] = AddStaticVehicleEx(408,2156.1392,-1971.6147,14.1863,179.0344,026,026,120); //Trashmaster

    carroForteCar[0] = AddStaticVehicleEx(428,612.5000000,-1305.6000000,14.9000000,8.0000000,006,006,120); //Securicar
    carroForteCar[1] = AddStaticVehicleEx(428,607.7999900,-1306.1000000,14.9000000,7.9980000,006,006,120); //Securicar
    carroForteCar[2] = AddStaticVehicleEx(428,603.0999800,-1306.6000000,14.9000000,7.9980000,006,006,120); //Securicar
    carroForteCar[3] = AddStaticVehicleEx(428,598.7999900,-1306.9000000,14.9000000,7.9980000,006,006,120); //Securicar
    carroForteCar[4] = AddStaticVehicleEx(428,593.7999900,-1307.6000000,14.9000000,7.9980000,006,006,120); //Securicar
    carroForteCar[5] = AddStaticVehicleEx(428,587.9000200,-1308.5000000,14.9000000,7.9980000,006,006,120); //Securicar
    carroForteCar[6] = AddStaticVehicleEx(428,582.4000200,-1309.3000000,14.9000000,7.9980000,006,006,120); //Securicar
    carroForteCar[7] = AddStaticVehicleEx(428,578.2000100,-1300.7000000,14.9000000,281.9980000,006,006,120); //Securicar
    carroForteCar[8] = AddStaticVehicleEx(428,576.7999900,-1294.5000000,14.9000000,281.9970000,006,006,120); //Securicar
    carroForteCar[9] = AddStaticVehicleEx(428,575.5999800,-1288.3000000,15.6000000,281.9970000,006,006,120); //Securicar
    carroForteCar[10] = AddStaticVehicleEx(428,574.2999900,-1282.4000000,16.2000000,281.9970000,006,006,120); //Securicar
    carroForteCar[11] = AddStaticVehicleEx(428,573.0999800,-1276.8000000,16.5000000,281.9970000,006,006,120); //Securicar
    carroForteCar[12] = AddStaticVehicleEx(428,572.0000000,-1271.4000000,16.7000000,281.9970000,006,006,120); //Securicar

    mecanicoCar[0] = AddStaticVehicleEx(525,-77.0000000,-1106.5000000,1.1000000,160.0000000,001,086,120); //Tow Truck
    mecanicoCar[1] = AddStaticVehicleEx(525,-72.3000000,-1108.3000000,1.1000000,159.9990000,001,086,120); //Tow Truck
    mecanicoCar[2] = AddStaticVehicleEx(525,-67.6000000,-1110.1000000,1.1000000,159.9990000,001,086,120); //Tow Truck
    mecanicoCar[3] = AddStaticVehicleEx(525,-66.3000000,-1120.4000000,1.1000000,67.9990000,001,086,120); //Tow Truck
    mecanicoCar[4] = AddStaticVehicleEx(525,-61.5000000,-1130.1000000,1.1000000,67.9940000,001,086,120); //Tow Truck
    mecanicoCar[5] = AddStaticVehicleEx(525,-53.2000000,-1133.0000000,1.1000000,67.9940000,001,086,120); //Tow Truck
    mecanicoCar[6] = AddStaticVehicleEx(525,-45.1000000,-1136.3000000,1.1000000,67.9940000,001,086,120); //Tow Truck
    mecanicoCar[7] = AddStaticVehicleEx(525,-41.3000000,-1155.8000000,1.1000000,333.9940000,001,086,120); //Tow Truck
    mecanicoCar[8] = AddStaticVehicleEx(525,-45.7000000,-1153.7000000,1.1000000,333.9900000,001,086,120); //Tow Truck
    mecanicoCar[9] = AddStaticVehicleEx(525,-50.8000000,-1151.1000000,1.1000000,333.9900000,001,086,120); //Tow Truck

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
    // Status
    for (new a = 0; a < sizeof(textStatus); a++)
    {
    	TextDrawDestroy(textStatus[a]);
    }

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
    profissaoUniforme[playerid] = false;
    profissaoCar[playerid] = false;
    profissaoCarregandoOJG[playerid] =false;

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
	// Status 
	textStatusBar[playerid][0] = CreatePlayerTextDraw(playerid, 598.535827, 365.366546, "10:00");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][0], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, textStatusBar[playerid][0], 2);
	PlayerTextDrawColor(playerid, textStatusBar[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, textStatusBar[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, textStatusBar[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, textStatusBar[playerid][0], 255);
	PlayerTextDrawFont(playerid, textStatusBar[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, textStatusBar[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, textStatusBar[playerid][0], 0);

	textStatusBar[playerid][1] = CreatePlayerTextDraw(playerid, 598.535827, 342.465148, "0");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][1], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, textStatusBar[playerid][1], 2);
	PlayerTextDrawColor(playerid, textStatusBar[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, textStatusBar[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, textStatusBar[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, textStatusBar[playerid][1], 255);
	PlayerTextDrawFont(playerid, textStatusBar[playerid][1], 2);
	PlayerTextDrawSetProportional(playerid, textStatusBar[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, textStatusBar[playerid][1], 0);

	textStatusBar[playerid][2] = CreatePlayerTextDraw(playerid, 570.607299, 318.169464, "box");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][2], 0.000000, 1.591375);
	PlayerTextDrawTextSize(playerid, textStatusBar[playerid][2], 630.562377, 0.000000);
	PlayerTextDrawUseBox(playerid, textStatusBar[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, textStatusBar[playerid][2], -1499159553);

	// Saude
	textStatusBar[playerid][3] = CreatePlayerTextDraw(playerid, 570.607299, 318.169464, "box");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][3], 0.000000, 1.591375);
	PlayerTextDrawTextSize(playerid, textStatusBar[playerid][3], 566.607299, 0.000000);
	PlayerTextDrawUseBox(playerid, textStatusBar[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, textStatusBar[playerid][3], -1);

	textStatusBar[playerid][4] = CreatePlayerTextDraw(playerid, 570.607299, 294.268005, "box");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][4], 0.000000, 1.591375);
	PlayerTextDrawTextSize(playerid, textStatusBar[playerid][4], 630.562377, 0.000000);
	PlayerTextDrawUseBox(playerid, textStatusBar[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, textStatusBar[playerid][4], -1499159553);

	// Sede
	textStatusBar[playerid][5] = CreatePlayerTextDraw(playerid, 570.607299, 294.468017, "box");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][5], 0.000000, 1.591375);
	PlayerTextDrawTextSize(playerid, textStatusBar[playerid][5], 566.607299, 0.000000);
	PlayerTextDrawUseBox(playerid, textStatusBar[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, textStatusBar[playerid][5], -1);

	textStatusBar[playerid][6] = CreatePlayerTextDraw(playerid, 570.607299, 271.066589, "box");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][6], 0.000000, 1.591375);
	PlayerTextDrawTextSize(playerid, textStatusBar[playerid][6], 630.562377, 0.000000);
	PlayerTextDrawUseBox(playerid, textStatusBar[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, textStatusBar[playerid][6], -1499159553);

	// Fome
	textStatusBar[playerid][7] = CreatePlayerTextDraw(playerid, 570.607299, 271.166595, "box");
	PlayerTextDrawLetterSize(playerid, textStatusBar[playerid][7], 0.000000, 1.591375);
	PlayerTextDrawTextSize(playerid, textStatusBar[playerid][7], 566.607299, 0.000000);
	PlayerTextDrawUseBox(playerid, textStatusBar[playerid][7], 1);
	PlayerTextDrawBoxColor(playerid, textStatusBar[playerid][7], -1);

	// Profissões Textos Info
	textProfissaoInfo[playerid][0] = CreatePlayerTextDraw(playerid, 10.046572, 322.089416, "box");
	PlayerTextDrawLetterSize(playerid, textProfissaoInfo[playerid][0], 0.000000, 1.349609);
	PlayerTextDrawTextSize(playerid, textProfissaoInfo[playerid][0], 129.599670, 0.000000);
	PlayerTextDrawAlignment(playerid, textProfissaoInfo[playerid][0], 1);
	PlayerTextDrawColor(playerid, textProfissaoInfo[playerid][0], -1);
	PlayerTextDrawUseBox(playerid, textProfissaoInfo[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, textProfissaoInfo[playerid][0], -5170508);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, textProfissaoInfo[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, textProfissaoInfo[playerid][0], 255);
	PlayerTextDrawFont(playerid, textProfissaoInfo[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, textProfissaoInfo[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][0], 0);

	textProfissaoInfo[playerid][1] = CreatePlayerTextDraw(playerid, 10.046572, 322.089416, "box");
	PlayerTextDrawLetterSize(playerid, textProfissaoInfo[playerid][1], 0.000000, 1.349609);
	PlayerTextDrawTextSize(playerid, textProfissaoInfo[playerid][1], 114.537673, 0.000000);
	PlayerTextDrawAlignment(playerid, textProfissaoInfo[playerid][1], 1);
	PlayerTextDrawColor(playerid, textProfissaoInfo[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, textProfissaoInfo[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, textProfissaoInfo[playerid][1], -4324865);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, textProfissaoInfo[playerid][1], 0);
	PlayerTextDrawBackgroundColor(playerid, textProfissaoInfo[playerid][1], 255);
	PlayerTextDrawFont(playerid, textProfissaoInfo[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, textProfissaoInfo[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][1], 0);

	textProfissaoInfo[playerid][2] = CreatePlayerTextDraw(playerid, 67.051933, 319.383270, "(30/30)");
	PlayerTextDrawLetterSize(playerid, textProfissaoInfo[playerid][2], 0.400000, 1.600000);
	PlayerTextDrawAlignment(playerid, textProfissaoInfo[playerid][2], 2);
	PlayerTextDrawColor(playerid, textProfissaoInfo[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, textProfissaoInfo[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, textProfissaoInfo[playerid][2], 255);
	PlayerTextDrawFont(playerid, textProfissaoInfo[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, textProfissaoInfo[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][2], 0);

	textProfissaoInfo[playerid][3] = CreatePlayerTextDraw(playerid, 66.826545, 305.717773, "Capacidade");
	PlayerTextDrawLetterSize(playerid, textProfissaoInfo[playerid][3], 0.400000, 1.000000);
	PlayerTextDrawAlignment(playerid, textProfissaoInfo[playerid][3], 2);
	PlayerTextDrawColor(playerid, textProfissaoInfo[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, textProfissaoInfo[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, textProfissaoInfo[playerid][3], 255);
	PlayerTextDrawFont(playerid, textProfissaoInfo[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, textProfissaoInfo[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][3], 0);

	textProfissaoInfo[playerid][4] = CreatePlayerTextDraw(playerid, 16.217153, 244.851974, "");
	PlayerTextDrawLetterSize(playerid, textProfissaoInfo[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, textProfissaoInfo[playerid][4], 90.000000, 90.000000);
	PlayerTextDrawAlignment(playerid, textProfissaoInfo[playerid][4], 1);
	PlayerTextDrawColor(playerid, textProfissaoInfo[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, textProfissaoInfo[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, textProfissaoInfo[playerid][4], 0);
	PlayerTextDrawFont(playerid, textProfissaoInfo[playerid][4], 5);
	PlayerTextDrawSetProportional(playerid, textProfissaoInfo[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, textProfissaoInfo[playerid][4], 0);
	PlayerTextDrawSetPreviewModel(playerid, textProfissaoInfo[playerid][4], 408);
	PlayerTextDrawSetPreviewRot(playerid, textProfissaoInfo[playerid][4], 0.000000, 0.000000, 90.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, textProfissaoInfo[playerid][4], 1, 1);

    MapIcon(playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(Logado{playerid} == true) {
    	GetPlayerPos(playerid, pPosX[playerid], pPosY[playerid], pPosZ[playerid]);

    	if(profissaoUniforme[playerid]){
    		SetPlayerSkin(playerid, DOF2_GetInt(PegarConta(playerid), "SkinAtual"));
    		profissaoUniforme[playerid] = false;
    	}

    	SalvarDados(playerid);
    	Logado{playerid} = false;
    	profissaoCar[playerid] = false;
    	profissaoCarregandoOJG[playerid] = false;
    }
    else{
    	printf("A conta do player %s não pode ser salva!", getName(playerid));
    }
    
    if (PlayerVelocimetro[playerid]) {
        KillTimer(PlayerVelocimetroTimer[playerid]);
    }

    KillTimer(timer_StatusFome[playerid]);
    KillTimer(timer_StatusSede[playerid]);
    KillTimer(timer_StatusSaude[playerid]);
    KillTimer(timer_UpdatePlayerLevel[playerid]);

	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerSkin(playerid, DOF2_GetInt(PegarConta(playerid), "SkinAtual"));
    TextDrawHideForPlayer(playerid,Logo);
    TextDrawHideForPlayer(playerid,Versao);
    TextDrawHideForPlayer(playerid,site);
    TextDrawHideForPlayer(playerid,Rodape);

    // Status
    for (new a = 0; a < sizeof(textStatus); a++){ TextDrawShowForPlayer(playerid, textStatus[a]); }
    for( new a = 0; a < 8; a++) PlayerTextDrawShow(playerid, textStatusBar[playerid][a]);

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
	if(PlayerDados[playerid][gasolina] == 0)
	{
		return SendClientMessage(playerid,COR_ERRO,"| INFO | A Gasolina Deste carro acabou chame o Guincho");
	}

	if(profissaoCarregandoOJG[playerid])
	{
		SendClientMessage(playerid, COR_WARNING, "| INFO | Você perdeu o objeto que estava segurando na mão. Porque entrou no veículo!"); 
		profissaoCarregandoOJG[playerid] = false;
		DisablePlayerCheckpoint(playerid);
		RemovePlayerAttachedObject(playerid, 2);
		return 1;		
	}
	SendClientMessage(playerid, COR_WARNING, "| INFO | Para ligar ou desligar o veiculo '{B5B5B5}/partida{FFFFFF}' - ou aperte o butão '{B5B5B5}Y{FFFFFF}'"); 
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

        return 1;
    }

    // Textos Info da Profissão
    if(profissaoCar[playerid] == vehicleid)
    {
    	for( new a = 0; a < 5; a++) PlayerTextDrawHide(playerid, textProfissaoInfo[playerid][a]);
    	return 1;
    }
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new car = GetPlayerVehicleID(playerid);//armazena na váriavel car o carro em q ele está.
    if(newstate == PLAYER_STATE_DRIVER)//se O Player entrar como motorista
	{
		// Petroleiro
    	for(new i = 0; i < sizeof(petroleiroCar); i ++)
		{
			if(car == petroleiroCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Petroleiro)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um petroleiro, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// Taxistas
		for(new i = 0; i < sizeof(taxiCar); i ++)
		{
			if(car == taxiCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Taxistas)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Taxistas, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// Mecanico
		for(new i = 0; i < sizeof(mecanicoCar); i ++)
		{
			if(car == mecanicoCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Mecanico)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Mecanico, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// Motorista de carro Forte
		for(new i = 0; i < sizeof(carroForteCar); i ++)
		{
			if(car == carroForteCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != MotoristacarroForte)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Motorista de carro Forte, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// Gari
		for(new i = 0; i < sizeof(gariCar); i ++)
		{
			if(car == gariCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Gari)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Gari, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}else if(!profissaoUniforme[playerid]){
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você tem que está utilizando o uniforme de Gari, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}else{
					profissaoCar[playerid] = GetPlayerVehicleID(playerid);
					for( new a = 0; a < 5; a++) PlayerTextDrawShow(playerid, textProfissaoInfo[playerid][a]);
					ShowPlayerVelocimetro(playerid);
					return 1;
				}
			}
		}
		// Pescador
		for(new i = 0; i < sizeof(pescaCar); i ++)
		{
			if(car == pescaCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Pescador)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Pescador, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// Transportador
		for(new i = 0; i < sizeof(transportadorCar); i ++)
		{
			if(car == transportadorCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Transportador)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Transportador, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// PizzaBoy 
		for(new i = 0; i < sizeof(pizzaBoyCar); i ++)
		{
			if(car == pizzaBoyCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != PizzaBoy)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um PizzaBoy, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// PizzaBoy 
		for(new i = 0; i < sizeof(pizzaBoyCar); i ++)
		{
			if(car == pizzaBoyCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != PizzaBoy)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um PizzaBoy, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// Entregador 
		for(new i = 0; i < sizeof(entregadorCar); i ++)
		{
			if(car == entregadorCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != Entregador)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Entregador, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
				}
			}
		}
		// MotoTaxi 
		for(new i = 0; i < sizeof(motoTaxiCar); i ++)
		{
			if(car == motoTaxiCar[i])
			{
		    	if(PlayerDados[playerid][Profissao] != MotoTaxi)
		    	{
					SendClientMessage(playerid, COR_ERRO, "[Erro] Você não é um Moto Taxi, e não pode dirigir esse veiculo..");
					RemovePlayerFromVehicle(playerid);//irá removelo do carro e mandar a mensagem.
					PlayerPlaySound(playerid,1147,0.0,0.0,0.0);
					return 1;
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
    	ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "{FFFFFF}Classe » {38b170}Honestas\n{FFFFFF}Classe » {8bcffa}Transporte\n{FFFFFF}Classe » {218ffd}Policia\n{FFFFFF}Classe » {847c7f}Governo", "Selecionar", "Fechar");
	}
    if(Checkpoint == CPAutoEscola )
    {
    	ShowPlayerDialog(playerid, DialogAutoEscola, DIALOG_STYLE_TABLIST_HEADERS, "AUTO ESCOLA » Habilitações", "Categoria\t{008000}Preço\nMotocicleta\t{008000}$600,00\nAutomóvel\t{008000}$1400,00\nCaminhão\t{008000}$2400,00", "Selecionar", "Voltar");
    }

    if(profissaoCarregandoOJG[playerid])
    {
	    if(PlayerDados[playerid][Profissao] == Gari)
	    {
	    	DisablePlayerCheckpoint(playerid);
	    	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 0);
	    	SendClientMessage(playerid,COR_SUCCESS,"| INFO | Você recolheu uma sacola de lixo!");
	    	RemovePlayerAttachedObject(playerid, 2);
	 		profissaoCarregandoOJG[playerid] = false;
	 		PlayerPlaySound(playerid,1058,0.0,0.0,0.0);   	
	    	return 1;
	    }
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
    			setBasicInfoPlayer(playerid);

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
    			setBasicInfoPlayer(playerid);

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
				    UpdatePlayerFome(playerid);
				    UpdatePlayerSede(playerid);
				    UpdatePlayerSaude(playerid);
				    UpdatePlayerLevel(playerid);
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
 					new string[952];
					strcat(string, "Profissão\t{33AAFF}Level\t{008000}Salário\n");
					strcat(string, "Gari\t{33AAFF}0\t{008000}$580,00\n");
					strcat(string, "PizzaBoy\t{33AAFF}2\t{008000}$600,00\n");
					strcat(string, "MotoBoy\t{33AAFF}4\t{008000}$620,00\n");
					strcat(string, "Pescador\t{33AAFF}8\t{008000}$680,00\n");
					strcat(string, "Mecânico\t{33AAFF}10\t{008000}$780,00\n");
					strcat(string, "Correios\t{33AAFF}15\t{008000}$900,00\n");
					strcat(string, "Fazendeiro\t{33AAFF}20\t{008000}$1800,00\n");
					strcat(string, "AgenteFunerario\t{33AAFF}30\t{008000}$1480,00\n");
					strcat(string, "Fotografo\t{33AAFF}40\t{008000}$1480,00\n");
					strcat(string, "Jornalista\t{33AAFF}50\t{008000}$1580,00\n");
					strcat(string, "Meteorologista\t{33AAFF}60\t{008000}$1600,00\n");
					strcat(string, "Advogador\t{33AAFF}80\t{008000}$1800,00\n");
					strcat(string, "Paramedico\t{33AAFF}100\t{008000}$2000,00");
    	        	ShowPlayerDialog(playerid, DialogHonestas, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Honestas", string, "Selecionar", "Voltar");   	        
    	        }
    	        if(listitem == 1){
 					new string[952];
					strcat(string, "Profissão\t{33AAFF}Level\t{008000}Salário\n");
					strcat(string, "Moto Táxi\t{33AAFF}5\t{008000}$700,00\n");
					strcat(string, "Entregador\t{33AAFF}10\t{008000}$750,00\n");
					strcat(string, "Taxistas\t{33AAFF}15\t{008000}$800,00\n");
					strcat(string, "Motorista de Onibus\t{33AAFF}20\t{008000}$820,00\n");
					strcat(string, "Transportador\t{33AAFF}40\t{008000}$840,00\n");
					strcat(string, "Maquinista\t{33AAFF}45\t{008000}$860,00\n");
					strcat(string, "Petroleiro\t{33AAFF}50\t{008000}$880,00\n");
					strcat(string, "Concreteiro\t{33AAFF}60\t{008000}$890,00\n");
					strcat(string, "Táxi Aéreo\t{33AAFF}70\t{008000}$900,00\n");
					strcat(string, "Piloto\t{33AAFF}80\t{008000}$980,00\n");
					strcat(string, "Motorista de carro Forte\t{33AAFF}100\t{008000}$1000,00");
    	            ShowPlayerDialog(playerid, DialogTransportes, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Transportes", string, "Selecionar", "Voltar");
    	        }
    	        if(listitem == 2){
    	        	new string[952];
					strcat(string, "Profissão\t{33AAFF}Level\t{008000}Salário\n");
					strcat(string, "PMilitar\t{33AAFF}100\t{008000}$1800,00\n");
					strcat(string, "PFederal\t{33AAFF}200\t{008000}$1900,00\n");
					strcat(string, "PRodoviaria\t{33AAFF}300\t{008000}$2000,00\n");
					strcat(string, "Delegado\t{33AAFF}400\t{008000}$2100,00\n");
					strcat(string, "FBI\t{33AAFF}500\t{008000}$2200,00\n");
					strcat(string, "CIA\t{33AAFF}600\t{008000}$2300,00\n");
					strcat(string, "SWAT\t{33AAFF}700\t{008000}$2400,00\n");
					strcat(string, "Interpol\t{33AAFF}800\t{008000}$2500,00");
    	            ShowPlayerDialog(playerid, DialogPolicias, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Policias", string, "Selecionar", "Voltar");
    	        }
    	        if(listitem == 3){
    	        	new string[952];
					strcat(string, "Profissão\t{33AAFF}Level\t{008000}Salário\n");
					strcat(string, "Bombeiro\t{33AAFF}900\t{008000}$3000,00\n");
					strcat(string, "Corregedoria\t{33AAFF}1000\t{008000}$4000,00\n");
					strcat(string, "Marinha\t{33AAFF}1400\t{008000}$5000,00\n");
					strcat(string, "Exército\t{33AAFF}1500\t{008000}$5100,00\n");
					strcat(string, "Aeronáutica\t{33AAFF}1600\t{008000}$5200,00");
    	            ShowPlayerDialog(playerid, DialogGoverno, DIALOG_STYLE_TABLIST_HEADERS, "Profissões » Governo", string, "Selecionar", "Voltar");
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
    		        	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Gari ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Gari!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$580,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Gari ~~~~~~~~~~~~~~~~~~~~~~~");

    					PlayerDados[playerid][Profissao] = Gari;

    					HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    			}
    			else if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 2)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ PizzaBoy ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como PizzaBoy!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$600,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ PizzaBoy ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = PizzaBoy;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 2)
    			{
    			    if(GetPlayerScore(playerid) >= 4)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ MotoBoy ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como MotoBoy!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$620,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ MotoBoy ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = MotoBoy;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 3)
    			{
    			    if(GetPlayerScore(playerid) >= 8)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Pescador ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Pescador!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$680,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Pescador ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Pescador;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 4)
    			{
    			    if(GetPlayerScore(playerid) >= 10)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Mecânico ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Mecânico!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$780,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Mecânico ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Mecanico;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 5)
    			{
    			    if(GetPlayerScore(playerid) >= 15)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Correios ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Correios!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$900,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Correios ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Correios;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 6)
    			{
    			    if(GetPlayerScore(playerid) >= 20)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Fazendeiro ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Fazendeiro!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1800,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Fazendeiro ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Fazendeiro;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 7)
    			{
    			    if(GetPlayerScore(playerid) >= 30)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Agente Funerário ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Agente Funerário!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1480,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Agente Funerário ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = AgenteFunerario;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 8)
    			{
    			    if(GetPlayerScore(playerid) >= 40)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Fotógrafo ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Fotógrafo!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1480,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Fotógrafo ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Fotografo;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 9)
    			{
    			    if(GetPlayerScore(playerid) >= 50)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Jornalista ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Jornalista!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1580,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Jornalista ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Jornalista;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 10)
    			{
    			    if(GetPlayerScore(playerid) >= 60)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Meteorologista ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Meteorologista!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1600,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Meteorologista ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Meteorologista;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 11)
    			{
    			    if(GetPlayerScore(playerid) >= 80)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Advogado ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Advogado!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1800,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Advogado ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Advogador;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 12)
    			{
    			    if(GetPlayerScore(playerid) >= 100)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Paramédico ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Paramédico!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2000,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Paramédico ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Paramedico;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "{FFFFFF}Classe » {38b170}Honestas\n{FFFFFF}Classe » {8bcffa}Transporte\n{FFFFFF}Classe » {218ffd}Policia\n{FFFFFF}Classe » {847c7f}Governo", "Selecionar", "Fechar");  	    
    		}
        }
        case DialogTransportes:{
            if(response)
    	    {
    	        if(listitem == 0)
    	        {
    	            if(GetPlayerScore(playerid) >= 5)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ MotoTaxi ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como MotoTaxi!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$700,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ MotoTaxi ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = MotoTaxi;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 10)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Entregador ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Entregador!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$750,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Entregador ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Entregador;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 2)
    			{
    			    if(GetPlayerScore(playerid) >= 15)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Taxistas ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Taxista!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$800,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Taxistas ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Taxistas;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 3)
    			{
    			    if(GetPlayerScore(playerid) >= 20)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Motorista de Ônibus ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Motorista de Ônibus!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$820,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Motorista de Ônibus ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = MotoristaOnibus;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 4)
    			{
    			    if(GetPlayerScore(playerid) >= 40)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Transportador ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Transportador!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$840,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Transportador ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Transportador;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 5)
    			{
    			    if(GetPlayerScore(playerid) >= 45)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Maquinista ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Maquinista!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$860,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Maquinista ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Maquinista;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 6)
    			{
    			    if(GetPlayerScore(playerid) >= 50)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Petroleiro ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Petroleiro!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$880,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Petroleiro ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Petroleiro;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 7)
    			{
    			    if(GetPlayerScore(playerid) >= 60)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Concreteiro ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Concreteiro!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$890,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Concreteiro ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Concreteiro;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 8)
    			{
    			    if(GetPlayerScore(playerid) >= 70)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Táxi Aéreo ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Táxi Aéreo!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$900,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Táxi Aéreo ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = TaxiAereo;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 9)
    			{
    			    if(GetPlayerScore(playerid) >= 80)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Piloto ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Piloto!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$980,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Piloto ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Piloto;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 10)
    			{
    			    if(GetPlayerScore(playerid) >= 100)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Motorista de carro forte ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Motorista de carro forte!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1000,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Motorista de carro forte ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = MotoristacarroForte;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "{FFFFFF}Classe » {38b170}Honestas\n{FFFFFF}Classe » {8bcffa}Transporte\n{FFFFFF}Classe » {218ffd}Policia\n{FFFFFF}Classe » {847c7f}Governo", "Selecionar", "Fechar");
      		}
        }
        case DialogPolicias:{
            if(response)
    	    {
    	        if(listitem == 0)
    			{
    			    if(GetPlayerScore(playerid) >= 100)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia militar ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Polícia militar!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1800,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia militar ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = PMilitar;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 200)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia Federal ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Polícia Federal!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$1900,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia Federal ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = PFederal;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 2)
    			{
    			    if(GetPlayerScore(playerid) >= 300)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia Rodoviária Federal ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Polícia Rodoviária Federal!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2000,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Polícia Rodoviária Federal ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = PRodoviaria;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 3)
    			{
    			    if(GetPlayerScore(playerid) >= 400)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Delegado ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Delegado!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2100,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Delegado ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Delegado;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 4)
    			{
    			    if(GetPlayerScore(playerid) >= 500)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ FBI ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como FBI!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2200,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ FBI ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = FBI;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 5)
    			{
    			    if(GetPlayerScore(playerid) >= 600)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ CIA ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como CIA!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2300,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ CIA ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = CIA;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 6)
    			{
    			    if(GetPlayerScore(playerid) >= 700)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ SWAT ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como SWAT!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2400,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ SWAT ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = SWAT;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 7)
    			{
    			    if(GetPlayerScore(playerid) >= 800)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Interpol ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Interpol!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$2500,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Interpol ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Interpol;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "{FFFFFF}Classe » {38b170}Honestas\n{FFFFFF}Classe » {8bcffa}Transporte\n{FFFFFF}Classe » {218ffd}Policia\n{FFFFFF}Classe » {847c7f}Governo", "Selecionar", "Fechar");
    		}
        }
        case DialogGoverno:{
            if(response)
    	    {
    	       	if(listitem == 0)
    			{
    			    if(GetPlayerScore(playerid) >= 900)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Bombeiro ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Bombeiro!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$3000,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Bombeiro ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Bombeiro;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 1)
    			{
    			    if(GetPlayerScore(playerid) >= 1000)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Corregedoria ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Corregedoria!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$4000,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Corregedoria ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Corregedoria;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 2)
    			{
    			    if(GetPlayerScore(playerid) >= 1400)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Marinha ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Marinha!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$5000,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Marinha ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Marinha;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 3)
    			{
    			    if(GetPlayerScore(playerid) >= 1500)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Exército ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Exército!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$5100,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Exército ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Exercito;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    			else if(listitem == 4)
    			{
    			    if(GetPlayerScore(playerid) >= 1600)
    	            {
    			    	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Aeronáutica ~~~~~~~~~~~~~~~~~~~~~~~");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Seu curriculo foi aceito nesta Profissão!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Agora você trabalha como Aeronáutica!");
    	            	SendClientMessage(playerid, 0xFFFFFFAA, "» Você passará a receber um salário de {008000}$5200,00");
    	            	SendClientMessage(playerid, 0x008080AA, "~~~~~~~~~~~~~~~~~~~~~~~ Aeronáutica ~~~~~~~~~~~~~~~~~~~~~~~");

                        PlayerDados[playerid][Profissao] = Aeronautica;

                        HQ[playerid] = false;
                        cmd_hq(playerid);
                        SendClientMessage(playerid, COR_SUCCESS, "Foi criado o Checkpoint do seu HQ em seu mapa..");

                        PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
    				}
    				else
    				{
    				    SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem level suficiente para pegar esta Profissão!");
    				}
    			}
    		}
    		else
    		{
    		    ShowPlayerDialog(playerid, DialogMenuAgencia, DIALOG_STYLE_LIST, "Agência de Empregos", "{FFFFFF}Classe » {38b170}Honestas\n{FFFFFF}Classe » {8bcffa}Transporte\n{FFFFFF}Classe » {218ffd}Policia\n{FFFFFF}Classe » {847c7f}Governo", "Selecionar", "Fechar");
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

    DOF2_SetInt(PegarConta(playerid), "SegundoUP", PlayerDados[playerid][segundoUP]);
    DOF2_SetInt(PegarConta(playerid), "MinutoUP", PlayerDados[playerid][minutoUP]);

    DOF2_SetInt(PegarConta(playerid), "Saude", PlayerDados[playerid][saude]);
    DOF2_SetInt(PegarConta(playerid), "Sono", PlayerDados[playerid][sono]);
    DOF2_SetInt(PegarConta(playerid), "Sede", PlayerDados[playerid][sede]);
    DOF2_SetInt(PegarConta(playerid), "Fome", PlayerDados[playerid][fome]);

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

			PlayerDados[playerid][segundoUP] = DOF2_GetInt(PegarConta(playerid), "SegundoUP");
			PlayerDados[playerid][minutoUP] = DOF2_GetInt(PegarConta(playerid), "MinutoUP");
			PlayerDados[playerid][saude] = DOF2_GetInt(PegarConta(playerid), "Saude");
			PlayerDados[playerid][sono] = DOF2_GetInt(PegarConta(playerid), "Sono");
			PlayerDados[playerid][sede] = DOF2_GetInt(PegarConta(playerid), "Sede");
			PlayerDados[playerid][fome] = DOF2_GetInt(PegarConta(playerid), "Fome");

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
	SendRconCommand("password 0");
	print("* Servidor Iniciado, Senha Removida.");
}
stock setBasicInfoPlayer(playerid){
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

	PlayerDados[playerid][segundoUP] = 10;
	PlayerDados[playerid][minutoUP] = 0;

	PlayerDados[playerid][saude] = 100;
	PlayerDados[playerid][sono] = 100;
	PlayerDados[playerid][sede] = 100;
	PlayerDados[playerid][fome] = 100;

	PlayerDados[playerid][gasolina] = 14;
	PlayerDados[playerid][etanol] = 14;
	PlayerDados[playerid][gnv] = 14;
	PlayerDados[playerid][diesel] = 14;

	PlayerDados[playerid][Admin] = 0;

	UpdatePlayerFome(playerid);
	UpdatePlayerSede(playerid);
	UpdatePlayerSaude(playerid);
	UpdatePlayerLevel(playerid);
}
forward UpdatePlayerFome(playerid);
public UpdatePlayerFome(playerid) {
	if(IsPlayerConnected(playerid)){

		if(PlayerDados[playerid][fome] > 0){
			PlayerDados[playerid][fome] = PlayerDados[playerid][fome] -1;

			PlayerTextDrawTextSize(playerid, textStatusBar[playerid][7], ( 566.607299 + ( (64.90 * PlayerDados[playerid][fome] ) / 100 ) ), 0.000000);
			UpdateTextDraw(playerid, 7);
		}

		timer_StatusFome[playerid] = SetTimerEx("UpdatePlayerFome", 180000, false, "i", playerid);
	}
	return 1;
}
forward UpdatePlayerSede(playerid);
public UpdatePlayerSede(playerid) {
	if(IsPlayerConnected(playerid)){

		if(PlayerDados[playerid][sede] > 0){
			PlayerDados[playerid][sede] = PlayerDados[playerid][sede] -1;

			PlayerTextDrawTextSize(playerid, textStatusBar[playerid][5], ( 566.607299 + ( (64.90 * PlayerDados[playerid][sede] ) / 100 ) ), 0.000000);
			UpdateTextDraw(playerid, 5);
		}

		timer_StatusSede[playerid] = SetTimerEx("UpdatePlayerSede", 120000, false, "i", playerid);
	}
	return 1;
}
forward UpdatePlayerSaude(playerid);
public UpdatePlayerSaude(playerid) {
	if(IsPlayerConnected(playerid)){

		if(PlayerDados[playerid][saude] > 0){
			PlayerDados[playerid][saude] = PlayerDados[playerid][saude] -1;

			PlayerTextDrawTextSize(playerid, textStatusBar[playerid][3], ( 566.607299 + ( (64.90 * PlayerDados[playerid][saude] ) / 100 ) ), 0.000000);
			UpdateTextDraw(playerid, 3);
		}

		timer_StatusSede[playerid] = SetTimerEx("UpdatePlayerSaude", 600000, false, "i", playerid);
	}
	return 1;
}
forward UpdatePlayerStar(playerid);
public UpdatePlayerStar(playerid) {
	if(IsPlayerConnected(playerid)){

		new string_velo[15];
 
        format(string_velo, sizeof (string_velo), "%d", GetPlayerWantedLevel(playerid));
        PlayerTextDrawSetString(playerid, textStatusBar[1][playerid], string_velo);

		UpdateTextDraw(playerid, 1);
	}
	return 1;
}
forward UpdatePlayerLevel(playerid);
public UpdatePlayerLevel(playerid) {
	if(IsPlayerConnected(playerid)){

		PlayerDados[playerid][segundoUP] -= 1;

		if(PlayerDados[playerid][segundoUP] <= 0){
			if(PlayerDados[playerid][minutoUP] > 0){
				PlayerDados[playerid][minutoUP] -= 1;
				PlayerDados[playerid][segundoUP] = 59;		
			}else{
				new str[255];

				PlayerDados[playerid][minutoUP] = 9;
				PlayerDados[playerid][segundoUP] = 59;

				PlayerDados[playerid][exp]	+= 1;

				if(PlayerDados[playerid][exp] == 6){
					PlayerDados[playerid][exp] = 0;
					SetPlayerScore(playerid, (GetPlayerScore(playerid)+1) );

					format(str, sizeof(str), "| UP | Parabéns %s você passou de level ( %d )", getName(playerid), GetPlayerScore(playerid));
					SendClientMessage(playerid, COR_SUCCESS, str);
					PlayerPlaySound(playerid,1058,0.0,0.0,0.0);
				}

				format(str, sizeof(str), "| UP | Você ganhou +1 de Experiência ( %d/6 )", PlayerDados[playerid][exp]);
				SendClientMessage(playerid, COR_SUCCESS, str);
				
			}
		}

		new string_velo[15];
 
        format(string_velo, sizeof (string_velo), "%d:%d", PlayerDados[playerid][minutoUP], PlayerDados[playerid][segundoUP]);
        if(PlayerDados[playerid][segundoUP] < 10){
        	format(string_velo, sizeof (string_velo), "%d:0%d", PlayerDados[playerid][minutoUP], PlayerDados[playerid][segundoUP]);
        }
        PlayerTextDrawSetString(playerid, textStatusBar[0][playerid], string_velo);

		UpdateTextDraw(playerid, 0);

		timer_UpdatePlayerLevel[playerid] = SetTimerEx("UpdatePlayerLevel", 1000, false, "i", playerid);
	}
	return 1;
}
forward UpdateTextDraw(playerid, textid);
public UpdateTextDraw(playerid, textid) {
	PlayerTextDrawHide(playerid, textStatusBar[playerid][textid]);
	PlayerTextDrawShow(playerid, textStatusBar[playerid][textid]);
    return 1;
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
       if(PlayerDados[playerid][Profissao] == Gari)
        {
            SetPlayerMapIcon(playerid, GPS_ID, 2176.1892,-1976.0012,13.5547, GPS_ICON, 0, MAPICON_GLOBAL);
            SendClientMessage(playerid, COR_SUCCESS, "INFO | Foi marcado em seu radar o local de sua HQ / Profissão!");

            PlayerPlaySound(playerid, 1057, 0 ,0, 0);
            HQ[playerid] = true;
        }
        else if(PlayerDados[playerid][Profissao] == Petroleiro)
        {
            SetPlayerMapIcon(playerid, GPS_ID, 312.1143,1477.8135,8.8824, GPS_ICON, 0, MAPICON_GLOBAL);
            SendClientMessage(playerid, COR_SUCCESS, "INFO | Foi marcado em seu radar o local de sua HQ / Profissão!");

            PlayerPlaySound(playerid, 1057, 0 ,0, 0);
            HQ[playerid] = true;
        }
    }
    return 1;
}
CMD:uniforme(playerid)
{
    if(PlayerDados[playerid][Profissao] == Gari)
    {
        if(PlayerToPoint(playerid, 2.0, 2176.1892,-1976.0012,13.5547))
        {
            if(!profissaoUniforme[playerid])
            {
                SendClientMessage(playerid, COR_SUCCESS, "| INFO | Parabéns, vocé está utilizando o uniforme de Gari! Use /profissao para ver seus comandos");
            	profissaoUniforme[playerid] = true;
            	SetPlayerSkin(playerid, 260);	
            	return 1;
            }
            else 
            {
            	SendClientMessage(playerid, COR_ERRO, "| ERRO | Você removeu o uniforme de Gari!");
            	profissaoUniforme[playerid] = false;
            	SetPlayerSkin(playerid, DOF2_GetInt(PegarConta(playerid), "SkinAtual"));	
            	return 1;
         	}
         }
         else return SendClientMessage(playerid, COR_ERRO, "ERRO | Você não está na área adequada para vestir o seu uniforme!");
    }
    else{
    	SendClientMessage(playerid, COR_ERRO, "ERRO | A sua profissão não tem um uniforme específico!");	
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
CMD:coletarlixo(playerid)
{
	if(PlayerDados[playerid][Profissao] == Gari)
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessage(playerid, COR_ERRO, "| ERROR | Você não pode coletar lixo dentro de um veiculo!");
		}
		else if(!profissaoCar[playerid] == false){
			new Float:vehx, Float:vehy, Float:vehz;
        	GetVehiclePos(profissaoCar[playerid], vehx, vehy, vehz);
			if(PlayerToPoint(playerid, 40.0, vehx, vehy, vehz))
			{
				for (new a = 0; a < sizeof(lixosLatasPos); a++)
				{
					if(PlayerToPoint(playerid, 2.0, lixosLatasPos[a][0],lixosLatasPos[a][1],lixosLatasPos[a][2]))
				    {
				    	if(lixosLatasPos[a][3] == 3.0)
				    	{
				    		if(profissaoCarregandoOJG[playerid])
				    		{
					    		SendClientMessage(playerid, COR_ERRO, "| ERROR | Você já está com uma sacola de lixo na mão!");
				    			return 1;
							}
							else
							{
					    		SendClientMessage(playerid, COR_SUCCESS, "| ERROR | Você removeu uma sacola de lixo da lixeira e ainda falta 2!");
					    		Update3DTextLabelText(lixosLatasText[a], 0xFFFFFFFF, "{30e551}Lixeira 2/3:\n{FFFFFF}/coletarlixo");
					    		lixosLatasPos[a][3] = 2.0;

					    		SetPlayerAttachedObject(playerid, 2, 1265, 5, 0.1, 0.07, 0.04, 180.0, 0.0, 0.0, 0.5, 0.5, 0.5); 
			    				ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 0);
					    		DisablePlayerCheckpoint(playerid);
					    		SetPlayerCheckpoint(playerid, (vehx+4.0), vehy, vehz, 3.0);
					    		profissaoCarregandoOJG[playerid] = true;

					    		return 1;
							}
				    	}
				    	else if(lixosLatasPos[a][3] == 2.0)
				    	{
				    		if(profissaoCarregandoOJG[playerid])
				    		{
					    		return SendClientMessage(playerid, COR_SUCCESS, "| ERROR | Você já está com uma sacola de lixo na mão!");
							}
							else
							{
					    		SendClientMessage(playerid, COR_WARNING, "| ERROR | Você removeu uma sacola de lixo da lixeira e ainda falta 1!");
					    		Update3DTextLabelText(lixosLatasText[a], 0xFFFFFFFF, "{f2da3c}Lixeira 1/3:\n{FFFFFF}/coletarlixo");
					    		lixosLatasPos[a][3] = 1.0;

					    		SetPlayerAttachedObject(playerid, 2, 1265, 5, 0.1, 0.07, 0.04, 180.0, 0.0, 0.0, 0.5, 0.5, 0.5); 
			    				ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 0);
					    		DisablePlayerCheckpoint(playerid);
					    		SetPlayerCheckpoint(playerid, (vehx+4.0), vehy, vehz, 3.0);
					    		profissaoCarregandoOJG[playerid] = true;
					    	}

					    	return 1;
				    	}
				    	else if(lixosLatasPos[a][3] == 1.0)
				    	{
				    		if(profissaoCarregandoOJG[playerid])
				    		{
					    		SendClientMessage(playerid, COR_SUCCESS, "| ERROR | Você já está com uma sacola de lixo na mão!");
				    			return 1;
							}
							else
							{
					    		SendClientMessage(playerid, COR_ERRO, "| ERROR | Você removeu a última sacola de lixo da lixeira!");
					    		Update3DTextLabelText(lixosLatasText[a], 0xFFFFFFFF, "{f2543c}Lixeira vazia");
					    		lixosLatasPos[a][3] = 0.0;

					    		SetPlayerAttachedObject(playerid, 2, 1265, 5, 0.1, 0.07, 0.04, 180.0, 0.0, 0.0, 0.5, 0.5, 0.5); 
			    				ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 0);
					    		DisablePlayerCheckpoint(playerid);
					    		SetPlayerCheckpoint(playerid, (vehx+4.0), vehy, vehz, 3.0);
					    		profissaoCarregandoOJG[playerid] = true;
					    	}

					    	return 1;
				    	}
				    	else
				    	{
				    		SendClientMessage(playerid, COR_ERRO, "| ERROR | Essa lixeira está vazia procure outra!");
				    		return 1;
				    	}
				    }			
				}

				SendClientMessage(playerid, COR_ERRO, "| ERROR | Você não está próximo de uma lixeira!");
				return 1;
			}else{

				SendClientMessage(playerid, COR_ERRO, "| ERROR | Você não está próximo do seu carro de lixo!");
				SendClientMessage(playerid, COR_ERRO, "| ERROR | Foi marcado no seu radar o local do seu carro de lixo!");

	            SetPlayerMapIcon(playerid, GPS_ID, vehx, vehy, vehz, GPS_ICON, 0, MAPICON_GLOBAL);
	            PlayerPlaySound(playerid, 1057, 0 ,0, 0);
	            HQ[playerid] = true;

				return 1;
			}
		}else
		{
			SendClientMessage(playerid, COR_ERRO, "| ERROR | Vá até seu HQ para buscar um carro de lixo!");
			return 1;
		}
	}
	else
	{
		SendClientMessage(playerid, COR_ERRO, "| ERROR | Este comando é exclusivo para a profissão de gari!");
	}
    return 1;
}
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
// Comandos para admins 
CMD:givecar(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new car;
        new string[128];
        new Float:X, Float:Y, Float:Z;
        GetPlayerPos(playerid, Float:X, Float:Y, Float:Z);
        if(sscanf(params,"i", car))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /givecar <Vehicle ID 400 - 611>");
        }
        else if(car < 400 || car >611){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | Não pode ir abaixo de 400 ou acima de 611");
        }
        else
        {
            if(Vehicle[playerid] != 0)
            {
            	DestroyVehicle(Vehicle[playerid]);
            }
            Vehicle[playerid] = CreateVehicle(car, X, Y, Z + 2.0, 0, -1, -1, 1);
            PutPlayerInVehicle(playerid, Vehicle[playerid], 0);
            format(string,sizeof(string),"Você gerou o veículo ID %i",car);
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s criou um veículo!",getName(playerid));

            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s criou um veículo [/givecar]", getName(playerid));
			fileLog("Admins", Log);

        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
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

	new string[128];
	format(string,sizeof(string),"| STAFF | %s fez com que o veículo fosse respawnado!",getName(playerid));

    for(new i,a = GetMaxPlayers(); i < a; i++)
	{
		if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
		{
			SendClientMessage(i, COR_WARNING, string);
		}
	}

	format(Log, sizeof(Log), "O %s fez com que o veículo fosse respawnado [/respawnv]", getName(playerid));
	fileLog("Admins", Log);
	return 1;
}
// Gasolina
CMD:setgasolina(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setgasolina < ID do jogador > < Valor >");
        }
        else if(valor < 0 || valor > 100){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 100");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	PlayerDados[id][gasolina] = valor;

            format(string,sizeof(string),"Você atualizou o valor da gasolina de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor da gasolina de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);

            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor da gasolina de %s [/setgasolina]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Fome
CMD:setfome(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setvalor < ID do jogador > < Valor >");
        }
        else if(valor < 0 || valor > 100){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 100");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	PlayerDados[id][fome] = valor;

        	PlayerTextDrawTextSize(id, textStatusBar[playerid][7], ( 566.607299 + ( (64.90 * PlayerDados[id][fome] ) / 100 ) ), 0.000000);
			UpdateTextDraw(id, 7);

            format(string,sizeof(string),"Você atualizou o valor da fome de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor da fome de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor da fome de %s [/setfome]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Sede
CMD:setsede(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setsede < ID do jogador > < Valor >");
        }
        else if(valor < 0 || valor > 100){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 100");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	PlayerDados[id][sede] = valor;

        	PlayerTextDrawTextSize(id, textStatusBar[playerid][5], ( 566.607299 + ( (64.90 * PlayerDados[id][sede] ) / 100 ) ), 0.000000);
			UpdateTextDraw(id, 5);

            format(string,sizeof(string),"Você atualizou o valor da sede de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor da sede de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor da sede de %s [/setsede]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Saude
CMD:setsaude(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setsaude < ID do jogador > < Valor >");
        }
        else if(valor < 0 || valor > 100){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 100");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	PlayerDados[id][saude] = valor;

        	PlayerTextDrawTextSize(id, textStatusBar[playerid][3], ( 566.607299 + ( (64.90 * PlayerDados[id][saude] ) / 100 ) ), 0.000000);
			UpdateTextDraw(id, 3);

            format(string,sizeof(string),"Você atualizou o valor da saude de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor da saude de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor da saude de %s [/setsaude]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Level de Procurado
CMD:setprocurado(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setprocurado < ID do jogador > < Valor >");
        }
        else if(valor < 0 || valor > 10){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 10");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	SetPlayerWantedLevel(id, valor);
        	
        	new string_velo[15];
 
	        format(string_velo, sizeof (string_velo), "%d", GetPlayerWantedLevel(id));
	        PlayerTextDrawSetString(id, textStatusBar[1][id], string_velo);

			UpdateTextDraw(id, 1);

            format(string,sizeof(string),"Você atualizou o valor do level de procurado de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor do level de procurado de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor do level de procurado de %s [/setprocurado]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}

// Teletransportar jogador
CMD:tp(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /tp < ID do jogador > < ID do jogador >");
        }
        else if(!IsPlayerConnected(id) || !IsPlayerConnected(valor)){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	new Float:X, Float:Y, Float:Z;
        	GetPlayerPos(id, Float:X, Float:Y, Float:Z);

			SetPlayerPos(valor, X, Y, Z);        	

            format(string,sizeof(string),"Você teletransportou até o jogador %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s teletransportou até de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s teletransportou até %s [/tp]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}

// Level de Procurado
CMD:setmoney(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 2)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setmoney < ID do jogador > < Valor >");
        }
        else if(valor < 0 || valor > 10000){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 10000");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	GivePlayerMoney(id, valor);

            format(string,sizeof(string),"Você atualizou o valor do money de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor do money de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor de money de %s [/setmoney]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Set Skin
CMD:setskin(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 1)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setskin < ID do jogador > < ID da Skin >");
        }
        else if(valor < 0 || valor > 311){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 311");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	SetPlayerSkin(id, valor);

            format(string,sizeof(string),"Você atualizou o valor da Skin de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor da Skin de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor da Skin de %s [/setskin]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Set level
CMD:setlevel(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] >= 3)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setlevel < ID do jogador > < Level >");
        }
        else if(valor < 0 || valor > 1600){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 311");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

        	SetPlayerScore(id, valor);

            format(string,sizeof(string),"Você atualizou o valor do Level de %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            format(string,sizeof(string),"| STAFF | %s atualizou o valor do Level de %s!",getName(playerid), getName(id));
            SendClientMessage(id, COR_SUCCESS, string);
            
            for(new i,a = GetMaxPlayers(); i < a; i++)
			{
				if(IsPlayerConnected(i) && PlayerDados[i][Admin] > 0)
				{
					SendClientMessage(i, COR_WARNING, string);
				}
			}

			format(Log, sizeof(Log), "O %s atualizou o valor do Level de %s [/setskin]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}
// Set Admin
CMD:setadmin(playerid, params[])
{
	if (IsPlayerAdmin(playerid) || PlayerDados[playerid][Admin] > 4)
	{
        new id, valor;
        if(sscanf(params,"ii", id, valor))
        {
            return SendClientMessage(playerid,COR_ERRO,"Use: /setadmin < ID do jogador > < Level Admin >");
        }
        else if(valor < 0 || valor > 4){
            return SendClientMessage(playerid, COR_ERRO, "| ERROR | O valor têm que ser entre 0 e 4");
        }
        else if(!IsPlayerConnected(id)){
        	return SendClientMessage(playerid, COR_ERRO, "| ERROR | O jogador não está online!");	
        }
        else
        {
        	new string[128];

     		PlayerDados[id][Admin] = valor;   	

            format(string,sizeof(string),"Você definiu o jogador como um membro da staff %s!",getName(id));
            SendClientMessage(playerid, COR_SUCCESS, string);

            if(valor == 1){
            	format(string,sizeof(string),"| STAFF | %s definiu o jogador %s como Ajudante!",getName(playerid), getName(id));
            	SendClientMessageToAll(COR_ERRO, string);
            }else  if(valor == 2){
            	format(string,sizeof(string),"| STAFF | %s definiu o jogador %s como Moderador!",getName(playerid), getName(id));
            	SendClientMessageToAll(COR_ERRO, string);
            }else if(valor == 3){
            	format(string,sizeof(string),"| STAFF | %s definiu o jogador %s como Administrador!",getName(playerid), getName(id));
            	SendClientMessageToAll(COR_ERRO, string);
            }else{
            	format(string,sizeof(string),"| STAFF | %s definiu o jogador %s como um membro da Diretoria!",getName(playerid), getName(id));
            	SendClientMessageToAll(COR_ERRO, string);
            }
            
			format(Log, sizeof(Log), "O %s definiu o jogador %s como um membro da staff [/setadmin]", getName(playerid), getName(id));
			fileLog("Admins", Log);
        }
    }
	else SendClientMessage(playerid, COR_ERRO, "Somente administradores podem usar este comando!");
	return 1;
}

//------------------------------------------------------------------------------
