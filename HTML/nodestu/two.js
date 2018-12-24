/**
 * Created by Administrator on 2018/5/31 0031.
 */
// 引入http模块
var http = require("http");

// 创建server，指定处理客户端请求的函数
http.createServer(
    function(request, response) {
        response.writeHead(200, {"Content-Type": "text/plain"});
        response.write("Hello World!");
        response.end();
    }
).listen(8000);

console.log("Hello World is listening at port 8000hhhjv");