<?php

namespace App\Models;

use App\Models\Site;
use Dcat\Admin\Traits\ModelTree;
use Spatie\EloquentSortable\Sortable;

class Category extends BaseModel implements Sortable
{
    use ModelTree {
        allNodes as treeAllNodes;
        ModelTree::boot as treeBoot;
    }

    protected $table = 'pro_categories';

    protected $fillable = [
        'parent_id',
        'title',
        'sort',
        'is_show',
    ];

    public function children()
    {
        return $this->hasMany(static::class, 'parent_id');
    }

    public function sites()
    {
        return $this->hasMany(Site::class);
    }
}
