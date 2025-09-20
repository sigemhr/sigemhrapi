<?php

namespace App\Http\Controllers;

use App\Models\DatosPersonales;
use App\Models\Modulo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DatosPersonalesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return response()->json(DatosPersonales::with(['datosEducativos', 'datosProfesionales', 'documentacion'])->paginate(10));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Log::info($request);
        $datos = DatosPersonales::create($request->datosPersonales);
        return response()->json($datos, 201);
    }

    public function personalwithOutUser()
    {
        $datos = DatosPersonales::sinUsuario()->get();
       $modulos = Modulo::with('submodulos.subsubmodulos')->get();
        
        return response()->json(['status' => true, 'data'=>$datos,'modulos'=>$modulos ],200);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        return response()->json(DatosPersonales::with(['datosEducativos', 'datosProfesionales', 'documentacion'])->findOrFail($id));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(DatosPersonales $datosPersonales)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $datos = DatosPersonales::findOrFail($id);
        $datos->update($request->all());
        return response()->json($datos);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        DatosPersonales::destroy($id);
        return response()->json(null, 204);
    }
}
