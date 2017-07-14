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
# 2017.07.05
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

   ​
