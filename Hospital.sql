
CREATE database IF NOT EXISTS Hospital;

USE Hospital ;

CREATE TABLE IF NOT EXISTS Paciente (
  id_paciente INT(11) AUTO_INCREMENT PRIMARY KEY,
  nome_paciente VARCHAR(255) NOT NULL,
  dt_nasc_paciente DATE,
  cpf_paciente VARCHAR(20) UNIQUE NOT NULL,
  rg_paciente VARCHAR(15) NOT NULL,
  endereco_paciente VARCHAR(255),
  telefone_paciente VARCHAR(255) NULL DEFAULT NULL,
  email_paciente VARCHAR(255),
  id_convenio INT(11) DEFAULT NULL
);
--
CREATE TABLE IF NOT EXISTS Consulta (
  id_consulta INT(11) AUTO_INCREMENT PRIMARY KEY,
  dt_consulta DATE NOT NULL,
  hora_consulta TIME NOT NULL,
  id_medico INT(11) NOT NULL,
  id_paciente INT(11) NOT NULL,
  valor_consulta VARCHAR(255) ,
  id_especialidade INT(11) NOT NULL
  );
--
CREATE TABLE IF NOT EXISTS Convenio (
  id_convenio INT(11) AUTO_INCREMENT PRIMARY KEY,
  nome_convenio VARCHAR(255),
  tempo_carencia VARCHAR(255),
  cnpj_convenio VARCHAR(20)
  );
--
CREATE TABLE IF NOT EXISTS Enfermeiros (
  id_enfermeiro INT(11) AUTO_INCREMENT PRIMARY KEY,
  nome_enfermeiro VARCHAR(255) NOT NULL,
  cpf_enfermeiro VARCHAR(15) UNIQUE NOT NULL,
  cre VARCHAR(13) UNIQUE NOT NULL
 );
--
CREATE TABLE IF NOT EXISTS Especialidade (
  id_especialidade INT(11) AUTO_INCREMENT PRIMARY KEY,
  nome_especialidade VARCHAR(255) 
);
--
CREATE TABLE IF NOT EXISTS Tipos_quarto (
  id_tipo INT(11) AUTO_INCREMENT PRIMARY KEY,
  valor_diario INT NULL DEFAULT NULL,
  desc_quarto VARCHAR(255) DEFAULT NULL
);
--
CREATE TABLE IF NOT EXISTS Quartos (
  id_quarto INT(11) AUTO_INCREMENT PRIMARY KEY,
  numero_quarto INT(11) NOT NULL,
  tipo_id INT(11) NOT NULL,
  FOREIGN KEY (tipo_id) REFERENCES Tipos_quarto(id_tipo)
);
--
CREATE TABLE IF NOT EXISTS Medico (
  id_medico INT AUTO_INCREMENT PRIMARY KEY,
  nome_medico VARCHAR(255) NOT NULL ,
  cpf_medico VARCHAR(20) UNIQUE NOT NULL,
  crm VARCHAR(13)UNIQUE NOT NULL,
  email_medico VARCHAR(255),
  cargo_medico VARCHAR(255) NOT NULL,
  id_especialidade INT(11) NOT NULL
);
--
CREATE TABLE IF NOT EXISTS Medico_especialidade (
  id_medico INT ,
  id_especialidade INT NULL,
  FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
  FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
 );
--
CREATE TABLE IF NOT EXISTS Internacao (
  id_internacao INT AUTO_INCREMENT PRIMARY KEY,
  dt_entrada DATE NOT NULL,
  dt_prevista_alta DATE NOT NULL,
  dt_efetiva_alta DATE NOT NULL,
  desc_procedimentos VARCHAR(255),
  paciente_id INT(11) NOT NULL,
  medico_id INT(11) NOT NULL,
  quarto_id INT(11) NOT NULL,
  FOREIGN KEY (paciente_id) REFERENCES Paciente (id_paciente),
  FOREIGN KEY (medico_id) REFERENCES Medico (id_medico),
  FOREIGN KEY (quarto_id) REFERENCES Quartos (id_quarto)
 );
 --
CREATE TABLE IF NOT EXISTS Internacao_enfermeiro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_internacao INT,
  id_enfermeiro INT,
  FOREIGN KEY (id_internacao) REFERENCES Internacao(id_internacao),
  FOREIGN KEY (id_enfermeiro) REFERENCES Enfermeiros(id_enfermeiro)
);
--
CREATE TABLE IF NOT EXISTS Receita (
  id_receita INT(11) AUTO_INCREMENT PRIMARY KEY,
  medicamento VARCHAR(255),
  qtd_medicamento VARCHAR(255),
  instrucao_uso VARCHAR(255),
  id_consulta INT(11) NOT NULL
);

