
#pragma once

// NGX_CONF_UNSET = -1
class NgxUnsetValue final{
public:
	template<typename T>
	operator T()const{
		return static_cast<T>(-1);
	}

	template<typename T>
	operator T*()const{
		return reinterpret_cast<T*>(-1);
	}

public:
	static NgxUnsetValue const& get(){
		static NgxUnsetValue const v;
		return v;
	}
};

