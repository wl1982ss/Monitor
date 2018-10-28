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
 * DiliCMS 鍚庡彴鏉冮檺鎺у埗绫�
 *
 * @package     DiliCMS
 * @subpackage  Libraries
 * @category    Libraries
 * @author      Jeongee
 * @link        http://www.dilicms.com
 */
class Acl 
{
	/**
     * ci
     * CI瓒呯骇绫诲彞鏌�
     *
     * @var object
     * @access  private
     **/
	private $ci = NULL;

	/**
     * top_menus
     * 涓�绾ц彍鍗曢泦鍚�
     *
     * @var array
     * @access  private
     **/
	private $top_menus = array();

	/**
     * _left_menus
     * 浜屼笁绾ц彍鍗曢泦鍚�
     *
     * @var array
     * @access  private
     **/
	private $left_menus = array();

	/**
     * _current_menu
     * 褰撳墠鎵�鍦ㄧ殑鑿滃崟鐨勪笅鏍�
     *
     * @var int
     * @access  private
     **/
	private $_current_menu = -1;

	/**
     * _default_link
     * 褰撳墠鎵�鍦ㄧ殑閾炬帴
     *
     * @var string
     * @access  public
     **/
	public $_default_link = '';

	/**
     * _rights
     * 鏉冮檺闆嗗悎
     *
     * @var array
     * @access  public
     **/
	public $rights = array();

	/**
     * 鏋勯�犲嚱鏁�
     *
     * @access  public
     * @return  void
     */
	public function __construct()
	{
		$this->ci = & get_instance();
		$this->ci->settings->load('menus');//鍔犺浇鑿滃崟鏁版嵁
		$this->top_menus = & setting('menus');
		
		if ($this->ci->_admin->role != 1)
		{
			$this->ci->settings->load('acl/role_' . $this->ci->_admin->role . '.php');//鍔犺浇鏉冮檺鏁版嵁
			$this->top_menus = & setting('menus');
			
			$this->rights = & setting('current_role');
		}
		$this->_filter_menus();
	}
	
	// ------------------------------------------------------------------------

    /**
     * 杈撳嚭椤堕儴鑿滃崟
     *
     * @access  public
     * @return  void
     */
	public function show_top_menus()
	{
		//妫�鏌ユ槸鍚︽樉绀洪《閮ㄦ彃浠惰彍鍗�.
		$is_show_module_menu = FALSE;
		if ($this->ci->plugin_manager->get_menus())
		{
			$is_show_module_menu = TRUE;
		}
		$last_menu_key = count($this->top_menus) - 1;
		foreach ($this->top_menus as $key => $v)    
		{
			if ($key === 2 AND ! $is_show_module_menu)
			{
				continue;
			}
			
			echo '<li class="' . ($key == 0 ? 'first' : ($key == $last_menu_key ? 'last' : '')) . 
			     ' ' .($key == $this->_current_menu ? 'selected' : '').'"><a href="' . 
			     backend_url($v['class_name'] . '/' . $v['method_name']) . '">' . $v['menu_name'] .'</a>
			     </li>';
		}
	}
	
	// ------------------------------------------------------------------------

    /**
     * 杈撳嚭杈规爮鑿滃崟
     *
     * @access  public
     * @return  void
     */
	public function show_left_menus()
	{
		
		foreach ($this->left_menus as $key => $v)
		{
			if ($v['sub_menus'])
			{
				echo '<li><span>' . $v['menu_name'] . '</span>
					     <ul name="menu">';
						 foreach ($v['sub_menus'] as $j)
						 {
						   $extra = '';
						   $this->_current_menu ==  1 AND $extra =  'model=' . $j['extra'] ;
						   if ($this->_current_menu ==  2) {
						        echo '<li class="' . (isset($j['current']) ? 'selected' : '') .'"><a href="' . 
						   	        plugin_url($key, $j['class_name'], $j['method_name']) . '">' . $j['menu_name'] . '</a></li>';
						   	    continue;
						   } 
						   echo '<li class="' . (isset($j['current']) ? 'selected' : '') .'"><a href="' . 
						   	 backend_url($j['class_name'] . '/' . $j['method_name'], $extra) . '">' . $j['menu_name'] . '</a></li>';
						 }
				echo	 '</ul>
				      </li>';	
			}
		}
	}
	
	// ------------------------------------------------------------------------