-- INSERINDO DADOS NA TABELA PACIENTE
--
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Cauê Pedro Henrique', '1943-03-15', '81636638473', '21.056.057-5', 'Rua Paulo Ferreira/622/Teixeirão/Cacoal/RO', '(69) 99782-4353', 'caue.pedro.nascimento@domain.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Maya Rita Mendes', '2000-01-27', '78191969122', '11.944.749-6', 'Rua Tia Silva/536/Praia do Meio/Palhoça/SC', '(48) 98647-1462', 'maya.rita.mendes@valedesign.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Fabiana Mariane Rayssa', '1993-05-17', '69552069157', '11.114.456-5', 'Avenida Volta Redonda/107/Volta Redonda/Caxias/MA', '(99) 98545-1528', 'fabiana-moreira72@imaxbrasil.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Teresinha Clara Sandra', '1956-05-05', '29210630858', '36.058.335-0', '3ª Travessa Três Irmãos/343/Nordeste/Salvador/BA', '(71) 98149-4692', 'teresinhaclararezende@alvesbarcelos.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Igor André da Paz', '1948-02-21', '49283746228', '24.636.887-1', 'Rua João Fagundes de Menezes/524/Jardim Monte Alegre/Dourados/MS', '(67) 98204-6106', 'igorandredapaz@pig.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Marcela Flávia Porto', '2004-03-04', '25779859400', '39.972.236-1', 'Rua Morada Nova/846/Lagoinha/Porto Velho/RO', '(69) 99579-2495', 'marcela_porto@centerdiesel.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Samuel Lucas Souza', '1987-05-19', '60277455685', '32.058.122-6', 'Quadra 29/751/Del Lago I (Itapoã)/Brasília/DF', '(61) 99320-8951', 'samuel_lucas_souza@marcofaria.com');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Aline Catarina Marlene', '1975-05-17', '95615233966', '27.763.045-9', 'Rua Coronel Rodrigues Portugal/192/Cabo Luís Quevedo/Uruguaiana/RS', '(55) 99498-3260', 'alinecatarinadacosta@sestito.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Iago Anthony Igor', '1978-02-09', '18169049610', '34.352.831-9', 'Rua José Arnaldo Pissinatti Filho/483/Jardim Pansani/Mogi Guaçu/SP', '(19) 99596-7619', 'iago.anthony.cardoso@mesquita.not.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Andreia Luciana Bernardes', '1956-03-21', '04475878209', '48.303.404-6', 'Rua 7/448/Flores/Manaus/AM', '(92) 99264-5897', 'andreialucianabernardes@dglnet.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Evelyn Jennifer Brito', '1964-04-22', '95277941967', '42.367.342-7', 'Quadra 1103 Sul Alameda 19/854/Plano Diretor Sul/Palmas/TO', '(63) 99700-1822', 'evelynjenniferbrito@aiesec.net');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Arthur Lucca Baptista', '1969-04-11', '29108517371', '44.235.208-6', 'Passagem Dois Amigos/746/Tapanã (Icoaraci)/Belém/PA', '(91) 99457-5474', 'arthurluccabaptista@vmetaiscba.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Benedito Iago Cauê', '1995-05-07', '63697624237', '27.555.392-9', 'Rua Olinda/588/Jardim Noroeste/Campo Grande/MS', '(67) 99415-3797', 'benedito.iago.figueiredo@viacorte.com.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Raimunda Benedita Maria', '1980-03-11', '98139139750', '32.709.916-1', 'Conjunto Primavera II/992/Primavera/PI', '(86) 99738-6784', 'raimundabeneditaribeiro@gvmail.br');
INSERT INTO paciente (nome_paciente, dt_nasc_paciente, cpf_paciente, rg_paciente, endereco_paciente, telefone_paciente, email_paciente) VALUES ('Marli Evelyn Dias', '2003-01-08', '91309318433', '28.119.867-6', 'Rua JO-06 II/251/Residencial Jardim das Oliveiras/Araxá/MG', '(34) 98848-9871', 'marli_evelyn_dias@tecsysbrasil.com.br');

-- INSERINDO DADOS NA TABELA CONSULTA
--
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2015-03-05', '08:50', 3, 1, '120.00', 3);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2015-06-22', '19:40', 4, 3, '80.00', 4);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2016-05-08', '14:20', 1, 5, '130.00', 1);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2016-07-16', '22:37', 2, 4, '100.00', 2);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2016-10-30', '23:49', 5, 2, '160.00', 5);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2017-06-02', '18:23', 7, 9, '160.00', 7);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2017-08-03', '17:36', 9, 7, '140.00', 9);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2018-04-14', '07:12', 6, 8, '110.00', 6);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2018-11-23', '03:58', 8, 6, '90.00', 8);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2019-02-11', '05:10', 10, 10, '70.00', 10);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2019-08-15', '11:22', 5, 11, '160.00', 5);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2020-01-03', '07:14', 9, 13, '140.00', 9);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2020-02-28', '12:55', 2, 15, '100.00', 2);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2020-09-30', '15:01', 8, 12, '70.00', 8);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2021-05-12', '13:00', 8, 14, '70.00', 8);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2021-06-20', '02:20', 5, 1, '160.00', 5);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2021-10-03', '00:00', 7, 4, '160.00', 7);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2021-12-10', '16:41', 2, 5, '100.00', 2);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2022-01-01', '13:55', 4, 3, '80.00', 4);
INSERT INTO consulta (dt_consulta, hora_consulta, id_medico, id_paciente, valor_consulta, id_especialidade) VALUES ('2022-01-01', '14:37', 6, 9, '110.00', 6);

