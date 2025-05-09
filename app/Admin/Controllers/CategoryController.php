<?php
namespace App\Admin\Controllers;

use App\Models\BaseModel;
use App\Models\Category;
use Dcat\Admin\Form;
use Dcat\Admin\Http\Controllers\AdminController;
use Dcat\Admin\Layout\Column;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;
use Dcat\Admin\Tree;
use Dcat\Admin\Widgets\Box;
use Dcat\Admin\Widgets\Form as WidgetForm;

/**
 * 分类管理
 */
class CategoryController extends AdminController
{

    public function index(Content $content)
    {
        return $content
            ->title(trans('category.labels.Category'))
            ->description(trans('admin.list'))
            ->body(function (Row $row) {
                $row->column(7, $this->treeView()->render());

                $row->column(5, function (Column $column) {
                    $form = new WidgetForm();
                    $form->action(admin_url('categories'));

                    $form->select('parent_id')->options(Category::selectOptions());
                    $form->select('is_show')->options(BaseModel::IS_SHOW)->value(1);
                    $form->text('title')->required();
                    $form->icon('icon')->required();
                    $form->hidden('_token')->default(csrf_token());

                    $form->width(9, 2);

                    $column->append(Box::make(trans('admin.new'), $form));
                });
            });
    }


    public function form()
    {
        $menuModel = Category::class;
        return Form::make($menuModel, function (Form $form) use ($menuModel) {
            $form->tools(function (Form\Tools $tools) {
                $tools->disableView();
            });

            $form->display('id', 'ID');

            $form->select('parent_id')->options(function () use ($menuModel) {
                return $menuModel::selectOptions();
            })->saving(function ($v) {
                return (int) $v;
            });
            $form->select('is_show')->options(BaseModel::IS_SHOW);
            $form->text('title')->required();
            $form->icon('icon')->required();
            $form->display('created_at', trans('admin.created_at'));
            $form->display('updated_at', trans('admin.updated_at'));
        })->saved(function (Form $form, $result) {
            $response = $form->response()->location('categories');
            if ($result) {
                return $response->success(__('admin.save_succeeded'));
            }
            return $response->info(__('admin.nothing_updated'));
        });
    }


    protected function treeView()
    {
        return new Tree(new Category(), function (Tree $tree) {
            $tree->disableCreateButton();
            $tree->disableQuickCreateButton();
            $tree->disableEditButton();
            $tree->disableDeleteButton();

            $tree->actions(function (Tree\Actions $actions) {
                if ($actions->getRow()->extension) {
                    $actions->disableDelete();
                }
            });

            $tree->branch(function ($branch) {
                $payload = "<i class='fa {$branch['icon']}'></i>&nbsp;<strong>{$branch['title']}</strong>";
                if (empty($branch['is_show'])) {
                    $payload .= '&nbsp;&nbsp;&nbsp;<span class="text-danger">[已隐藏]</span>';
                }
                return $payload;
            });
        });
    }
}
