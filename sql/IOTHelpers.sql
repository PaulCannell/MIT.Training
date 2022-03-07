use iot
go

-- to lookup a pulse counter
select * from pulseCounter where pulseSerialNo='003C58F0' -- id is 4428
-- to lookup the last packet date
select * from pulsecounterdetail where serialNo='003C58F0' -- 