-- INSERINDO DADOS NA TABELA CONVENIO
-- 
INSERT INTO convenio (nome_convenio, tempo_carencia, cnpj_convenio) VALUE ('PlanotTotal', '30 dias', '12345678900001');
INSERT INTO convenio (nome_convenio, tempo_carencia, cnpj_convenio) VALUE ('UnimedPrime', '60 dias', ' 98765432100002');
INSERT INTO convenio (nome_convenio, tempo_carencia, cnpj_convenio) VALUE ('BradescoSaúde', '90 dias', '45678912300003');
INSERT INTO convenio (nome_convenio, tempo_carencia, cnpj_convenio) VALUE ('SulAmérica', '45 dias', '32165498700004');

-- INSERINDO DADOS NA TABELA ENFERMEIROS
--
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Ana Santos', '12345678910', '123458');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Pedro Oliveira', '98765432110', '543212');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Laura Silva', '45678912310', '678900');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Marcos Santos', '32165498710', '987652');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Juliana Lima', '78912345610', '432106');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Carlos Souza', '65432198710', '345674');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Marina Costa', '23456789110', '765430');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Rafael Santos', '87654321010', '876541');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Fernanda Oliveira', '67890123410', '098760');
INSERT INTO enfermeiros (nome_enfermeiro, cpf_enfermeiro, cre) VALUE ('Lucas Pereira', '34567891210','567897');

-- INSERINDO DADOS NA TABELA ESPECIALIDADE
--
INSERT INTO especialidade (nome_especialidade) VALUE ('Pediatria');
INSERT INTO especialidade (nome_especialidade) VALUE ('Clinico Geral');
INSERT INTO especialidade (nome_especialidade) VALUE ('Gastrenterologia');
INSERT INTO especialidade (nome_especialidade) VALUE ('Dermatologia');
INSERT INTO especialidade (nome_especialidade) VALUE ('Urologia');
INSERT INTO especialidade (nome_especialidade) VALUE ('Cardiologia');
INSERT INTO especialidade (nome_especialidade) VALUE ('Ginecologista');
INSERT INTO especialidade (nome_especialidade) VALUE ('Psiquiatria');
INSERT INTO especialidade (nome_especialidade) VALUE ('Ortopedia');
INSERT INTO especialidade (nome_especialidade) VALUE ('Oftalmologia');

-- INSERINDO DADOS NA TABELA TIPOS_QUARTOS
--
INSERT INTO tipos_quarto (valor_diario, desc_quarto) VALUE ('1100.00', 'Apartamento');
INSERT INTO tipos_quarto (valor_diario, desc_quarto) VALUE ('800.00', 'Quarto Duplo');
INSERT INTO tipos_quarto (valor_diario, desc_quarto) VALUE ('600.00', 'Enfermaria');

-- INSERINDO DADOS NA TABELA QUARTOS
--
INSERT INTO quartos (numero_quarto, tipo_id) VALUE (02, 1);
INSERT INTO quartos (numero_quarto, tipo_id) VALUE (03, 2);
INSERT INTO quartos (numero_quarto, tipo_id) VALUE (04, 3);
INSERT INTO quartos (numero_quarto, tipo_id) VALUE (05, 3);
INSERT INTO quartos (numero_quarto, tipo_id) VALUE (10, 1);

-- INSERINDO DADOS NA TABELA MEDICO
--
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Thomas Cauê', '79883414056', '745896', 'thomas_silveira@agreonoma.eng.br', 'Generalista', 1);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Giovana Natália Porto', '22480293068', '123789', 'giovananataliaporto@fibria.com.br', 'Residente', 2);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Camila Adriana Barbosa', '16919550865', '569745',  'camila_adriana_barbosa@foar.unesp.br', 'Especialista', 3);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Kevin Joaquim Marcelo', '54758519307', '459781', 'kevin-aparicio78@gmeil.com', 'Especialista', 4);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Fabiana Evelyn', '80177545313', '123780', 'fabianaevelyndaconceicao@triunfante.com.br', 'Generalista', 5);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Joaquim Giovanni Lima', '73364334056', '014698', 'joaquim_lima@outllok.com', 'Residente', 6);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Antonio Ruan Dias', '45122747075', '814362', 'antonioruandias@eximiart.com.br', 'Residente', 7);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Bernardo Francisco', '00052099784', '654782', 'bernardofranciscopinto@astconsult.com.br', 'Generalista', 8);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Rita Sabrina', '19877616696', '487127', 'ritasabrinamoreira@inbox.com', 'Especialista', 9);
INSERT INTO medico (nome_medico, cpf_medico, crm, email_medico, cargo_medico, Id_especialidade) VALUE ('Mariane Laís Tatiane', '24572307130', '147548', 'mariane_lais_aragao@superacomunicacao.com.br', 'Especialista', 10);

