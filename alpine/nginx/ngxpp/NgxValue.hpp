
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

auto&& ngx_nil = NgxUnsetValue::get();

class NgxValue final{
public:
	template<typename T, typename ...Args>
	static void unset(T& v, Args& ...args){
		v = ngx_nil;
		unset(args...);
	}

	static void unset(){}

	template<typename T>
	static bool invalid(T const& v){return v == static_cast<T>(ngx_nil);}

	template<typename T, typename U>
	static void init(T& x, U const& v){if(invalid(x))x = v;}

	template<typename T>
	static void memzero(T& v, std::size_t n = sizeof(T)){ngx_memzero(&v, n);}

	template<typename T>
	static void memzero(T* v, std::size_t n = sizeof(T)){ngx_memzero(v, n);}

	template<typename T, typename U, typename V>
	static void merge(T&c, U const& p, V const& d){if(invalid(c))c= invalid(p) ? d : p;}

	static bool invalid( ngx_str_t const& v){return !v.data || !v.len;}

};

template<typename T>
bool operator==(T const& x, NgxUnsetValue const&){return NgxValue::invalid(x);}

template<typename T>
bool operator!=(T const& x, NgxUnsetValue const&){return !NgxValue::invalid(x);}

