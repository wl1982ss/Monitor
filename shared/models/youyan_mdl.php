<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
/**
 * DiliCMS
 *
 * 一款基于并面向CodeIgniter开发者的开源轻型后端内容管理系统.
 *
 * @package     DiliCMS
 * @author      DiliCMS Team
 * @copyright   Copyright (c) 2011 - 2012, DiliCMS Team.
 * @license     http://www.dilicms.com/license
 * @link        http://www.dilicms.com
 * @since       Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * DiliCMS 用户操作模型
 *
 * @package     DiliCMS
 * @subpackage  Models
 * @category    Models
 * @author      Jeongee
 * @link        http://www.dilicms.com
 */
class Youyan_mdl extends CI_Model
{
	
	/**
     * 构造函数
     *
     * @access  public
     * @return  void
     */
	public function __construct()
	{
		parent::__construct();	
	}
	
	// ------------------------------------------------------------------------

    /**
     * 根据用户名或者用户UID称获取该用户完整的信息
     *
     * @access  public
     * @param   mixed
     * @return  object
     */
	public function get_full_youyan_by_name($name = '', $type = 'name')
	{
		$table_youyan = $this->db->dbprefix('youyan');
		//$table_roles = $this->db->dbprefix('roles');
		if ($type == 'id')
		{
			$this->db->where($table_youyan . '.id', $name);
		}
		else
		{
			$this->db->where($table_youyan . '.name', $name);
		}
		return $this->db->select("$table_youyan.id, $table_youyan.name, $table_youyan.MN, $table_youyan.datetime")
							  ->from($table_youyan)
							  ->get()
							  ->row();
	}
	
	// ------------------------------------------------------------------------

    /**
     * 根据ID获取油烟设备信息
     *
     * @access  public
     * @param   int
     * @return  object
     */
	public function get_youyan_by_id($id = 0)
	{
		return $this->db->where('id', $id)->get($this->db->dbprefix('youyan'))->row();
	}

	// ------------------------------------------------------------------------

    /**
     * 根据名称获取油烟设备信息
     *
     * @access  public
     * @param   string
     * @return  object
     */
	public function get_youyan_by_name($name)
	{
		return $this->db->where('name', $name)->get($this->db->dbprefix('youyan'))->row();
	}
	
	
	// ------------------------------------------------------------------------

    /**
     * 获取油烟设备数
     *
     * @access  public
     * @param   int
     * @return  int
     */
	public function get_youyan_num()
	{
		$this->db->where('id <>', 1);
		
		return $this->db->count_all_results($this->db->dbprefix('youyan'));
	}

	// ------------------------------------------------------------------------

    /**
     * 获取所有油烟设备
     *
     * @access  public
     * @param   int
     * @param   int
     * @param   int
     * @return  object
     */
	public function get_youyans($role_id = 0, $limit = 0, $offset = 0)
	{
		$table_youyan = $this->db->dbprefix('youyan');
		
		$this->db->where("$table_youyan.id <>", 1);
		
		if ($limit)
		{
			$this->db->limit($limit);
		}
		if ($offset)
		{
			$this->db->offset($offset);
		}
		return $this->db->from($table_youyan)
						->get()
						->result();
	}
	
	// ------------------------------------------------------------------------

    /**
     * 添加油烟设备
     *
     * @access  public
     * @param   array
     * @return  bool
     */
	public function add_youyan($data)
	{
		$data['salt'] = substr(sha1(time()), -10);
		$data['password'] = sha1($data['password'].$data['salt']);
		return $this->db->insert($this->db->dbprefix('youyan'), $data);
	}
	
	// ------------------------------------------------------------------------

    /**
     * 修改油烟设备
     *
     * @access  public
     * @param   int
     * @param   array
     * @return  bool
     */
	public function edit_youyan($id, $data)
	{
		if (isset($data['password']))
		{
			$data['salt'] = substr(sha1(time()), -10);
			$data['password'] = sha1($data['password'].$data['salt']);
		}
		return $this->db->where('id', $id)->update($this->db->dbprefix('youyan'), $data);	
	}
	
	// ------------------------------------------------------------------------

    /**
     * 删除用户
     *
     * @access  public
     * @param   uid
     * @return  bool
     */
	public function del_youyan($id)
	{
		return $this->db->where('id', $id)->delete($this->db->dbprefix('youyan'));
	}

	// ------------------------------------------------------------------------
	
}

/* End of file youyan_mdl.php */
/* Location: ./shared/models/youyan_mdl.php */