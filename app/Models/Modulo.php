<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Modulo extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_modulo';
    protected $fillable = ['nombre', 'descripcion', 'icono', 'orden', 'activo'];

    public function submodulos()
    {
        return $this->hasMany(Submodulo::class, 'id_modulo');
    }

    public function roles()
    {
        return $this->belongsToMany(Rol::class, 'permisos_modulo', 'id_modulo', 'id_rol')
            ->withPivot('id_tipo_permiso')
            ->withTimestamp('fecha_asignacion');
    }
}
