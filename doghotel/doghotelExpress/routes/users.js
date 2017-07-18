var express = require('express');
var router = express.Router();

//mysql
var mysql=require('mysql');
var pool=mysql.createPool({
	host:'localhost',
	user:'root',
	password:'root',
	database:'doghotel'
})

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//登录
router.post('/login',function(req,res,next){
	var exist_user={
		'name':req.param('name'),
		'password':req.param('password')
	}
	pool.getConnection(function(err,connection){
		var str='select * from users where username="'+exist_user.name+'"'
		connection.query(str,function(error,results,fields){
			if(error){
				res.send({msg:'出错了！'});
			}
			if(results.length==0){
				res.send({msg:'该用户不存在'});
				connection.release();
				return;
			}

			if(results[0].password != exist_user.password){
				res.send({msg:'密码不正确，请重新输入！'})
				connection.release();
				return;
			}
				connection.release();
				res.send(results);
			})
	})
})

//注册
router.post('/register',function(req,res,next){
	var new_user={
		'name':req.param('name'),
		'password':req.param('password')
	};
	var str1='select * from users where username="'+new_user.name+'"';
	var str2='insert into users(username,password) values("'+new_user.name+'","'+new_user.password+'")';
	pool.getConnection(function(err,connection){
		connection.query(str1,function(error,results,fields){
				if(error){
					res.send('出错了！');
					connection.release();
					return
				}

				if(results.length>=1){
					connection.release();
					res.send({err:'用户名已存在'});
					return;
				}	
			
		connection.query(str2,function(error,results,fields){
				if(error){
					res.send('出错了！');
					connection.release();
					return;
				}
					connection.release();
					res.send(results);
			})
		})
	})
})

//背景图片
router.get('/bgimg',function(req,res,next){
	var str='select * from bgimg';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}

			connection.release();
			res.send(results);
		})
	})
})

//轮播图
router.get('/slider',function(req,res,next){
	var str='select * from slider';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

//广告
router.get('/ads',function(req,res,next){
	var str='select * from ads';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

//商品展示
router.get('/listall',function(req,res,next){
	var str='select * from listall';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);

		})
	})
})


router.get('/listbig',function(req,res,next){
	var str='select * from listbig';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})


router.get('/listmiddle',function(req,res,next){
	var str='select * from listmiddle';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

router.get('/listsmall',function(req,res,next){
	var str='select * from listsmall';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

//显示个人信息
router.get('/personInfo',function(req,res,next){
	var str='select * from users where username="'+req.query.name+'"';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

//修改个人信息
router.post('/updateinfo',function(req,res,next){
	var exist_user={
		'user':req.param('user'),
		'uid':req.param('uid'),
		'phone':req.param('phone'),
		'age':req.param('age'),
		'level':req.param('level'),

	};
	pool.getConnection(function(err,connection){
		var str='update users set uid="'+exist_user.uid+'",phone="'+exist_user.phone+'",age="'+exist_user.age+'",level="'+exist_user.level+'" where username="'+exist_user.user+'" '
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了！');
			}

			connection.release();
			res.send('更新成功！');
		})
	})
})

//添加到收藏
router.post('/addlike',function(req,res,next){
	var add_like={
		'username':req.param('username'),
		'likeid':req.param('likeid')
	}
	pool.getConnection(function(err,connection){
		var str1='select * from likes where username="'+add_like.username+'" and likeid="'+add_like.likeid+'"';
		var str2='insert into likes(username,likeid) values("'+add_like.username+'","'+add_like.likeid+'")';
		connection.query(str1,function(error,results,fields){
				if(error){
					res.send('出错了！');
					connection.release();
					return
				}

				if(results.length>=1){
					connection.release();
					res.send({err:'您已经收藏过了！！'});
					return;
				}	
			
		connection.query(str2,function(error,results,fields){
				if(error){
					res.send('出错了！');
					connection.release();
					return;
				}
					connection.release();
					res.send(results);
			})
		})
	})
})

//取消收藏
router.post('/cancellike',function(req,res,next){
	var del_like={
		'likeid':req.param('likeid'),
		'username':req.param('username')
	}
	pool.getConnection(function(err,connection){
		var str='delete from likes where likeid="'+del_like.likeid+'" and username="'+del_like.username+'"';
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了！');
			}
			connection.release();
			res.send('更新成功！');
		})
	})
})

//我的收藏
router.get('/mylike',function(req,res,next){
	var str='select username,title,img,price,w_price,likeid from likes,listall where username="'+req.query.username+'" and listall.id=likes.likeid';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

//显示详情
router.get('/itemdetail',function(req,res,next){
	var str='select * from listall where Id="'+req.query.id+'"';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})

//下单
router.post('/addorder',function(req,res,next){
	var add_order={
		'username':req.param('username'),
		'orderid':req.param('orderid'),
		'count':req.param('count')
	}
	pool.getConnection(function(err,connection){
		
		var str2='insert into orders(username,orderid,count) values("'+add_order.username+'","'+add_order.orderid+'","'+add_order.count+'")';
		connection.query(str2,function(error,results,fields){
				if(error){
					res.send('出错了！');
					connection.release();
					return;
				}
					connection.release();
					res.send(results);
			})
		})
})

//我的订单
router.get('/myorder',function(req,res,next){
	var str='select username,title,img,price,w_price,orderid,count from orders,listall where  listall.id=orders.orderid  and username="'+req.query.username+'"';
	pool.getConnection(function(err,connection){
		connection.query(str,function(err,results,fields){
			if(err){
				res.send('出错了');
				connection.release();
				return;
			}
			connection.release();
			res.send(results);
		})
	})
})
module.exports = router;
