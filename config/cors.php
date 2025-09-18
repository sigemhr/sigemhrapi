<?php
return [
    'paths' => ['api/*'], // Rutas que permitirán solicitudes CORS
    'allowed_methods' => ['*'], // Métodos HTTP permitidos (GET, POST, etc.)
    'allowed_origins' => ['*'], // Orígenes permitidos ('*' para todos)
    'allowed_origins_patterns' => [],
    'allowed_headers' => ['*'], // Encabezados permitidos
    'exposed_headers' => [],
    'max_age' => 0,
    'supports_credentials' => false, // Cambiar a true si se requieren credenciales
];
