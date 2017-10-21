
#pragma once

#include "NdgTestConf.hpp"

class NdgTestInit final{
public:
	static ngx_module_t& module(){
		static ngx_module_t m = {
			NGX_MODULE_V1,			// 标准的填充宏
			ctx(),					// 配置功能函数
			cmds(),					// 配置指令数组
			NGX_HTTP_MODULE,		// http 模块必须的tag
			nullptr,				// ngx_modules::init_master
			nullptr,				// ngx_modules::init_module
			nullptr,				// ngx_modules::init_process			
			nullptr,				// ngx_modules::init_thread
			nullptr,				// ngx_modules::exit_thread
			nullptr,				// ngx_modules::exit_process	
			nullptr,				// ngx_modules::exit_master
			NGX_MODULE_V1_PADDING,	// 标准的填充宏
		};
		return m;
	}
private:
	static ngx_http_module_t* ctx(){
		static ngx_http_module_t c = {

		};

		return &c;
	}
	
	static ngx_command_t* cmds(){
		static ngx_command_t n[] = {
			{
				ngx_string("ndg_test"),				// 指令的名字
				ngx::NgxTake(NGX_HTTP_SRV_CONF, 1),	// 指令的作用域和类型
				ngx_conf_set_flag_slot,				// 解析函数指针
				NGX_HTTP_LOC_CONF_OFFSET,			// 数据的存储位置
				offsetof(NdgTestConf, enabled),		// 数据的具体存储变量
				nullptr,							// 暂时无需关心
			},
			ngx_null_command,	// 空对象，结束数组
		};
		return n;
	}
};

