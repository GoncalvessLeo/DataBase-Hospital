-- 1
select *, AVG(valor_consulta) from consulta group by year(dt_consulta) = 2020;

-- 2
select * from internacao where dt_efetiva_alta > dt_prevista_alta; 

-- 3
select * from consulta inner join receita on consulta.id_consulta = receita.id_consulta inner join paciente 
on paciente.id_paciente = consulta.id_paciente
order by receita.id_receita limit 1;

-- 4 
select *, MAX(valor_consulta), MIN(valor_consulta) from consulta;

-- 5
select *, DATEDIFF(dt_efetiva_alta, dt_entrada) dias_internado, tipos_quarto.valor_diario, DATEDIFF(dt_efetiva_alta, dt_entrada) * tipos_quarto.valor_diario valor_total from internacao inner join quartos 
on internacao.quarto_id = quartos.id_quarto inner join tipos_quarto 
on quartos.tipo_id = tipos_quarto.id_tipo;

-- 6
select i.id_internacao, i.dt_entrada, i.desc_procedimentos, q.numero_quarto from internacao i inner join quartos q 
on q.id_quarto = i.quarto_id where q.tipo_id = 1; 

-- 7
select p.nome_paciente, c.dt_consulta, e.nome_especialidade from consulta c inner join paciente p 
on p.id_paciente = c.id_paciente inner join especialidade e 
on e.id_especialidade = c.id_especialidade 
where c.id_especialidade<> 1 and year(c.dt_consulta) - year(p.dt_nasc_paciente) < 19 and year(c.dt_consulta) - year(p.dt_nasc_paciente) > 0 
order by c.dt_consulta ; 

-- 8 não tem
select p.nome_paciente, m.nome_medico, i.dt_entrada, i.desc_procedimentos, q.id_quarto
from internacao i
inner join medico m 
on m.id_medico = i.medico_id
inner join paciente p
on p.id_paciente = i.paciente_id
inner join quartos q
on q.id_quarto = i.quarto_id
where q.tipo_id = 3 and m.id_especialidade = 3;

-- 9
select m.nome_medico, count(c.id_medico) as 'Qntd de consultas' from medico m inner join consulta c 
on c.id_medico = m.id_medico group by c.id_medico;

-- 10
insert into medico(nome_medico, cpf_medico, crm, email_medico, cargo_medico, id_especialidade, em_atividade) values('Gabriel Augusto', 45679312, 123456, 'gabriel.augusto@gmail.com', 'Especialista', 3, 'Ativo');
select * from medico where nome_medico like '%Gabriel%'; 

-- 11 não tem
select enf.nome_enfermeiro, enf.cre, COUNT(i.id_enfermeiro) as Participacao from enfermeiros enf
inner join internacao_enfermeiro i on i.id_enfermeiro = enf.id_enfermeiro group by enf.id_enfermeiro having Participacao > 1;