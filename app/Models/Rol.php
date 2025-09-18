<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Rol extends Model
{
    use HasFactory;

    protected $table = 'roles';
    protected $primaryKey = 'id_rol';
    protected $fillable = ['nombre', 'descripcion'];

    public function usuarios()
    {
        return $this->belongsToMany(User::class, 'usuario_roles', 'id_rol', 'id')
            ->withTimestamp('fecha_asignacion');
    }

    public function modulos()
    {
        return $this->belongsToMany(Modulo::class, 'permisos_modulo', 'id_rol', 'id_modulo')
            ->withPivot('id_tipo_permiso')
            ->withTimestamp('fecha_asignacion');
    }

    public function submodulos()
    {
        return $this->belongsToMany(Submodulo::class, 'permisos_submodulo', 'id_rol', 'id_submodulo')
            ->withPivot('id_tipo_permiso')
            ->withTimestamp('fecha_asignacion');
    }

    public function subSubmodulos()
    {
        return $this->belongsToMany(SubSubmodulo::class, 'permisos_sub_submodulo', 'id_rol', 'id_sub_submodulo')
            ->withPivot('id_tipo_permiso')
            ->withTimestamp('fecha_asignacion');
    }
}
