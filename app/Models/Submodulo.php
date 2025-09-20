<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Submodulo extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_submodulo';
    protected $fillable = ['id_modulo', 'nombre', 'descripcion', 'icono', 'orden', 'activo'];

    public function modulo()
    {
        return $this->belongsTo(Modulo::class, 'id_modulo');
    }

    public function subSubmodulos()
    {
        return $this->hasMany(SubSubmodulo::class, 'id_submodulo');
    }

    public function roles()
    {
        return $this->belongsToMany(Rol::class, 'permisos_submodulo', 'id_submodulo', 'id_rol')
            ->withPivot('id_tipo_permiso')
            ->withTimestamp('fecha_asignacion');
    }
}
