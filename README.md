# 2017.04.26

今天完成的  
1. 完成了专业软件的图标显示和大图显示  
2. 完成了专业软件的轮播  
# 2017.04.29
今天任务
1. 完成了专业软件下载页面和下载跳转  
2. 已部署到新服务器  
3. 专业软件的轮播删了，明天更新
# 2017.04.30
今天任务
1. 专业软件的视频播放页面  
2. 用csdn将首页的图片做成外链，用外链来访问  
3. 用caesium压缩图片  
4. 用FreeVideoCompressor压缩视频  
5. 娱乐软件的下载页面重新复制一份为download_play
6. 用七牛云做成视频外链
# 2017.05.01
今天任务
1. 今天去广图做安卓  
   1.1 完成了注册，注册时要校验用户名和密码和学号和性别是否为空或者是不合法，首次注册就是管理员  
   1.2 完成了登录，只有管理员才可以登录  
   1.3 完成了新增，类似注册  
   1.4 完成了查看全部，一个列表的形式展示出来  
2. 网站更新了校园电话的信息，已更新到数据库  
# 2017.05.03
今天任务
1. 安卓程序已完成
2. 科猫网校园电话已更新到服务器
# 2017.05.04
今天任务
1.    今天为师弟师妹讲解了如何录制软件的安装视频
      1. 快照
      2. 改分辨率 1366*768   （记得开全屏）
      3. 打开录屏软件，点击录制屏幕
      4. 把软件拷贝到虚拟机的D盘，（boss:虚拟机就有点卡）
      5. 点击安装，能下一步就下一步，能运行就运行
      6. 录完之后命名，剪辑
      7. 录错了点删除，录好了点save，命名用1,2,3（选正在录制的尺寸）
      8. 保存项目，保存到文件目录下，命名为软件的名字   （不用渲染，交给boss，剪辑也交给boss）
      9. 按F10停止录制
      10. 停止录制之后，打开软件之后截图（尽量全屏，不要欢迎界面，注册界面...），   （重启程序记得改分辨率）
         10.所得成果：工程文件camtasia studio project  1 个，capture源文件n个，截图1张

      会出现的问题：
      1. 下次命名重新改为序号1
      2. 出现什么问题就恢复快照（在此之前把文件拉回本系统，ctrl+c复制，ctrl+v粘贴,ctrl+alt鼠标跳出虚拟机）
      3. 录完之后关闭虚拟机，恢复快照，这样就能恢复到开始之前的状态


      参考文件：   用友T3+this
