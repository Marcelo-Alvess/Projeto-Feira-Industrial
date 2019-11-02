

select 
b.nm_proj Projeto,
c.ds_criterio_av Criterio, 
CONVERT(decimal (18,3), CONVERT(decimal (18,3),sum(a.not_ava)) / CONVERT(decimal(18,3), COUNT(a.not_ava))) Media, 
COUNT(a.not_ava) Avaliadores,  
a.id_proj,
a.id_criterio_av
from VotacaoProjetos.dbo.Avalaicao_Projeto a
inner join VotacaoProjetos.dbo.Projeto b on a.id_proj = b.id_proj
inner join VotacaoProjetos.dbo.Criterio_Avaliacao c on a.id_criterio_av = c.id_criterio_av
inner join VotacaoProjetos.dbo.Usuario d on a.cpf_usu = d.cpf_usu
group by c.ds_criterio_av, b.nm_proj, a.id_proj, a.id_criterio_av
order by Media desc, COUNT(a.not_ava) desc

select 
b.nm_proj Projeto,
CONVERT(decimal (18,3), CONVERT(decimal (18,3),sum(a.not_ava)) / CONVERT(decimal(18,3), COUNT(a.not_ava))) Media, 
COUNT(a.not_ava) / 3 Eleitores,
a.id_proj
from VotacaoProjetos.dbo.Avalaicao_Projeto a
inner join VotacaoProjetos.dbo.Projeto b on a.id_proj = b.id_proj
inner join VotacaoProjetos.dbo.Criterio_Avaliacao c on a.id_criterio_av = c.id_criterio_av
inner join VotacaoProjetos.dbo.Usuario d on a.cpf_usu = d.cpf_usu
group by b.nm_proj, a.id_proj
order by Media desc, COUNT(a.not_ava) desc

select COUNT(a.not_ava) / 3 Avaliacoes from VotacaoProjetos.dbo.Avalaicao_Projeto a 

select count
(distinct id_proj) Projetos
from VotacaoProjetos.dbo.Avalaicao_Projeto 
where 1 = 1 

select count(distinct cpf_usu) Pessoas
from VotacaoProjetos.dbo.Avalaicao_Projeto 


select b.nm_usu Avaliador, COUNT(a.not_ava) / 3 Avaliacoes
from VotacaoProjetos.dbo.Avalaicao_Projeto a 
inner join VotacaoProjetos.dbo.Usuario b on a.cpf_usu = b.cpf_usu 
where 1 = 1 
group by a.cpf_usu, b.nm_usu
order by COUNT(a.not_ava) / 3 desc, Avaliador


