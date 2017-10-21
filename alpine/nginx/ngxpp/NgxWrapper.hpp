
#pragma once

#include <type_traits>

// T = ngx_list_t, ngx_array_t, ngx_pool_t, ...
template<typename T>
class NgxWrapper{
public:
	typedef typename std::remove_pointer<T>::type	wrapped_type;

	typedef wrapped_type* pointer_type;
	typedef wrapped_type& reference_type;
private:
	pointer_type m_ptr = nullptr;
protected:
	NgxWrapper(pointer_type p):m_ptr(p){}
	NgxWrapper(reference_type x):m_ptr(&x){}
public:
	pointer_type get()const{return m_ptr;}
	operator pointer_type()const{return get();}
	pointer_type operator->()const{return get();}

	operator bool()const{return get();}
};

