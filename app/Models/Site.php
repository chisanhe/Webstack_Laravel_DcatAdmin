<?php

namespace App\Models;


use App\Models\Category;

class Site extends BaseModel
{
    protected $table = 'pro_sites';

    protected $fillable = [
        'category_id',
        'title',
        'thumb',
        'describe',
        'url',
        'status_code',
        'is_show',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
