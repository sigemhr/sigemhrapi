<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'active',
    ];
    public function roles()
    {
        return $this->belongsToMany(Rol::class, 'usuario_roles', 'id', 'id_rol')
            ->withTimestamp('fecha_asignacion');
    }

    public function hasRol($rolNombre)
    {
        return $this->roles()->where('name', $rolNombre)->exists();
    }

    public function tienePermisoModulo($idModulo, $tipoPermiso)
    {
        $idTipoPermiso = TipoPermiso::where('nombre', $tipoPermiso)->value('id_tipo_permiso');
        
        return DB::table('users as u')
            ->join('usuario_roles as ur', 'u.id', '=', 'ur.id_usuario')
            ->join('permisos_modulo as pm', 'ur.id_rol', '=', 'pm.id_rol')
            ->where('u.id', $this->id_usuario)
            ->where('pm.id_modulo', $idModulo)
            ->where('pm.id_tipo_permiso', $idTipoPermiso)
            ->exists();
    }

    public function tienePermisoSubmodulo($idSubmodulo, $tipoPermiso)
    {
        $idTipoPermiso = TipoPermiso::where('nombre', $tipoPermiso)->value('id_tipo_permiso');
        
        return DB::table('users as u')
            ->join('usuario_roles as ur', 'u.id', '=', 'ur.id_usuario')
            ->join('permisos_submodulo as ps', 'ur.id_rol', '=', 'ps.id_rol')
            ->where('u.id', $this->id_usuario)
            ->where('ps.id_submodulo', $idSubmodulo)
            ->where('ps.id_tipo_permiso', $idTipoPermiso)
            ->exists();
    }

    public function tienePermisoSubSubmodulo($idSubSubmodulo, $tipoPermiso)
    {
        $idTipoPermiso = TipoPermiso::where('nombre', $tipoPermiso)->value('id_tipo_permiso');
        
        return DB::table('users as u')
            ->join('usuario_roles as ur', 'u.id', '=', 'ur.id_usuario')
            ->join('permisos_sub_submodulo as pss', 'ur.id_rol', '=', 'pss.id_rol')
            ->where('u.id', $this->id_usuario)
            ->where('pss.id_sub_submodulo', $idSubSubmodulo)
            ->where('pss.id_tipo_permiso', $idTipoPermiso)
            ->exists();
    }
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    // protected $cast = [
    //     'email_verified_at' => 'datetime',
    //     'password' => 'hashed',
    //     'active' => 'boolean',
    // ];
}