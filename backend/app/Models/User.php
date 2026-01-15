<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable ,HasRoles;

    protected $primaryKey = 'user_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'username',
        'email',
        'password',
        'first_name',
        'last_name',
        'phone_number',
        'image',
    ];

    protected $appends = ['image_url'];

    public function getImageUrlAttribute()
    {
        if ( $this->image == "" ) {
            return "";
        }

        return asset('/uploads/users/small/'.$this->image);
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function addresses() : HasMany
    {//                                       foreign key  local key
        return $this->hasMany(Address::class, 'user_id', 'user_id');
    }

    public function reviews() : HasMany
    {//                                      foreign key   local key
        return $this->hasMany(Review::class, 'user_id', 'user_id');
    }

    public function orders() : HasMany
    {//                                    foreign key  local key
        return $this->hasMany(Order::class, 'user_id', 'user_id');
    }

    public function relatedUserProducts() : HasMany
    {//                                                 foreign key  local key
        return $this->hasMany(ManagementUserProduct::class, 'user_id', 'user_id');
    }

    public function userImages() : HasMany
    {//                                         foreign key  local key
        return $this->hasMany(UserImage::class, 'user_id', 'user_id');
    }
}
