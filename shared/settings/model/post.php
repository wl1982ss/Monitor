<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['post']=array (
  'id' => '1',
  'name' => 'post',
  'description' => '文章',
  'perpage' => '10',
  'hasattach' => '0',
  'built_in' => '0',
  'thumb_preferences' => NULL,
  'fields' => 
  array (
    1 => 
    array (
      'id' => '1',
      'name' => 'post_title',
      'description' => '标题',
      'model' => '1',
      'type' => 'input',
      'length' => '30',
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
    2 => 
    array (
      'id' => '2',
      'name' => 'post_category',
      'description' => '分类',
      'model' => '1',
      'type' => 'select_from_model',
      'length' => '10',
      'values' => 'category|category_name',
      'width' => '20',
      'height' => '20',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
    3 => 
    array (
      'id' => '3',
      'name' => 'post_content',
      'description' => '内容',
      'model' => '1',
      'type' => 'wysiwyg',
      'length' => '1000',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '0',
      'order' => '3',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '1',
    1 => '2',
  ),
  'searchable' => 
  array (
    0 => '1',
    1 => '2',
    2 => '3',
  ),
);