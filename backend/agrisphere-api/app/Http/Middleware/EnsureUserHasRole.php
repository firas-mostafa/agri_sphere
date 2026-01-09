<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class EnsureUserHasRole
{
    public function handle(Request $request, Closure $next, string $role)
    {
        $user = $request->user();

        if (!$user) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        $hasRole = $user->roles()->where('name', $role)->exists();

        if (!$hasRole) {
            return response()->json(['message' => 'Forbidden.'], 403);
        }

        return $next($request);
    }
}
