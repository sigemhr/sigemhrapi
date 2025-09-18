<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SubSubmodulo extends Model
{
    use HasFactory;

    protected $table = 'sub_submodulos';
    protected $primaryKey = 'id_sub_submodulo';
    protected $fillable = ['id_submodulo', 'nombre', 'descripcion', 'icono', 'ruta', 'orden', 'activo'];

    public function submodulo()
    {
        return $this->belongsTo(Submodulo::class, 'id_submodulo');
    }

    public function roles()
    {
        return $this->belongsToMany(Rol::class, 'permisos_sub_submodulo', 'id_sub_submodulo', 'id_rol')
            ->withPivot('id_tipo_permiso')
            ->withTimestamp('fecha_asignacion');
    }
}
