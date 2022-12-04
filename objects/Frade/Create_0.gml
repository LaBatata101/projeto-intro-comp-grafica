#region Constructor
	// Rodando o construtor do pai antes
	event_inherited();

	// Colocar valores genericos de atributos para a classe na função initialize abaixo
	// Inicialização generica
	//	_name; _class; _health; _strOrMag; _skill; _spd; _luck; _def; _res; _move; _con; _aid;
	self.initialize("Frade", 
	irandom_range(3,4), // HP
	irandom_range(5,6),
	irandom_range(4,5),
	irandom_range(4,5),
	irandom_range(3,4),
	irandom_range(2,4),
	irandom_range(3,4),
	5,
	irandom_range(3,4),
	irandom_range(4,5));
	
	// Atributos de limite de atributos da classe
	limitStrOrMag = irandom_range(18,19);
	limitSkill = irandom_range(14,16);
	limitSpd = irandom_range(14,16);
	limitLuck = irandom_range(12,14);
	limitDef = irandom_range(8,12);
	limitRes = irandom_range(11,13);
	limitCon = irandom_range(10,12);
	limitAid = irandom_range(12,14);
	
	// Atributos de equipamento
	// array de weapon possui nome da arma, tipo, alcance e dano bonus
	self.setWeapon(["Magia divina", "Magia", 2, 0]);
	
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
			maxHealth = maxHealth + ceil(self.con/5);
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
			} else if (temp > 15 && temp < 31) {
				if (self.skill + 1 <= self.limitSkill) {
					self.skill = self.skill + 1;
				}
			} else if (temp > 30 && temp < 41) {
				if (self.spd + 1 <= self.limitSpd) {
					self.spd = self.spd + 1;
				}
			} else if (temp > 40 && temp < 51) {
				if (self.luck + 1 <= self.limitLuck) {
					self.luck = self.luck + 1;
				}
			} else if (temp > 50 && temp < 59) {
				if (self.def + 1 <= self.limitDef) {
					self.def = self.def + 1;
				}
			} else if (temp > 58 && temp < 69) {
				if (self.res + 1 <= self.limitRes) {
					self.res = self.res + 1;
				}
			} else if (temp > 68 && temp < 79) {
				if (self.con + 1 <= self.limitCon) {
				self.con = self.con + 1;
				}
			} else if (temp > 78 && temp < 91) {
				if (self.aid + 1 <= self.limitAid) {
					self.aid = self.aid + 1;
				}
			} else if (temp > 90) {
				if (self.strOrMag + 1 <= self.limitStrOrMag) {
					self.strOrMag = self.strOrMag + 1;
				}
				if (temp2 < 16) {
					if (self.spd + 1 <= self.limitSpd) {
						self.spd = self.spd + 1;
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
					if (self.aid + 1 <= self.limitAid) {
						self.aid = self.aid + 1;
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
					if (self.def + 1 <= self.limitDef) {
						self.def = self.def + 1;
					}
				}
			}	
		}
	}
	
#endregion
