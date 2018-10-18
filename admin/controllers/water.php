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
 * DiliCMS 系统相关控制器
 *
 * @package     DiliCMS
 * @subpackage  Controllers
 * @category    Controllers
 * @author      Jeongee
 * @link        http://www.dilicms.com
 */
class Water extends Admin_Controller
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
     * 油烟监测数据
     *
     * @access  public
     * @return  void
     */
	public function index()
	{
		$offset = $this->input->get('page', TRUE) ? $this->input->get('page', TRUE) : 0; 
		$data['list'] = $this->user_mdl->get_users($role, 15, $offset);
		
		//加载分页
		$this->load->library('pagination');
		$config['base_url'] = backend_url('user/view') . '?dilicms';
		$config['per_page'] = 15;
		$config['page_query_string'] = TRUE;
		$config['query_string_segment'] = 'page';
		$config['total_rows'] = $this->user_mdl->get_users_num($role);
		$this->pagination->initialize($config);
		$data['pagination'] = $this->pagination->create_links();
		$this->_template('water_list', $data);
	}
	
	// ------------------------------------------------------------------------
	
	
	
}

/* End of file system.php */
/* Location: ./admin/controllers/syestem.php */