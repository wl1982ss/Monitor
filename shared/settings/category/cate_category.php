<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['cate_models']['category']=array (
  'id' => '1',
  'name' => 'category',
  'description' => '文章分类',
  'perpage' => '6',
  'level' => '1',
  'hasattach' => '0',
  'built_in' => '0',
  'auto_update' => '0',
  'thumb_preferences' => NULL,
  'fields' => 
  array (
    1 => 
    array (
      'id' => '1',
      'name' => 'category_name',
      'description' => '分类名',
      'model' => '1',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '1',
  ),
  'searchable' => 
  array (
    0 => '1',
  ),
);