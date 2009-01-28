--
-- secuencia para demostraciones
--

-- 1) coloca la data por defecto
call pa_ADMIN_setDefaultData();

-- 2) abre el proceso demo
call pa_ADMIN_abrirProcesoDemo();

-- 3) cierra el proceso demo
call pa_ADMIN_cerrarProcesoDemo();

-- muestra los log de usuario (opcional)
call pa_ADMIN_verUsuarioLog();
