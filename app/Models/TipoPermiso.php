<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoPermiso extends Model
{
    use HasFactory;

    protected $table = 'tipos_permiso';
    protected $primaryKey = 'id_tipo_permiso';
    public $timestamps = false;
    protected $fillable = ['nombre', 'descripcion'];
}