-- Inserindo dados na tabela medicos_especialidade
--
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (1, 1);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (2, 2);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (3, 3);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (4, 4);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (5, 5);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (6, 6);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (7, 7);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (8, 8);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (9, 9);
INSERT INTO medico_especialidade (id_medico, id_especialidade) VALUE (10, 10);

-- INSERINDO DADOS NA TABELA INTERNACAO
--
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2015-02-15', '2015-03-10', '2015-03-12', 'Cirurgia de apendicite', 1, 3, 1);
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2016-06-20', '2016-07-10', '2016-07-15', 'Tratamento de pneumonia', 2, 4, 2);
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2017-09-05', '2017-09-20', '2017-09-22', 'Cirurgia de fratura óssea', 3, 1, 3);
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2018-04-10', '2018-04-30', '2018-05-05', 'Tratamento de infecção urinária', 4, 2, 1);
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2019-08-25', '2019-09-10', '2019-09-15', 'Cirurgia cardíaca', 1, 3, 2);
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2020-12-05', '2020-12-20', '2020-12-22', 'Tratamento de úlcera gástrica', 5, 1, 3);
INSERT INTO Internacao (dt_entrada, dt_prevista_alta, dt_efetiva_alta, desc_procedimentos, paciente_id, medico_id, quarto_id) VALUE ('2021-07-10', '2021-07-30', '2021-08-05', 'Cirurgia de apendicite', 2, 4, 2);

-- INSERINDO DADOS NA TABELA INTERNACAO_ENFERMEIRO
--
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (1, 1);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (2, 2);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (3, 3);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (4, 4);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (5, 5);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (6, 6);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (7, 7);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (null, 8);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (null, 9);
INSERT INTO internacao_enfermeiro (id_internacao, id_enfermeiro) VALUE (null, 10);

-- INSERINDO DADOS NA TABELA RECEITA
--
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Probiótico', '1', 'Tomar 1 cápsula diariamente, com um copo de água, antes das refeições.', 1);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Creme de corticosteroides', '2 vezes por dia', 'Aplicar uma fina camada na área afetada duas vezes ao dia.', 2);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Xarope', '5 ml', 'a cada 6 horas, conforme necessário para aliviar a tosse.', 3);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Analgésico de venda livre', '1 comprimido', 'a cada 6 horas, conforme necessário para alívio da dor.', 4);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Antibiótico para infecção urinária', '1 comprimido de 500mg', 'a cada 12 horas por 7 dias.', 5);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Anticoncepcional oral', '1 comprimido', 'diariamente no mesmo horário, começando no primeiro dia do ciclo menstrual.', 6);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Anti-inflamatório não esteroide', '1 comprimido de 200mg', 'a cada 8 horas, após as refeições.', 7);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Estatina para controle do colesterol', '1 comprimido de 20mg', 'diariamente, à noite, após a refeição.', 8);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Antidepressivo', '1 comprimido de 50mg', 'pela manhã, com ou sem alimentos.', 9);
INSERT INTO receita (medicamento, qtd_medicamento, instrucao_uso, id_consulta) VALUE ('Colírio lubrificante', '1 ou 2 gotas', 'Aplicar nos olhos afetados, conforme necessário para alívio do desconforto ocular.', 10);

-- ADICIONANDO MAIS UMA COLUNA NA TABELA MEDICO
--
ALTER TABLE medico add em_atividade varchar(100);

update medico set em_atividade = 'Ativo' where id_medico = 1;
update medico set em_atividade = 'Inativo' where id_medico = 2;
update medico set em_atividade = 'Inativo' where id_medico = 3;
update medico set em_atividade = 'Ativo' where id_medico = 4;
update medico set em_atividade = 'Ativo' where id_medico = 5;
update medico set em_atividade = 'Ativo' where id_medico = 6;
update medico set em_atividade = 'Inativo' where id_medico = 7;
update medico set em_atividade = 'Ativo' where id_medico = 8;
update medico set em_atividade = 'Ativo' where id_medico = 9;
update medico set em_atividade = 'Inativo' where id_medico = 10;

