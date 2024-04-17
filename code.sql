CREATE TABLE IF NOT EXISTS zona(
numZona numeric(3) primary key,
secao numeric(3),
uf varchar(2),
numero numeric(8)
);
CREATE TABLE IF NOT EXISTS partido(
idPart numeric(4) primary key,
siga varchar(4),
nomePartido varchar(30),
numCand numeric(4)
);
CREATE TABLE IF NOT EXISTS candidato(
numCand numeric(4) primary key,
nomeCand varchar(30),
idPart numeric(4)
);
CREATE TABLE IF NOT EXISTS eleitor(
numero numeric(8) primary key,
titulo numeric(4),
nomeEleitor varchar(30),
foneEleitor numeric(8),
idPart numeric(4),
numCand numeric(4),
numZona numeric(3)
);
ALTER TABLE eleitor
ADD constraint fk_idPart_partido
foreign key (idPart)
references partido (idPart),
ADD constraint fk_numCand_candidato
foreign key (numCand)
references candidato (numCand),
ADD constraint fk_numZona_zona
foreign key (numZona)
references zona (numZona);
ALTER TABLE partido
ADD constraint fk_numCand
foreign key (numCand)
references candidato (numCand);
ALTER TABLE candidato
ADD constraint fk_idPart_partido
foreign key (idPart)
references partido (idPart);
ALTER TABLE zona
ADD constraint fk_numero_eleitor
foreign key (numero)
references eleitor (numero)
