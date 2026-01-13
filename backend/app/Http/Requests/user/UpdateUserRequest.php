<?php

namespace App\Http\Requests\user;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        // dd($this->route('id'));
        return [
            'username' => 'required|string',
            'email' => "required|email|unique:users,email,". $this->route('id').',user_id',
            'password' => "sometimes|required|same:password_confirmation|min:6", // 'password' => 'sometimes|required|confirmed|min:6',
            'password_confirmation' => "sometimes|required",
            'first_name' => 'nullable|string',
            'last_name' => 'nullable|string',
            'phone_number' => 'nullable|string|max:20',
        ];
    }
}
