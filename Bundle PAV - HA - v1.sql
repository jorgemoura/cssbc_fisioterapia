------------------------------ Bundle PAV - Unidade HA - Documento 569 ------------------------------------------------

select distinct
v.cd_atendimento, 
-----------------------------------------------------------------------------------------------------------------------
a.dt_atendimento,
-----------------------------------------------------------------------------------------------------------------------
a.dt_alta,
-----------------------------------------------------------------------------------------------------------------------
p.nm_paciente,
-----------------------------------------------------------------------------------------------------------------------
substr(dbamv.pack_internamento.retorna_idade(p.dt_nascimento,sysdate), 1, 3) idade,
-----------------------------------------------------------------------------------------------------------------------
(case when v.ds_unidade_internacao is null 
 then 
 (select min (k.ds_unid_int)
  from pre_med h, dbamv.itpre_med r, unid_int k
  where r.cd_pre_med = h.cd_pre_med 
  and h.cd_unid_int = k.cd_unid_int
  and h.cd_atendimento = a.cd_atendimento
  and h.cd_prestador = v.cd_prestador_criou
  and r.cd_tip_presc = 67219
  and r.tp_situacao = 'N'
  and trunc (h.dt_pre_med) in (select distinct trunc (v.dh_fechamento) 
                               from vdic_pw_resposta_documento v 
                               where v.cd_atendimento = h.cd_atendimento 
                               and v.cd_documento = 569))
  else v.ds_unidade_internacao end) unidade_internacao,