# 2017.05.05
今天任务
1. 完成了计应的所有视频录制工作
2. 完成了专业软件所有软件的视频链接
# 2017.07.14
1. 完成腾讯云对象存储的api接入

   ```javascript
   function getTime(){
   			var myDate = new Date();  
   		    var mytime = myDate.getTime()
   		    return mytime;
   		}
   		$(function () {

               //TODO 以下几个值请确保填上再调用示例里的sdk方法
               //具体可以到https://console.qcloud.com/cos 进行查看
               var bucket = 'kcat';
               var appid = '125**1286';
               var sid = 'AKIDFQZW*******On3A92jFk4C9uqwgI';
               var skey = 'YwDKFyVq1qnaBh196r*******HAsRwJV';
               var region = 'gz';
               //TODO 以上几个值请确保填上再调用示例里的sdk方法

               var myFolder = '/';//需要操作的目录

               //初始化逻辑
               //特别注意: JS-SDK使用之前请先到console.qcloud.com/cos 对相应的Bucket进行跨域设置
               var cos = new CosCloud({
                   appid: appid,// APPID 必填参数
                   bucket: bucket,//bucketName 必填参数
                   region: region,//地域信息 必填参数 华南地区填gz 华东填sh 华北填tj
                   getAppSign: function (callback) {//获取签名 必填参数
   ```


                       //下面简单讲一下获取签名的几种办法，签名请做一次 url encode
                       //1.搭建一个鉴权服务器，自己构造请求参数获取签名，推荐实际线上业务使用，优点是安全性好，不会暴露自己的私钥
                       /**
                        $.ajax('SIGN_URL').done(function (data) {
                           var sig = data.sign;
                           callback(sig);
                       });
                        **/


                       //2.直接在浏览器前端计算签名，需要获取自己的accessKey和secretKey, 一般在调试阶段使用
                       var self = this;
                       var random = parseInt(Math.random() * Math.pow(2, 32));
                       var now = parseInt(new Date().getTime() / 1000);
                       var e = now + 60; //签名过期时间为当前+60s
                       var path = '';//多次签名这里填空
                       var str = 'a=' + self.appid + '&k=' + sid + '&e=' + e + '&t=' + now + '&r=' + random +
                               '&f=' + path + '&b=' + self.bucket;
    
                       var sha1Res = CryptoJS.HmacSHA1(str, skey);//这里使用CryptoJS计算sha1值，你也可以用其他开源库或自己实现
                       var strWordArray = CryptoJS.enc.Utf8.parse(str);
                       var resWordArray = sha1Res.concat(strWordArray);
                       var res = resWordArray.toString(CryptoJS.enc.Base64);
    
                       setTimeout(function () {//setTimeout模拟一下网络延迟的情况
                           callback(res);
                       }, 1000);


                       //3.直接复用别人算好的签名字符串, 一般在调试阶段使用
                       //callback('YOUR_SIGN_STR')


                   },
                   getAppSignOnce: function (callback) {//单次签名，参考上面的注释即可
                       var self = this;
                       var random = parseInt(Math.random() * Math.pow(2, 32));
                       var now = parseInt(new Date().getTime() / 1000);
                       var e = 0; //单次签名 expire==0
                       var path = self.path;
                       var str = 'a=' + self.appid + '&k=' + sid + '&e=' + e + '&t=' + now + '&r=' + random +
                               '&f=' + path + '&b=' + self.bucket;
    
                       var sha1Res = CryptoJS.HmacSHA1(str, skey);//这里使用CryptoJS计算sha1值，你也可以用其他开源库或自己实现
                       var strWordArray = CryptoJS.enc.Utf8.parse(str);
                       var resWordArray = sha1Res.concat(strWordArray);
                       var res = resWordArray.toString(CryptoJS.enc.Base64);
    
                       setTimeout(function () {//setTimeout模拟一下网络延迟的情况
                           callback(res);
                       }, 1000);
                   }
               });
    
               var successCallBack1 = function (result1) {
                   console.log('request success.');
                   
                   $("#result1").val("上传成功");
                   $('#uploadFile_img1').attr("src", "http://kcat-1251241286.cosgz.myqcloud.com/images/"+time_name);
               };
               
               var successCallBack2 = function (result2) {
                   console.log('request success.');
                   
                   $("#result2").val("上传成功");
                   $('#uploadFile_img2').attr("src", "http://kcat-1251241286.cosgz.myqcloud.com/images/"+time_name);
               };
               
               var errorCallBack1 = function (result1) {
                   result = result || {};
                   console.log('request error:', result && result.message);
                   $("#result1").val("上传失败");
               };
               
               var errorCallBack2 = function (result2) {
                   result = result || {};
                   console.log('request error:', result && result.message);
                   $("#result2").val("上传失败");
               };
    
               var progressCallBack1 = function (curr, sha1) {
                   var sha1CheckProgress = ((sha1 * 100).toFixed(2) || 100) + '%';
                   var uploadProgress = ((curr || 0) * 100).toFixed(2) + '%';
                   var msg = '上传进度:' + uploadProgress;
                   console.log(msg);
                   $("#result1").val(msg);
               };
               
               var progressCallBack2 = function (curr, sha1) {
                   var sha1CheckProgress = ((sha1 * 100).toFixed(2) || 100) + '%';
                   var uploadProgress = ((curr || 0) * 100).toFixed(2) + '%';
                   var msg = '上传进度:' + uploadProgress;
                   console.log(msg);
                   $("#result2").val(msg);
               };
    
               var lastTaskId;
               var taskReady = function (taskId) {
                   lastTaskId = taskId;
               };
               var file = "";
               var time_name = "";
               //图标上传
               $('#uploadFile1').on('click', function () {
               	myFolder = "/images/";
                   $('#js-file1').off('change').on('change', function (e) {
                   	console.log(e);
                       file = e.target.files[0];
                       time_name = getTime();
                       var img_name_last = file.name.substring(file.name.length-4,file.name.length);
                       time_name += img_name_last;
                       $('#result1').val(time_name);
                      	$('#uploadFile_submit1').on('click', function () {
                       	cos.uploadFile(successCallBack1, errorCallBack1, progressCallBack1, bucket, myFolder + time_name, file, 0, taskReady);//insertOnly==0 表示允许覆盖文件 1表示不允许
                       	$('#form1')[0].reset();
                       	return false;
                       });
                   });
    
                   setTimeout(function () {
                       $('#js-file1').click();
                   }, 0);
    
                   return false;
               });
               
               //大图上传
               $('#uploadFile2').on('click', function () {
               	myFolder = "/images/";
                   $('#js-file2').off('change').on('change', function (e) {
                   	console.log(e);
                       file = e.target.files[0];
                       time_name = getTime();
                       var img_name_last = file.name.substring(file.name.length-4,file.name.length);
                       time_name += img_name_last;
                       $('#result2').val(time_name);
                      	$('#uploadFile_submit2').on('click', function () {
                       	cos.uploadFile(successCallBack2, errorCallBack2, progressCallBack2, bucket, myFolder + time_name, file, 0, taskReady);//insertOnly==0 表示允许覆盖文件 1表示不允许
                       	$('#form2')[0].reset();
                       	return false;
                       });
                   });
    
                   setTimeout(function () {
                       $('#js-file2').click();
                   }, 0);
    
                   return false;
               });
               
               //创建文件夹
               $('#createFolder').on('click', function () {
                   var newFolder = '/333/';//填你需要创建的文件夹，记得用斜杠包一下
                   cos.createFolder(successCallBack, errorCallBack, bucket, newFolder);
               });
    
               //删除文件夹
               $('#deleteFolder').on('click', function () {
                   var newFolder = '/333/';//填你需要删除的文件夹，记得用斜杠包一下
                   cos.deleteFolder(successCallBack, errorCallBack, bucket, newFolder);
               });
    
               //获取指定文件夹内的列表,默认每次返回20条
               $('#getFolderList').on('click', function () {
                   cos.getFolderList(successCallBack, errorCallBack, bucket, myFolder);
               });
    
               //获取文件夹属性
               $('#getFolderStat').on('click', function () {
                   cos.getFolderStat(successCallBack, errorCallBack, bucket, '/333/');
               });
    
               //更新文件夹属性
               $('#updateFolder').on('click', function () {
                   cos.updateFolder(successCallBack, errorCallBack, bucket, '/333/', 'authority');
               });


