--
-- secuencia para demostraciones
--

-- 1) coloca la data por defecto
call pa_ADMIN_setDefaultData();

-- 2) abre el proceso demo
call pa_ADMIN_abrirProcesoDemo();

-- 3) cierra el proceso demo
call pa_ADMIN_cerrarProcesoDemo();

-- 4) crear votos ficticios
call pa_ADMIN_crearVotos();

-- muestra los log de usuario (opcional)
call pa_ADMIN_verUsuarioLog();
