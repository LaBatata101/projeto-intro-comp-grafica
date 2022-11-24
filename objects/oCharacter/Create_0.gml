#region Constructor

	// Atributos/variaveis aparentemente precisam ser iniciadas
	myName = choose("Yuri","Guilherme","Lincoln","Renan","Vitor","Czanildo");
	myClass = "";	// Deve receber a classe do personagem
	
	// Acho que fora o nome, o resto das variaveis podem ser fixas
	// Atributos abaixo baseeados no Fire Emblem de GBA
	level = 1;			// level do personagem
	xp = 0;				// Valor de experiencia atual do personagem
	maxHealth = 0;		
	strOrMag = 0;			
	skill = 0;			
	spd = 0;
	luck = 0;
	def = 0;
	res = 0;
	move = 0;
	con = 0;
	aid = 0;
	
	// Variavel booleana para ajudar IA inimiga a saber quais são as unidades do player
	isPlayerUnit = false;
	
	// Atributos de equipamento
	weapon = [];
	armor = [];
	acessorie = []; 
	
	// O que seria um construtor em outras linguagens
	initialize = function(_class, _health, _strOrMag, _skill, _spd, _luck, _def, _res, _move, _con, _aid) {
		self.myClass = _class;
		self.maxHealth = _health;
		self.strOrMag = _strOrMag;
		self.skill = _skill;
		self.spd = _spd;
		self.luck = _luck;
		self.def = _def;
		self.res = _res;
		self.move = _move;
		self.con = _con;
		self.aid = _aid;
	}
	
	// Função para trocar nome
	setName = function(_newName) {
		self.myName = _newName;
	}

	// Funções para troca de equipamento
	// Falta fazer com que o equipamento antigo seja guardado em um inventorio ao trocar
	setWeapon = function(_newWeapon) {
		self.weapon = _newWeapon;
	}
	
	setArmor = function(_newArmor) {
		self.armor = _newArmor;
	}
	
	setAcessorie = function(_newAcessorie) {
		self.acessorie = _newAcessorie;
	}
	
	// Função para mudar valor de booleana isPlayerUnit
	setIsPlayerUnit = function(_newBooleanValue) {
		self.isPlayerUnit = _newBooleanValue;
	}

	// Função para quando beber potions ou for curado
	addHealth = function(_healthValue) {
		self.myHealth = self.myHealth + _healthValue;
	}
	
	// Função de ganho de xp
	addXP = function(_value) {
		self.xp = self.xp + _value;
	}
	
#endregion

// stats = new character();
// stats.initialize("Yuri", "Cavaleiro", 10,2,2,2,2,2,2,2,2,2);	