    /**
     * 杩囨护鑿滃崟
     *
     * @access  private
     * @return  void
     */
	private function _filter_menus()
	{
	    
		$class_name = $this->ci->uri->rsegment(1);
		$method_name = $this->ci->uri->rsegment(2);
		
		switch ($class_name)
		{
			case 'content' :
			case 'category_content' : 
						$this->_filter_content_menus($class_name, $method_name);
						break;
			case 'module' : 
						$this->_filter_module_menus($class_name, $method_name);
						break;
			case 'system' :
			case 'setting':
			case 'model'  :
			case 'category' :
			case 'plugin' :
			case 'role'   :
			case 'user'   :
            case 'database' :
            
						$this->_filter_normal_menus($class_name, $method_name);
						break;
            case 'youyan' :
            	$this->_filter_monitor_menus($class_name, $method_name, 3);
				break;
            case 'yangchen' :
            	$this->_filter_monitor_menus($class_name, $method_name, 4);
				break;
            case 'water' :
            	$this->_filter_monitor_menus($class_name, $method_name, 5);
				break;
			default : 
						 //noting to do
		}
	}
	
// ------------------------------------------------------------------------

    /**
     * 杩囨护鐩戞祴鑿滃崟
     *
     * @access  private
     * @param   string
     * @param   string
     * @return  void
     */
	private function _filter_monitor_menus($class_name, $method_name, $current_menu = 0)
	{//1
		$this->_current_menu = $current_menu;
		
		$this->left_menus = & $this->top_menus[$this->_current_menu]['sub_menus'];
	
		$extra = $this->ci->input->get('model');
		foreach ($this->left_menus as $vkey => & $v)
		{
		    //var_dump($v['sub_menus']);
			foreach ($v['sub_menus'] as $jkey => & $j)
			{
			   
				if ($j['class_name'] == $class_name AND $j['method_name'] == $method_name AND 
					( ($j['extra'] == $extra AND $vkey == 0) || ($j['extra'] == $extra AND $vkey == 1) ) )
				{
					$j['current'] = TRUE;
				}
				
				if ($this->ci->_admin->role == 1)
				{
					continue;
				}
				
				
				$right = $j['class_name'] . '@' . $j['method_name'];
				
				if ( ! in_array($right, $this->rights['rights']) || 
				   ((!empty($j['extra'])) AND ! in_array($j['extra'], $this->rights['models']) AND $vkey == 0) ||
				    ((!empty($j['extra'])) AND! in_array($j['extra'], $this->rights['category_models']) AND $vkey == 1) 		
				)
				{
				    
					unset($this->left_menus[$vkey]['sub_menus'][$jkey]);
				}
			} 
			if ( ! $v['sub_menus'])
			{
				unset($this->left_menus[$vkey]);
			}
		}
		//璁惧畾榛樿閾炬帴 
		if ($_item = @ reset($this->left_menus[0]['sub_menus']))
		{
		    if ( ! $this->_default_link)
			{
			    if(!empty($_item['extra']))
			    {
			         $this->_default_link = backend_url($_item['class_name'] . '/view', 'model=' . $_item['extra']);	
			    }
			}
		}
		
	}
	
	// ------------------------------------------------------------------------

    /**
     * 杩囨护绯荤粺鑿滃崟
     *
     * @access  private
     * @param   string
     * @param   string
     * @return  void
     */
	private function _filter_normal_menus($class_name, $method_name, $default_uri = 'system/home', $current_menu = 0, $folder = '')
	{//0
		$this->_current_menu = $current_menu;
		$this->_default_link = backend_url($default_uri);
		$this->left_menus = & $this->top_menus[$this->_current_menu]['sub_menus'];
		foreach ($this->left_menus as $vkey => & $v)
		{
			foreach ($v['sub_menus'] as $jkey => & $j)
			{
				if ($j['class_name'] == $folder . $class_name AND $j['method_name'] == $method_name)
				{
					$j['current'] = TRUE;
				}
				if ($this->ci->_admin->role == 1)
				{
					continue;
				}
				$right = $j['class_name'] . '@' . $j['method_name'];
				if ( ! in_array($right, $this->rights['rights']) AND $right !='system@home')
				{
					unset($this->left_menus[$vkey]['sub_menus'][$jkey]);	
				}
			} 
			if ( ! $v['sub_menus'])
			{
				unset($this->left_menus[$vkey]);
			}  
		}
	}
	
	// ------------------------------------------------------------------------

