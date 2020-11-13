<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $connection = '';
    protected $table = "ams_login";
    protected $fillable = [
        'UserId', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    public function __construct($conn=null, $request=null)
    {
        $this->connection = 'mysql';
    }
    // OVERRIDE THE PASSWORD FIELD
    public function getAuthPassword()
    {
        return $this->password;
    }
    
}
