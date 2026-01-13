

declare @fecha1 date, @fecha2 date
set @fecha1 = '2025-12-01'
set @fecha2 = '2025-12-31'

select t0.CodigoArticulo, t0.CodigoGrupo, t0.GrupoArticulo, t0.Articulo
		, DT0.CostProm as Jockey, DT2.CostProm as Pardo
		, DT3.CostProm as Rosedal, DT4.CostProm as Puruchuco, DT5.CostProm as Canada
		, DT6.CostProm as 'P&A', DT7.CostProm as PN, DT8.CostProm as MDS
		, DT9.CostProm as CC, DT10.CostProm as Salaverry,DT11.CostProm as Fontana
		, DT12.CostProm as Arequipa/*, DT13.CostProm as SantaAnita*/
		, DT14.CostProm as Minka/*, DT15.CostProm as Bellavista*/
		, DT16.CostProm as Benavides, DT17.CostProm as Chilclayo
		/*, DT18.CostProm as JavierPrado*/, DT19.CostProm as SJL

from GERENCIAL.dbo.Peru_ArticulosKardex t0

--Jockey
left join
			(
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_JOCKEY_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT0 on DT0.Referencia = t0.EquivalenciaFR
--Pardo
left join
			(
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_PARDO_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT2 on DT2.Referencia = t0.EquivalenciaFR

--Rosedal
left join
			(
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_ROSEDAL_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT3 on DT3.Referencia = t0.EquivalenciaFR

--Puruchuco
left join
			(
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_PURUCHUCO_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT4 on DT4.Referencia = t0.EquivalenciaFR

--Canada
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_CANADA_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT5 on DT5.Referencia = t0.EquivalenciaFR

--P&A
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_PYA_PrecioCompras t0
			--where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT6 on DT6.Referencia = t0.EquivalenciaFR

--Plaza Norte
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_PLAZANORTE_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT7 on DT7.Referencia = t0.EquivalenciaFR

--Mall del sur
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_MDS_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT8 on DT8.Referencia = t0.EquivalenciaFR

--Centro Civico
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_CCIVICO_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT9 on DT9.Referencia = t0.EquivalenciaFR

--Salaverry
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_SALAVERRY_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT10 on DT10.Referencia = t0.EquivalenciaFR

--La Fontana
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_FONTANA_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT11 on DT11.Referencia = t0.EquivalenciaFR

--Arequipa
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_AREQUIPA_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT12 on DT12.Referencia = t0.EquivalenciaFR

--Minka
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_MINKA_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT14 on DT14.Referencia = t0.EquivalenciaFR

--Benavides
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_BENAVIDES_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT16 on DT16.Referencia = t0.EquivalenciaFR

--Chilclayo
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_CHILCLAYO_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT17 on DT17.Referencia = t0.EquivalenciaFR
--SJL
left join (
			select t0.REFERENCIA, avg(t0.CostProm) as CostProm
			from PERU_Frontrest.dbo.vw_SJL_PrecioCompras t0
			where cast(t0.FECHAALBARAN as date) between @fecha1 and @fecha2
			group by t0.REFERENCIA
			)DT19 on DT19.Referencia = t0.EquivalenciaFR

order by t0.Orden


SELECT * FROM InvetarioMEs