    /**
     * 杩囨护妯″瀷鑿滃崟
     *
     * @access  private
     * @param   string
     * @param   string
     * @return  void
     */
	private function _filter_content_menus($class_name, $method_name)
	{//1
		$this->_current_menu = 1;
		$this->left_menus = & $this->top_menus[$this->_current_menu]['sub_menus'];
		$extra = $this->ci->input->get('model');
		foreach ($this->left_menus as $vkey => & $v)
		{
			foreach ($v['sub_menus'] as $jkey => & $j)
			{
				if ($j['class_name'] == $class_name AND $j['method_name'] == $method_name AND 
					( ($j['extra'] == $extra AND $vkey == 0) || ($j['extra'] == $extra AND $vkey == 1) ) )
				{
					$j['current'] = TRUE;
				}
				
				if ($this->ci->_admin->role == 1)
				{
					continue;
				}
				$right = $j['class_name'] . '@' . $j['method_name'];
				if ( ! in_array($right, $this->rights['rights']) || 
				   ( ! in_array($j['extra'], $this->rights['models']) AND $vkey == 0) ||
				   ( ! in_array($j['extra'], $this->rights['category_models']) AND $vkey == 1) 		
				)
				{
					unset($this->left_menus[$vkey]['sub_menus'][$jkey]);
				}
			} 
			if ( ! $v['sub_menus'])
			{
				unset($this->left_menus[$vkey]);
			}
		}
		//璁惧畾榛樿閾炬帴 
		if ($_item = @ reset($this->left_menus[0]['sub_menus']))
		{
		    if ( ! $this->_default_link)
			{
			    $this->_default_link = backend_url($_item['class_name'] . '/view', 'model=' . $_item['extra']);	
			}
		}
		
	}
	
	// ------------------------------------------------------------------------

    /**
     * 杩囨护鎻掍欢鑿滃崟
     *
     * @access  private
     * @param   string
     * @param   string
     * @return  void
     */
	private function _filter_module_menus($class_name, $method_name)
	{//2
		$this->_current_menu = 2;
	}
	
	// ------------------------------------------------------------------------

    /**
     * 妫�娴嬫ā鍧楁彃浠惰彍鍗�
     *
     * @access  public
     * @return  void
     */
	public function detect_plugin_menus()
	{
		$this->top_menus[$this->_current_menu]['sub_menus'] = $this->ci->plugin_manager->get_menus();
		$this->left_menus = & $this->top_menus[$this->_current_menu]['sub_menus'];
		foreach ($this->left_menus as $key => & $v)
		{
			if (isset($v['sub_menus']) AND $v['sub_menus'])
			{
				foreach ($v['sub_menus'] as & $j)
				{
					$j['extra'] = 'plugin=' . $key . '&action=' . $j['method_name'];
					if ($key == $this->ci->input->get('plugin') 
					    AND 
					    $j['class_name'] == $this->ci->input->get('c')
					    AND 
					    $j['method_name'] == $this->ci->input->get('m'))
					{
						$j['current'] = TRUE;
					}
					if ( ! $this->_default_link)
					{
						$this->_default_link = plugin_url($key, $j['class_name'], $j['method_name']);
					}
				}
			}
			else
			{
				unset($this->left_menus[$key]);	
			}
		}
	}
	
	// ------------------------------------------------------------------------

    /**
     * 妫�娴嬫彃浠�
     *
     * @access  public
     * @param   string
     * @return  void
     */
	public function permit($act = '', $folder = '')
	{
		if ($this->ci->_admin->role == 1)
		{
			return TRUE;	
		}
		$class_method = $folder . $this->ci->uri->rsegment(1) . '@' . $this->ci->uri->rsegment(2) . ($act ? '@' . $act : '');
		if ( ! in_array($class_method,$this->rights['rights']))
		{
			return FALSE;	
		}
		if ( $this->ci->uri->rsegment(1) == 'content' )
		{
			if ( ! in_array($this->ci->input->get('model'), $this->rights['models']))
			{
				return FALSE; 
			}
		}
		else if ($this->ci->uri->rsegment(1) == 'category_content')
		{
			if ( ! in_array($this->ci->input->get('model'), $this->rights['category_models']))
			{
				return FALSE; 
			}
		}
		else if ($this->ci->uri->rsegment(1) == 'module')
		{
			if ( ! in_array($this->ci->input->get('plugin'), $this->rights['plugins']))	
			{		
				return FALSE;
			}
		}
		return TRUE;
	}

	// ------------------------------------------------------------------------

    /**
     * 璁剧疆椤堕儴閫変腑鑿滃崟
     *
     * @access  public
     * @param   int
     * @return  void
     */
	public function set_current_menu($key = 0)
	{
		$this->_current_menu = $key;
	}

	// ------------------------------------------------------------------------

	/**
     * 瑙﹀彂鑷畾涔夎彍鍗曠殑妫�娴�
     *
     * @access  public
     * @param   int
     * @return  void
     */
	public function filter_left_menus($default_uri = '', $current_menu = 0, $folder = '')
	{
		$current_menu AND $this->_current_menu = $current_menu;
		$class_name = $this->ci->uri->rsegment(1);
		$method_name = $this->ci->uri->rsegment(2);
		$this->_filter_normal_menus($class_name, $method_name, $default_uri, $this->_current_menu, $folder);
	}

	// ------------------------------------------------------------------------
	
}
	
/* End of file Acl.php */
/* Location: ./shared/libraries/Acl.php */