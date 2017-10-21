
#pragma once

#include "NdgTestConf.hpp"

class NdgTestInit final{
public:
	static ngx_module_t& module(){
		static ngx_module_t m = {
		};
		return m;
	}

};

