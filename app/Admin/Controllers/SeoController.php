<?php

namespace App\Admin\Controllers;

use App\Models\BaseModel;
use App\Models\Seo;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

/**
 * 前端首页 SEO设置
 */
class SeoController extends AdminController
{
    protected function grid()
    {
        return Grid::make(new Seo(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title')->limit(10);
            $grid->column('logo')->image('/uploads/', 40, 40);
            $grid->column('og_title')->limit(10);
            $grid->column('keywords')->limit(20);
            $grid->column('description')->limit(20);
            $grid->column('site_name')->limit(20);
            $grid->column('banner_img')->image('/uploads/', 40, 40);
            $grid->column('is_show')->using(BaseModel::IS_SHOW)->sortable()->help('前端显示条件：新且显示的1条');
            $grid->column('created_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });
        });
    }

    protected function form()
    {
        return Form::make(new Seo(), function (Form $form) {
            $form->display('id');
            $form->select('is_show')->options(BaseModel::IS_SHOW)->value(1)->help('前台获取1条显示的数据');

            $form->text('title')->required();

            $form->image('banner_img', '图标')
                ->autoUpload()
                ->uniqueName()
                ->disk('admin')
                ->help('前台页面：property="og:image"内容');

            $form->image('logo', '网页logo')
                ->autoUpload()
                ->uniqueName()
                ->disk('admin')->help('首页左上角logo');

            $form->text('og_title')->required()->help('前台页面：property="og:title" 内容');
            $form->text('keywords')->required();
            $form->text('description')->required();
            $form->text('site_name')->required()->help('前台页面：property="og:site_name" 内容');
            $form->textarea('baidu_tj');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
