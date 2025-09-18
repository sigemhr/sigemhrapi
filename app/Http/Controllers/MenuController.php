<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Modulo;
use App\Models\Submodulo;
use App\Models\SubSubmodulo;

class MenuController extends Controller
{
    /**
     * Obtener el menú para el usuario autenticado
     */
    public function getMenu()
    {
        $idUsuario = auth()->user()->id_usuario;
        
        // Obtener módulos con permiso de acceso
        $modulos = DB::table('vista_permisos_usuario')
            ->select('id_modulo', 'nombre_modulo as nombre', 'icono_modulo as icono', 'orden_modulo as orden')
            ->where('id_usuario', $idUsuario)
            ->where('nombre_permiso', 'acceso')
            ->whereNotNull('id_modulo')
            ->whereNull('id_submodulo')
            ->distinct()
            ->orderBy('orden')
            ->get();
            
        // Obtener submódulos con permiso de acceso
        $submodulos = DB::table('vista_permisos_usuario')
            ->select('id_submodulo', 'id_modulo', 'nombre_submodulo as nombre', 'icono_submodulo as icono', 'orden_submodulo as orden')
            ->where('id_usuario', $idUsuario)
            ->where('nombre_permiso', 'acceso')
            ->whereNotNull('id_submodulo')
            ->whereNull('id_sub_submodulo')
            ->distinct()
            ->orderBy('orden')
            ->get();
            
        // Obtener sub-submódulos con permiso de acceso
        $subSubmodulos = DB::table('vista_permisos_usuario')
            ->select('id_sub_submodulo', 'id_submodulo', 'nombre_sub_submodulo as nombre', 'icono_sub_submodulo as icono', 'ruta_sub_submodulo as ruta', 'orden_sub_submodulo as orden')
            ->where('id_usuario', $idUsuario)
            ->where('nombre_permiso', 'acceso')
            ->whereNotNull('id_sub_submodulo')
            ->distinct()
            ->orderBy('orden')
            ->get();
            
        // Estructurar el menú jerárquicamente
        $menu = [];
        
        foreach ($modulos as $modulo) {
            $moduloData = [
                'id' => $modulo->id_modulo,
                'nombre' => $modulo->nombre,
                'icono' => $modulo->icono,
                'submódulos' => []
            ];
            
            // Agregar submódulos que pertenecen a este módulo
            foreach ($submodulos as $submodulo) {
                if ($submodulo->id_modulo == $modulo->id_modulo) {
                    $submoduloData = [
                        'id' => $submodulo->id_submodulo,
                        'nombre' => $submodulo->nombre,
                        'icono' => $submodulo->icono,
                        'sub_submódulos' => []
                    ];
                    
                    // Agregar sub-submódulos que pertenecen a este submódulo
                    foreach ($subSubmodulos as $subSubmodulo) {
                        if ($subSubmodulo->id_submodulo == $submodulo->id_submodulo) {
                            $submoduloData['sub_submódulos'][] = [
                                'id' => $subSubmodulo->id_sub_submodulo,
                                'nombre' => $subSubmodulo->nombre,
                                'icono' => $subSubmodulo->icono,
                                'ruta' => $subSubmodulo->ruta
                            ];
                        }
                    }
                    
                    $moduloData['submódulos'][] = $submoduloData;
                }
            }
            
            $menu[] = $moduloData;
        }
        
        return response()->json(['menu' => $menu]);
    }
    
    /**
     * Verificar si el usuario tiene un permiso específico
     */
    public function verificarPermiso(Request $request)
    {
        $request->validate([
            'tipo_elemento' => 'required|string|in:modulo,submodulo,sub_submodulo',
            'id_elemento' => 'required|integer',
            'tipo_permiso' => 'required|string|in:acceso,lectura,escritura'
        ]);
        
        $usuario = auth()->user();
        $tienePermiso = false;
        
        switch ($request->tipo_elemento) {
            case 'modulo':
                $tienePermiso = $usuario->tienePermisoModulo($request->id_elemento, $request->tipo_permiso);
                break;
            case 'submodulo':
                $tienePermiso = $usuario->tienePermisoSubmodulo($request->id_elemento, $request->tipo_permiso);
                break;
            case 'sub_submodulo':
                $tienePermiso = $usuario->tienePermisoSubSubmodulo($request->id_elemento, $request->tipo_permiso);
                break;
        }
        
        return response()->json(['tiene_permiso' => $tienePermiso]);
    }

    
}
