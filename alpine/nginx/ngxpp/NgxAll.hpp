
#pragma once

// nginx 的头文件
#include "Nginx.hpp"

// cpp headers
#include "NgxCppInc.hpp"

// core classes in namespace ngx{}
#include "NgxCore.hpp"

// namespace define
#define NGX_HTTP_NAMESPACE_BEGIN namespace ngx{ namespace http{
#define NGX_HTTP_NAMESPACE_END   }}

#define USING_HTTP_NAMESPACE using namespace ngx::http

// http classes
NGX_HTTP_NAMESPACE_BEGIN

NGX_HTTP_NAMESPACE_END