```javascript
           //删除文件
           $('#deleteFile').on('click', function () {
               var myFile = myFolder + '2.txt';//填你自己实际存在的文件
               cos.deleteFile(successCallBack, errorCallBack, bucket, myFile);
           });

           //获取文件属性
           $('#getFileStat').on('click', function () {
               var myFile = myFolder + '2.txt';//填你自己实际存在的文件
               cos.getFileStat(successCallBack, errorCallBack, bucket, myFile);
           });

           //更新文件属性
           $('#updateFile').on('click', function () {
               var myFile = myFolder + '2.txt';//填你自己实际存在的文件
               cos.updateFile(successCallBack, errorCallBack, bucket, myFile, 'my new file attr');
           });

           //拷贝文件，从源文件地址复制一份到新地址
           $('#copyFile').on('click', function () {

               var myFile = '111/2.txt';//填你自己实际存在的文件

               //注意一下目标的路径，这里如果填333/2.txt 则表示文件复制到111/333/2.txt
               //如果填/333/2.txt 则表示文件复制到bucket根目录下的333/2.txt
               var newFile = '/333/2.txt';
               var overWrite = 1;//0 表示不覆盖 1表示覆盖
               cos.copyFile(successCallBack, errorCallBack, bucket, myFile, newFile, overWrite);
           });

           //移动文件，把源文件移动到新地址，如果是同一个目录移动且文件名不同的话，相当于改了一个文件名
           //如果是移动到新目录，相当于剪切当前的文件，粘贴到了新目录
           $('#moveFile').on('click', function () {

               var myFile = '/111/2.txt';//填你自己实际存在的文件

               //注意一下目标的路径，这里如果填333/2.txt 则表示文件移动到111/333/2.txt
               //如果填/333/2.txt 则表示文件移动到bucket根目录下的333/2.txt
               //如果填/111/3.txt 则相当于把2.txt改名成3.txt
               var newFile = '/333/2.txt';
               var overWrite = 1;//0 表示不覆盖 1表示覆盖
               cos.moveFile(successCallBack, errorCallBack, bucket, myFile, newFile, overWrite);
           });

           $('#cancelTask').on('click', function () {
               cos.cancelTask(lastTaskId);
           });

       });
```
# 2017.07.15

