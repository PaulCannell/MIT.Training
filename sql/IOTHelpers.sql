use iot
go

select* from pulseCounter where id > 40000
-- to lookup a pulse counter
select * from pulseCounter where pulseSerialNo='00C2D776' -- id is 40014
-- to lookup the last packet date
select * from pulsecounterdetail where serialNo='00C2D776' -- 

select * from sigfoxConsumption where pulseCounterId=40014 order by 1 desc

--333134.00
--select 79800.00 + 253334 - initaipulsecount*2 -- 333134.00

-- work order of the install / swap
select * from bcm..WorkOrder where serialNo='00C2D776' -- get the id
-- helper if you cant find it ni qurey 1
select * from bcm..getAllPivotData() where newSFSerial='00C2D776' or foundSFSerial='00C2D776'
-- as its an audit and install the info captured by the installer is in here.
select * from bcm..AuditsAndSigfoxInstall where WorkOrderId=38389
/*
select * from bcm..AuditsAndCompleteInstall where WorkOrderId=38389
select * from bcm..MeterSwap
select * from bcm..SFSwap
select * from bcm..SFAndMeterSwap
*/

exec auth..pr_loginuser 'paul', 'test1234', 6, 1

exec pr_MC_GetSigFoxConsumption 40014, '2022-01-01', '2022-01-31'

sp_helptext 'pr_MC_GetSigFoxConsumption'
/*
create   proc [dbo].[pr_MC_GetSigFoxConsumption] -- @pulseCounterId 1, '2019-12-01' ,'2019-12-31'       
 @pulseCounterId int,      
 @fromdate datetime,      
 @todate datetime      
as      
begin      
 select max(actuallitres)-min(actuallitres) as Consumption,DATEPART("DAY", sfDate) as "Day", DATEPART("MONTH", sfDate) as "Month", DATEPART("YEAR", sfDate) as "Year"        
 --select *       
 from sigfoxConsumption        
 where pulseCounterId=@pulseCounterId         
 and sfDate >= @fromdate      
 and sfDate <= @todate      
 group by DATEPART("DAY", sfDate), DATEPART("MONTH", sfDate), DATEPART("YEAR", sfDate)        
 order by DATEPART("YEAR", sfDate), DATEPART("MONTH", sfDate), DATEPART("DAY", sfDate)     
end 
*/

begin tran
update pulseCounter set serialNo='xxx' where id=1

select @@trancount
rollback