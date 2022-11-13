#region Constructor
	// Rodando o construtor do pai antes
	event_inherited();

	// Colocar valores genericos de atributos para a classe na função initialize abaixo
	// Inicialização generica
	//	_name; _class; _health; _strOrMag; _skill; _spd; _luck; _def; _res; _move; _con; _aid;
	self.initialize("Nome", "Cavaleiro Montado", 
	8, // Não sei qual o calculo de HP
	irandom_range(4,6),
	irandom_range(3,5),
	irandom_range(4,6),
	irandom_range(3,4),
	irandom_range(4,6),
	irandom_range(3,5),
	7,
	irandom_range(4,5),
	irandom_range(2,4));
	
	// Atributos de limite de atributos da classe
	limitStrOrMag = irandom_range(13,16);
	limitSkill = irandom_range(11,14);
	limitSpd = irandom_range(15,18);
	limitLuck = irandom_range(11,14);
	limitDef = irandom_range(13,16);
	limitRes = irandom_range(12,14);
	limitCon = irandom_range(12,14);
	limitAid = irandom_range(10,12);
	
	// Função para customizar tudo depois de o personagem com esta classe ser criado, assim podendo criar classes unicas
	initializeCustom = function(_level, _name, _class, _health, _strOrMag, _skill, _spd, _luck, _def, _res, _move, _con, _aid) {
		self.level = _level;
		self.myName = _name;
		self.myClass = _class;
		self.myHealth = _health;
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

	// Função para upar de nivel
	levelUp = function() {
		while (self.xp > self.level * 40) {	// Expresão que verifica se o personagem ja tem xp para aumentar o level
			self.xp = self.xp - self.level * 40;	// Reduz a xp pelo tanto que o usuario precisa para upar, e mantem o valor restante
			self.level = self.level + 1;
			temp = irandom_range(1, 100);	// Variavel que devolve um valor aleatorio entre 1 e 100
			temp2 = irandom_range(1, 100);
			if (level mod 20 == 0) {
				if (self.strOrMag + 1 <= self.limitStrOrMag) {
					self.strOrMag = self.strOrMag + 1;
				}
				if (self.skill + 1 <= self.limitSkill) {
					self.skill = self.skill + 1;
				}
				if (self.spd + 1 <= self.limitSpd) {
					self.spd = self.spd + 1;
				}
				if (self.luck + 1 <= self.limitLuck) {
					self.luck = self.luck + 1;
				}
				if (self.def + 1 <= self.limitDef) {
					self.def = self.def + 1;
				}
				if (self.res + 1 <= self.limitRes) {
					self.res = self.res + 1;
				}
				if (self.con + 1 <= self.limitCon) {
					self.con = self.con + 1;
				}
				if (self.aid + 1 <= self.limitAid) {
				self.aid = self.aid + 1;
				}
			} else if (temp < 16) {
				if (self.strOrMag + 1 <= self.limitStrOrMag) {
					self.strOrMag = self.strOrMag + 1;
				}
			} else if (temp > 15 && temp < 26) {
				if (self.skill + 1 <= self.limitSkill) {
					self.skill = self.skill + 1;
				}
			} else if (temp > 25 && temp < 36) {
				if (self.spd + 1 <= self.limitSpd) {
					self.spd = self.spd + 1;
				}
			} else if (temp > 35 && temp < 46) {
				if (self.luck + 1 <= self.limitLuck) {
					self.luck = self.luck + 1;
				}
			} else if (temp > 45 && temp < 61) {
				if (self.def + 1 <= self.limitDef) {
					self.def = self.def + 1;
				}
			} else if (temp > 60 && temp < 71) {
				if (self.res + 1 <= self.limitRes) {
					self.res = self.res + 1;
				}
			} else if (temp > 70 && temp < 81) {
				if (self.con + 1 <= self.limitCon) {
				self.con = self.con + 1;
				}
			} else if (temp > 80 && temp < 91) {
				if (self.aid + 1 <= self.limitAid) {
					self.aid = self.aid + 1;
				}
			} else if (temp > 90) {
				if (self.spd + 1 <= self.limitSpd) {
					self.spd = self.spd + 1;
				}
				if (temp2 < 16) {
					if (self.strOrMag + 1 <= self.limitStrOrMag) {
						self.strOrMag = self.strOrMag + 1;
					}
				} else if (temp2 > 15 && temp2 < 31) {
					if (self.skill + 1 <= self.limitSkill) {
						self.skill = self.skill + 1;
					}
				} else if (temp2 > 30 && temp2 < 46) {
					if (self.luck + 1 <= self.limitLuck) {
						self.luck = self.luck + 1;
					}
				} else if (temp2 > 45 && temp2 < 61) {
					if (self.def + 1 <= self.limitDef) {
						self.def = self.def + 1;
					}
				} else if (temp2 > 60 && temp2 < 76) {
					if (self.res + 1 <= self.limitRes) {
						self.res = self.res + 1;
					}
				} else if (temp2 > 75 && temp2 < 91) {
					if (self.con + 1 <= self.limitCon) {
						self.con = self.con + 1;
					}
				} else if (temp2 > 90 && temp2 < 101) {
					if (self.aid + 1 <= self.limitAid) {
						self.aid = self.aid + 1;
					}
				}
			}	
		}
	}
	
#endregion