1. 准备七牛云SDK的接入

   ```javascript
    //引入Plupload 、qiniu.js后
   var uploader = Qiniu.uploader({
       runtimes: 'html5,flash,html4',    //上传模式,依次退化
       browse_button: 'pickfiles',       //上传选择的点选按钮，**必需**
       uptoken_url: '/token',            //Ajax请求upToken的Url，**强烈建议设置**（服务端提供）
       // uptoken : '', //若未指定uptoken_url,则必须指定 uptoken ,uptoken由其他程序生成
       // unique_names: true, // 默认 false，key为文件名。若开启该选项，SDK为自动生成上传成功后的key（文件名）。
       // save_key: true,   // 默认 false。若在服务端生成uptoken的上传策略中指定了 `sava_key`，则开启，SDK会忽略对key的处理
       domain: 'http://qiniu-plupload.qiniudn.com/',   //bucket 域名，下载资源时用到，**必需**
       get_new_uptoken: false,  //设置上传文件的时候是否每次都重新获取新的token
       container: 'container',           //上传区域DOM ID，默认是browser_button的父元素，
       max_file_size: '100mb',           //最大文件体积限制
       flash_swf_url: 'js/plupload/Moxie.swf',  //引入flash,相对路径
       max_retries: 3,                   //上传失败最大重试次数
       dragdrop: true,                   //开启可拖曳上传
       drop_element: 'container',        //拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
       chunk_size: '4mb',                //分块上传时，每片的体积
       auto_start: true,                 //选择文件后自动上传，若关闭需要自己绑定事件触发上传
       init: {
           'FilesAdded': function(up, files) {
               plupload.each(files, function(file) {
                   // 文件添加进队列后,处理相关的事情
               });
           },
           'BeforeUpload': function(up, file) {
                  // 每个文件上传前,处理相关的事情
           },
           'UploadProgress': function(up, file) {
                  // 每个文件上传时,处理相关的事情
           },
           'FileUploaded': function(up, file, info) {
                  // 每个文件上传成功后,处理相关的事情
                  // 其中 info 是文件上传成功后，服务端返回的json，形式如
                  // {
                  //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                  //    "key": "gogopher.jpg"
                  //  }
                  // 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html

                  // var domain = up.getOption('domain');
                  // var res = parseJSON(info);
                  // var sourceLink = domain + res.key; 获取上传成功后的文件的Url
           },
           'Error': function(up, err, errTip) {
                  //上传出错时,处理相关的事情
           },
           'UploadComplete': function() {
                  //队列文件处理完毕后,处理相关的事情
           },
           'Key': function(up, file) {
               // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
               // 该配置必须要在 unique_names: false , save_key: false 时才生效

               var key = "";
               // do something with key here
               return key
           }
       }
   });

   // domain 为七牛空间（bucket)对应的域名，选择某个空间后，可通过"空间设置->基本设置->域名设置"查看获取

   // uploader 为一个plupload对象，继承了所有plupload的方法，参考http://plupload.com/docs
   ```


