<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use App\Http\Requests\StoreUsuarioRequest;
use App\Http\Requests\UpdateUsuarioRequest;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UsuarioController extends Controller
{
    /**
     * Método para mostrar la lista de usuarios.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $usuarios = Usuario::all();

        $response = [
            'data'      => $usuarios,
            'message'   => 'Usuarios obtenidos de manera exitosa.',
            'status'    => true
        ];

        return response()->json($response, Response::HTTP_OK);
    }

    /**
     * Método para crear usuarios.
     *
     * @param  \App\Http\Requests\StoreUsuarioRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUsuarioRequest $request)
    {
        // Guardar usuario
        $usuario = Usuario::create([
            'Aprendiz'      => $request->get('Aprendiz'),
            'ColorSable'    => $request->get('ColorSable'),
            'EstiloBatalla' => $request->get('EstiloBatalla'),
            'Nombre'        => $request->get('Nombre')
        ]);

        $response = [
            'data'          => $usuario,
            'message'       => 'Usuario creado de manera exitosa',
            'status'        => true,
        ];

        return response()->json($response, Response::HTTP_CREATED);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function show(Usuario $usuario)
    {
        //
    }

    /**
     * Método para actualizar usuario.
     *
     * @param  \App\Http\Requests\UpdateUsuarioRequest  $request
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUsuarioRequest $request)
    {
        try {
            $usuario = Usuario::findOrFail($request->get('Usuario'));
        } catch (ModelNotFoundException $exception) {
            $response = [
                'message'   => 'No se encontro el usuario ' . $request->get('Usuario'),
                'status'    => false,
            ];

            return response()->json($response, Response::HTTP_NOT_FOUND);
        }

        $usuario->Aprendiz      = $request->get('Aprendiz');
        $usuario->ColorSable    = $request->get('ColorSable');
        $usuario->EstiloBatalla = $request->get('EstiloBatalla');
        $usuario->Nombre        = $request->get('Nombre');
        $usuario->save();

        $response = [
            'data'      => $usuario,
            'message'   => 'Usuario actualizado de manera exitosa',
            'status'    => true,
        ];

        return response()->json($response, Response::HTTP_OK);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Usuario  $usuario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        try {
            $usuario = Usuario::findOrFail($request->usuario)->delete();
            // dd($usuario);
            // $usuario::delete();

            $response = [
                'message'   => 'Usuario eliminado de manera exitosa',
                'status'    => true,
            ];

            return response()->json($response, Response::HTTP_OK);
        } catch (ModelNotFoundException $exception) {
            $response = [
                'message'   => 'No se encontro el usuario ' . $request->get('Usuario'),
                'status'    => false,
            ];

            return response()->json($response, Response::HTTP_NOT_FOUND);
        }
    }
}
