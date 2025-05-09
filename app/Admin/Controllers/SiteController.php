<?php

namespace App\Admin\Controllers;

use App\Models\BaseModel;
use App\Models\Category;
use App\Models\Site;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;

class SiteController extends AdminController
{

    protected function grid()
    {
        return Grid::make(Site::with('category'), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('category.title', '分类')->sortable();
            $grid->column('title')->limit(10);
            $grid->column('pv')->sortable();
            $grid->column('thumb')->image('/uploads/', 40, 40);
            $grid->column('describe')->limit(15);
            $grid->column('url')->link();
            $grid->column('status_code')->sortable();
            $grid->column('is_show')->using(BaseModel::IS_SHOW)->sortable();
            $grid->column('created_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->panel();

                $filter->equal('category_id')->select(Category::selectOptions())->width(3);
                $filter->like('title')->width(3);
                $filter->like('url')->width(3);
                $filter->equal('status_code')->width(3);
                $filter->equal('is_show')->select(BaseModel::IS_SHOW)->width(3);
            });
        });
    }

    protected function form()
    {
        return Form::make(new Site(), function (Form $form) {
            $form->display('id');

            $form->select('is_show')->options(BaseModel::IS_SHOW)->value(1);

            $form->select('category_id', '分类')
                ->options(Category::selectOptions())
                ->required();

            $form->text('title') ->rules('required|max:50')->required();

            $form->image('thumb', '图标')
                ->crop(120, 120)
                ->autoUpload()
                ->uniqueName()
                ->disk('admin');

            $form->text('describe')->rules('required|max:300')->required();

            $form->text('url')->rules('required|url|max:500')->required();

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