# 2017.07.17

七牛云和项目接入

1. main.js

```javascript
$(function() {
    var uploader = Qiniu.uploader({
        runtimes: 'html5,flash,html4',
        browse_button: 'pickfiles',
        container: 'container',
        drop_element: 'container',
        flash_swf_url: 'bower_components/plupload/js/Moxie.swf',
        dragdrop: true,
        chunk_size: '4mb',

        // uptoken_url: $('#uptoken_url').val(),
        uptoken:"7o_8Y11I7c16sa25PnnIUk1y7gqK5gCYe6U2****B7CGQq5u-Ql2-9Am3NfFc8nBc=:eyJzY29wZSI6ImtjYXQiLCJkZWFkbGluZSI6MTUwMDI4OTM4Mjk5OTl9",
        multi_selection: !(mOxie.Env.OS.toLowerCase()==="ios"),
```

1. zhuanye.js

   ```html
   <div class="col-md-12">
   			                        <div id="container" style="position: relative;">
   			                            <a class="btn btn-default btn-lg " id="pickfiles" href="http://jssdk.demo.qiniu.io/#" style="position: relative; z-index: 1;">
   			                                <i class="glyphicon glyphicon-plus"></i>
   			                                <span>选择视频</span>
   			                            </a>
   			                        <div id="html5_1aj3rtennnga1n5h927gjn8343_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 171px; height: 46px; overflow: hidden; z-index: 0;"><input id="html5_1aj3rtennnga1n5h927gjn8343" type="file" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple="" accept=""></div></div>
   			                    </div>
   			                    <div style="display:none" id="success" class="col-md-12">
   			                        <div class="alert-success" style="border-radius: 10px;">视频上传完毕</div>
   			                    </div>
   			                    <div class="col-md-12 ">
   			                        <table class="table table-striped table-hover text-left" style="margin-top:40px;display:none">
   			                            <thead>
   			                              <tr>
   			                                <th class="col-md-4">视频名称</th>
   			                                <th class="col-md-2">大小</th>
   			                                <th class="col-md-6">详细信息</th>
   			                              </tr>
   			                            </thead>
   			                            <tbody id="fsUploadProgress">
   			                            </tbody>
   			                        </table>
   			                    </div>
   ```



# 2017.07.18-19

1. 专业软件模块上传图片和视频后，把数据提交存到数据库

# 2017.07.20

1. 增加上传软件模块


# 2017.07.21

1. 增加getAllsoft方法，用来查询数据库中所有的软件，如果有了就选择，没有就添加

# 2017.07.22

1. 把getAllsoft方法的位置改到studySoft中，昨天写错了
2. 把项目移到github目录中，方便上传

# 2017.07.23

1. 去数据库获取所有软件，并添加到下拉框

# 2017.07.24

1. 当选择软件上传时才把上传界面弹出，否则隐藏
2. 实现软件上传功能

# 2017.07.25

1. 提交获取所有表单数据和上传数据

# 2017.07.26

1. 获取软件上传的图标的路径和大图的路径和软件的路径以及视频的路径

# 2017.07.27

1. 准备写入数据库

# 2017.07.28

1. 上传截取文件名

# 2017.07.29

1. 做错误提示，用阴影

# 2017.07.30

1. 判断是否选择文件来解除上传按钮，纠结ing

# 2017.07.31

1. 把上传按钮去掉，选择完图片之后自动上传，上传后，错误状态取消

# 2017.08.01-03

1. 准备数据库配置文件

# 2017.08.04-05

1. 上传软件如果没有这个软件，需要独立上传新软件要把软件名字加到soft表中