-----------------------------------------------------------------------------------------------------------------------
med.nm_prestador MEDICO,
-----------------------------------------------------------------------------------------------------------------------
--v.dh_criacao,
-----------------------------------------------------------------------------------------------------------------------
/*case when 
(select distinct dbms_lob.substr (b.lo_valor,1) resultado
 from dbamv.editor_campo ec, 
 dbamv.editor_registro_campo b, 
 dbamv.pw_editor_clinico c, 
 dbamv.pw_documento_clinico d
    where ec.cd_campo (+) = b.cd_campo 
    and b.cd_registro = c.cd_editor_registro 
    and d.cd_documento_clinico (+) = c.cd_documento_clinico
    and d.cd_atendimento = a.cd_atendimento
    and c.cd_documento = '569'
    and ec.ds_identificador = 'Metadado_P_69196_1'
    and d.tp_status = 'FECHADO'
    and rownum = 1) = '1' then 'Invasiva' 
when
(select distinct dbms_lob.substr (b.lo_valor,1) resultado
 from dbamv.editor_campo ec, 
 dbamv.editor_registro_campo b, 
 dbamv.pw_editor_clinico c, 
 dbamv.pw_documento_clinico d
    where ec.cd_campo (+) = b.cd_campo 
    and b.cd_registro = c.cd_editor_registro 
    and d.cd_documento_clinico (+) = c.cd_documento_clinico
    and d.cd_atendimento = a.cd_atendimento
    and c.cd_documento = '569'
    and ec.ds_identificador = 'Metadado_P_69196_1'
    and d.tp_status = 'FECHADO'
    and rownum = 1) = '2' then 'Não Invasiva'
when
(select distinct dbms_lob.substr (b.lo_valor,1) resultado
 from dbamv.editor_campo ec, 
 dbamv.editor_registro_campo b, 
 dbamv.pw_editor_clinico c, 
 dbamv.pw_documento_clinico d
    where ec.cd_campo (+) = b.cd_campo 
    and b.cd_registro = c.cd_editor_registro 
    and d.cd_documento_clinico (+) = c.cd_documento_clinico
    and d.cd_atendimento = a.cd_atendimento
    and c.cd_documento = '569'
    and ec.ds_identificador = 'Metadado_P_69196_1'
    and d.tp_status = 'FECHADO'
    and rownum = 1) = '3' then 'VPPI'
when
(select distinct dbms_lob.substr (b.lo_valor,1) resultado
 from dbamv.editor_campo ec, 
 dbamv.editor_registro_campo b, 
 dbamv.pw_editor_clinico c, 
 dbamv.pw_documento_clinico d
    where ec.cd_campo (+) = b.cd_campo 
    and b.cd_registro = c.cd_editor_registro 
    and d.cd_documento_clinico (+) = c.cd_documento_clinico
    and d.cd_atendimento = a.cd_atendimento
    and c.cd_documento = '569'
    and ec.ds_identificador = 'Metadado_P_69196_1'
    and d.tp_status = 'FECHADO'
    and rownum = 1) = '4' then 'Não se Aplica'
 else '  '
end VENT_MECANICA,*/
-----------------------------------------------------------------------------------------------------------------------
case when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_80971_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'CONFORME' 
when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_80970_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'NAO_CONFORME' 
else ''
end CABECEIRA_ELEVADA,
-----------------------------------------------------------------------------------------------------------------------
case when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81005_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'CONFORME' 
when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81026_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'NAO_CONFORME' 
else ''
end HIGIENE_ORAL,
-----------------------------------------------------------------------------------------------------------------------
case when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_80995_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'CONFORME' 
when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_80996_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'NAO_CONFORME' 
else ''
end PRESSAO_CUFF,
-----------------------------------------------------------------------------------------------------------------------
case when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81041_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'CONFORME' 
when
(select distinct dbms_lob.substr( b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+)  = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81042_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'NAO_CONFORME' 
else ''
end REDUCAO_SEDACAO,
-----------------------------------------------------------------------------------------------------------------------
case when
(select distinct dbms_lob.substr (b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+) = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento = a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81047_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'CONFORME' 
when
(select distinct dbms_lob.substr (b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+) = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento = a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81048_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'NAO_CONFORME' 
else ''
end VERIFIC_EXTUB,
-----------------------------------------------------------------------------------------------------------------------
case when
(select distinct dbms_lob.substr (b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+) = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81067_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'CONFORME' 
when
(select distinct dbms_lob.substr (b.lo_valor, 500) resultado
 from dbamv.editor_campo ec, dbamv.editor_registro_campo b, dbamv.pw_editor_clinico c, dbamv.pw_documento_clinico d
 where ec.cd_campo (+) = b.cd_campo 
 and  b.cd_registro = c.cd_editor_registro 
 and  d.cd_documento_clinico (+) = c.cd_documento_clinico
 and  d.cd_atendimento =  a.cd_atendimento
 and  c.cd_documento = '569'
 and  ec.ds_identificador = 'Metadado_P_81068_1'
 and  d.tp_status = 'FECHADO'
 and  dbms_lob.substr( b.lo_valor, 500) = 'true'
 and rownum = 1) = 'true' then 'NAO_CONFORME' 
else ''
end CHECAGEM_CIRC_VM
-----------------------------------------------------------------------------------------------------------------------
from vdic_pw_resposta_documento v,
     dbamv.atendime a, 
     dbamv.paciente p, 
     dbamv.prestador med

where v.cd_documento = 569
and v.ds_unidade_internacao is not null
and a.cd_paciente = p.cd_paciente
and v.cd_atendimento = a.cd_atendimento
and a.cd_multi_empresa = '3'
and trunc (v.dh_criacao) between '01.01.2021' and '31.01.2021'
and v.cd_prestador_criou = med.cd_prestador

/*and (select distinct dbms_lob.substr (b.lo_valor,1) resultado
 from dbamv.editor_campo ec, 
 dbamv.editor_registro_campo b, 
 dbamv.pw_editor_clinico c, 
 dbamv.pw_documento_clinico d
    where ec.cd_campo (+) = b.cd_campo 
    and b.cd_registro = c.cd_editor_registro 
    and d.cd_documento_clinico (+) = c.cd_documento_clinico
    and d.cd_atendimento = a.cd_atendimento
    and c.cd_documento = '569'
    and ec.ds_identificador = 'Metadado_P_69196_1'
    and d.tp_status = 'FECHADO'
    and rownum = 1) = '1'*/

order by v.cd_atendimento;
