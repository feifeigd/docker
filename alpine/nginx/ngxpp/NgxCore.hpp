
#pragma once

// namespace define
#define NGX_NAMESPACE_BEGIN	namespace ngx{
#define NGX_NAMESPACE_END	}
#define USING_NGX_NAMESPACE	using namespace ngx;

NGX_NAMESPACE_BEGIN
#include "NgxWrapper.hpp"
#include "NgxValue.hpp"


#include "NgxConfig.hpp"

NGX_NAMESPACE_END
using ngx::ngx_nil;
