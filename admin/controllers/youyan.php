<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
/**
 * DiliCMS
 *
 * 涓�娆惧熀浜庡苟闈㈠悜CodeIgniter寮�鍙戣�呯殑寮�婧愯交鍨嬪悗绔唴瀹圭鐞嗙郴缁�.
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
 * DiliCMS 绯荤粺鐩稿叧鎺у埗鍣�
 *
 * @package     DiliCMS
 * @subpackage  Controllers
 * @category    Controllers
 * @author      Jeongee
 * @link        http://www.dilicms.com
 */
class Youyan extends Admin_Controller
{
	/**
     * 鏋勯�犲嚱鏁�
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
     * 娌圭儫鐩戞祴鏁版嵁
     *
     * @access  public
     * @return  void
     */
	public function index($role = 0)
	{
		
		$offset = $this->input->get('page', TRUE) ? $this->input->get('page', TRUE) : 0; 
		$data['list'] = $this->user_mdl->get_users($role, 15, $offset);
		
		//鍔犺浇鍒嗛〉
		$this->load->library('pagination');
		$config['base_url'] = backend_url('user/view') . '?dilicms';
		$config['per_page'] = 15;
		$config['page_query_string'] = TRUE;
		$config['query_string_segment'] = 'page';
		$config['total_rows'] = $this->user_mdl->get_users_num($role);
		$this->pagination->initialize($config);
		$data['pagination'] = $this->pagination->create_links();
		$this->_template('youyan_list', $data);
		
		//$this->_template('youyan_list_test');
		
		
	}
	
	// ------------------------------------------------------------------------
	
	/**
     * 娌圭儫鐩戞祴鏁版嵁
     *
     * @access  public
     * @return  void
     */
	public function all_data()
	{
		
		$offset = $this->input->get('page', TRUE) ? $this->input->get('page', TRUE) : 0; 
		$data['list'] = $this->user_mdl->get_users($role, 15, $offset);
		
		//鍔犺浇鍒嗛〉
		$this->load->library('pagination');
		$config['base_url'] = backend_url('user/view') . '?dilicms';
		$config['per_page'] = 15;
		$config['page_query_string'] = TRUE;
		$config['query_string_segment'] = 'page';
		$config['total_rows'] = $this->user_mdl->get_users_num($role);
		$this->pagination->initialize($config);
		$data['pagination'] = $this->pagination->create_links();
		$this->_template('youyan_list', $data);
		
		
	}
	
// ------------------------------------------------------------------------
	
	/**
     * 娌圭儫鐩戞祴璁惧
     *
     * @access  public
     * @return  void
     */
	public function all_device()
	{
		
		$offset = $this->input->get('page', TRUE) ? $this->input->get('page', TRUE) : 0; 
		$data['list'] = $this->user_mdl->get_users($role, 15, $offset);
		
		//鍔犺浇鍒嗛〉
		$this->load->library('pagination');
		$config['base_url'] = backend_url('user/view') . '?dilicms';
		$config['per_page'] = 15;
		$config['page_query_string'] = TRUE;
		$config['query_string_segment'] = 'page';
		$config['total_rows'] = $this->user_mdl->get_users_num($role);
		$this->pagination->initialize($config);
		$data['pagination'] = $this->pagination->create_links();
		$this->_template('youyan_list', $data);
		
		
	}
	
	// ------------------------------------------------------------------------
	
	
	
}

/* End of file system.php */
/* Location: ./admin/controllers/syestem.php */