# 2017.08.06

1. 选择软件是需要把序号截取出来作为软件的路径名字
2. 首先把软件上传到数据库，再从数据库获得这个软件对应的序号，最后才上传到腾讯云

# 2017.08.07-08

1. 增加软件名字找序号，修改参数类型

# 2017.08.09

1. 准备修改前台页面，准备换个风格

# 2017.08.10

1. 后台更换全新模板
2. 模板已实现分页功能，搜索功能
3. 用户添加功能已经替换过来，剩下刷新问题

# 2017.08.11

1. 解决了编辑点击获取当前行id的问题
2. 解决了刷新问题
3. 准备添加用户重复校验

# 2017.08.12

1. 添加用户重复校验，用jquery.validation自定义校验实现

# 2017.08.13

1. 完成了用户的删除和批量删除
2. 添加了用户组，分为普通用户，管理员，超级管理员，默认是普通用户
3. 添加登录界面，只有管理员和超级管理员才能登录
4. 完成页面所有跳转链接

# 2017.08.14

1. 完成用户组的显示和图标
2. 用户组的修改，普通用户和管理员的转换
3. 实现专业软件信息的读取
4. 软件下载图标和下载
5. 大图点击才放大的弹出

# 2017.08.15

1. 软件简介字体省略，详细加到a标签的title
2. 安装教程可在线观看，待修改为弹窗

# 2017.08.16

1. 将大图的链接通过.do的方式将src传到datu.jsp

# 2017.08.17

1. 实现大图的方法，还是用datu.jsp通过问号的方式传值，然后改变src的值
2. 实现视频弹窗
3. 实现外键一起查询学院和专业，并显示出来

# 2017.08.18

1. 修复软件简介字符替换只能替换一个空字符的问题
2. 新建添加软件界面
3. 软件界面读取数据库绑定学院和对应专业

# 2017.08.19

1. 三个腾讯云的上传移植
2. 未上传前设置一个图标
3. 上传软件设置一个下载按钮

# 2017.08.20

1. 软件简介
2. 七牛云的视频上传移植

# 2017.08.21

1. 添加软件所需要的校验
2. 提取上传图片和软件后的名字

# 2017.08.22

1. 添加软件所有的校验
2. 添加软件到数据库
3. 添加软件的表设置外键，和soft，当soft的一个软件删除时，对应的软件应该删除，相反不会

# 2017.08.23

1. 添加软件分配

# 2017.08.24

1. 数据库soft表和专业软件的表字段替换
2. 完善软件分配
3. 专业软件的删除和批量删除

# 2017.08.25

1. 软件名字的重复校验

# 2017.08.26

1. 将添加软件和软件分配分开
2. 内容管理加多一级菜单

# 2017.08.27-28

1. 正在做编辑

# 2017.08.29

1. 完成专业软件编辑
2. 软件名字添加校验
3. 解决软件类型选中问题，用遍历的方法

# 2017.08.30

1. 转编码失败

# 2017.08.31

1. 修复了乱码，编码两次，解码一次
2. 娱乐软件的软件列表显示

# 2017.09.01

1. 娱乐软件的添加软件页面

# 2017.09.02

1. 娱乐软件添加成功，校验成功

# 2017.09.03

1. 娱乐软件的删除和批量删除和修改
2. 遗留图标和大图和软件编辑修改无法保存的问题

# 2017.09.04

1. 昨晚遗留问题解决

# 2017.09.05

1. 解决视频上传修改链接不对
2. 专业软件和娱乐软件准备把类型做成可修改删除添加
3. 作业辅助将分类也做成增删改

# 2017.09.06

1. 作业辅助的列表查看

# 2017.09.07

1. 作业辅助图片完善

# 2017.09.08

1. 作业辅助图片改为大图查看，链接改为云盘图标

# 2017.09.09-10

1. 完成作业辅助查看

# 2017.09.11

1. 休息

# 2017.09.12

1. 休息