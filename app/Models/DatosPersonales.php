<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class DatosPersonales extends Model
{
    use HasFactory;
    protected $table = 'datos_personales';
    protected $fillable = [
        'nombre',
        'apellidos',
        'fecha_nacimiento',
        'genero',
        'estado_civil',
        'nacionalidad',
        'lugar_nacimiento',
        'direccion',
        'ciudad',
        'codigo_postal',
        'telefono',
        'email',
        'email_company',
        'codigo_empleado',
        'puesto',
        'departamento',
        'ingreso',
        'status',
        'rfc',
        'nss',
        'curp',
        'ine',
        'licencia',
        'num_tarjeta_banco',
        'num_tarjeta_banco_two',
        'alergias',
        'condiciones_medicas',
        'tipo_sangre',
        'phone_contacto',
        'persona_contacto',
        'parentesco_contacto',
        'talla_uniforme',
        'img',
        'comentarios'
    ];
    public function datosEducativos()
    {
        return $this->hasMany(DatosEducativos::class, 'id_persona');
    }

    public function datosProfesionales()
    {
        return $this->hasMany(DatosProfesionales::class, 'id_persona');
    }

    public function documentacion()
    {
        return $this->hasMany(Documentacion::class, 'id_persona');
    }
    
    public function scopeSinUsuario($query)
    {
        return $query->leftJoin('users', 'datos_personales.email', '=', 'users.email')
                     ->whereNull('users.email')
                     ->select('datos_personales.*');
    }
}

class DatosEducativos extends Model
{
    use HasFactory;
    protected $table = 'datos_educativos';
    protected $fillable = ['id_persona', 'nivel_educativo', 'institucion', 'titulo', 'fecha_inicio', 'fecha_fin', 'promedio'];

    public function datosPersonales()
    {
        return $this->belongsTo(DatosPersonales::class, 'id_persona');
    }
}

class DatosProfesionales extends Model
{
    use HasFactory;
    protected $table = 'datos_profesionales';
    protected $fillable = ['id_persona', 'empresa', 'cargo', 'fecha_inicio', 'fecha_fin', 'descripcion', 'referencia', 'telefono_referencia'];

    public function datosPersonales()
    {
        return $this->belongsTo(DatosPersonales::class, 'id_persona');
    }
}

class Documentacion extends Model
{
    use HasFactory;
    protected $table = 'documentacion';
    protected $fillable = ['id_persona', 'tipo_documento', 'numero_documento', 'fecha_expedicion', 'fecha_vencimiento', 'archivo_adjunto'];

    public function datosPersonales()
    {
        return $this->belongsTo(DatosPersonales::class, 'id_persona');
    }
}