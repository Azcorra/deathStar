<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class StoreUsuarioRequest extends FormRequest
{
    /**
     * Determinar si el usuario está autorizado para realizar esta solicitud.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Reglas de validación aplicadas en la solicitud.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'Aprendiz'      => 'required|boolean',
            'ColorSable'    => 'required|string',
            'EstiloBatalla' => 'required|numeric',
            'Nombre'        => 'required|string|max:255',
        ];
    }

    /**
     * Mensajes personalizados.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'Aprendiz.boolean'          => 'El campo :attribute debe tener un valor verdadero o falso.',
            'Aprendiz.required'         => 'El campo :attribute es obligatorio.',
            'ColorSable.required'       => 'El campo :attribute es obligatorio.',
            'ColorSable.string'         => 'El campo :attribute debe ser una cadena de caracteres.',
            'EstiloBatalla.numeric'     => 'El campo :attribute debe ser numérico.',
            'EstiloBatalla.required'    => 'El campo :attribute es obligatorio.',
            'Nombre.required'           => 'El campo :attribute es obligatorio.',
            'Nombre.string'             => 'El campo :attribute debe ser una cadena de caracteres.',
        ];
    }

    /**
     * Atributos personalizados.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            'Aprendiz'      => 'aprendiz',
            'ColorSable'    => 'color de sable',
            'EstiloBatalla' => 'estilo de batalla',
            'Nombre'        => 'nombre',
        ];
    }

    public function failedValidation(Validator $validator)
    {
        $response = [
            'errors' => $validator->errors(),
            'message' => 'Existen campos obligatorios.',
            'status' => false,
        ];

        throw new HttpResponseException(response()->json($response, Response::HTTP_UNPROCESSABLE_ENTITY));
    }
}
