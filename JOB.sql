USE msdb;
GO

EXEC sp_add_job
    @job_name = N'Job_Consolidado_Kardex',
    @enabled = 1,
    @description = N'Ejecuta el consolidado cada 4 horas entre 06:00 y 22:00';
GO

EXEC sp_add_jobstep
    @job_name = N'Job_Consolidado_Kardex',
    @step_name = N'Ejecutar SP',
    @subsystem = N'TSQL',
    @database_name = N'CONSOLIDADO_KARDEX',
    @command = N'EXEC dbo.SP_CONSOLIDADO_KARDEX;',
    @retry_attempts = 1,
    @retry_interval = 5;
GO

EXEC sp_add_schedule
    @schedule_name = N'Cada_4_horas_6_a_22',
    @freq_type = 4,               -- Diario
    @freq_interval = 1,           -- Cada día
    @freq_subday_type = 8,        -- Horas
    @freq_subday_interval = 4,    -- Cada 4 horas
    @active_start_time = 060000,  -- Desde 06:00
    @active_end_time = 220000;    -- Hasta 22:00
GO

-- 4. Asociar schedule al job
EXEC sp_attach_schedule
    @job_name = N'Job_Consolidado_Kardex',
    @schedule_name = N'Cada_4_horas_6_a_22';
GO

EXEC sp_add_jobserver
    @job_name = N'Job_Consolidado_Kardex';
GO
