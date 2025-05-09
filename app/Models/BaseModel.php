<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as EloquentModel;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Dcat\Admin\Traits\HasDateTimeFormatter;

class BaseModel extends EloquentModel
{
    use HasFactory, SoftDeletes, HasDateTimeFormatter;

    // 显示 / 隐藏
    const IS_SHOW = [
        '隐藏',
        '显示',
    ];
}
