
#pragma once

class NgxTake final{
public:
	NgxTake(ngx_uint_t conf, int m = 0, int n = -1):m_type(conf | take(m, n)){}

	operator ngx_uint_t()const{return m_type;}

private:
	ngx_uint_t	m_type;

	static ngx_uint_t take(int m, int n){
		static ngx_uint_t takes[] = {
			NGX_CONF_NOARGS,
			NGX_CONF_TAKE1,
			NGX_CONF_TAKE2,
			NGX_CONF_TAKE3,
			NGX_CONF_TAKE4,
			NGX_CONF_TAKE5,
			NGX_CONF_TAKE6,
			NGX_CONF_TAKE7,
		};
		if(n < 0 || n < m)
			return takes[m];
		if(n > NGX_CONF_MAX_ARGS)
			return m == 1 ? NGX_CONF_1MORE : NGX_CONF_2MORE;
		ngx_uint_t tmp = 0;
		for(int i = m; i <= n; ++i)
			tmp |= takes[i];
		return tmp;
	}
};

