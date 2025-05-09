<?php

use Dcat\Admin\Admin;
use Dcat\Admin\Grid;
use Dcat\Admin\Form;
use Dcat\Admin\Grid\Filter;
use Dcat\Admin\Show;

/**
 * Dcat-admin - admin builder based on Laravel.
 * @author jqh <https://github.com/jqhph>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 *
 * extend custom field:
 * Dcat\Admin\Form::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Column::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Filter::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

admin_setting();

// 表格初始化
Grid::resolving(function (Grid $grid) {
    // 禁用详情按钮
    $grid->disableViewButton();
    // 禁用删除按钮
    $grid->disableDeleteButton();
    // 禁用行选择器，小方框
    $grid->disableRowSelector();
});


// 表单初始化
Form::resolving(function (Form $form) {
    $form->disableEditingCheck();
    $form->disableCreatingCheck();
    $form->disableViewCheck();

    $form->tools(function (Form\Tools $tools) {
        // 去掉跳转详情页按钮
        $tools->disableView();
        // 去掉删除按钮
        $tools->disableDelete();
    });
});
