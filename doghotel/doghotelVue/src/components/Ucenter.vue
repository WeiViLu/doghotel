<template>
	<yd-layout>
		<!-- 头部导航 -->
		<yd-navbar slot="navbar" >
	        <router-link to="/index" slot="left">
	            <yd-navbar-back-icon color="#d96745" ></yd-navbar-back-icon>
	        </router-link>

	        <img slot="center" src="static/dogicon.jpg"/>

	        <router-link to="#" slot="right">
	            <yd-icon name="search" size="25px" color="#d96745"></yd-icon>
	        </router-link>
    	</yd-navbar>

    	<!-- 个人信息 -->
  		<yd-cell-group>
            <yd-cell-item href="/personinfo" type="link">
                <span slot="left" style="margin-left:20px"><img :src="src" style="width:100px;height:100px;"></span>
                <span slot="right" style="font-size:15px;margin-right:80px;color:#d96745">
                	<span>昵称：{{user}}</span><br>
                    <span style="margin-right:12px;"> UID：{{uid}}</span>
                </span>
            </yd-cell-item>
        </yd-cell-group>
        <!-- 我的收藏 -->
        <!-- 我的订单 -->
        <yd-cell-group color="#d96745">
	        <yd-cell-item arrow href="/myorder" type="link" color="#d96745">
	            <yd-icon slot="icon" name="order" size=".42rem" color="#d96745"></yd-icon>
	            <span slot="left" style="color:#d96745">我的订单</span>
	            <span slot="right" style="color:#d96745">查看全部订单</span>
	        </yd-cell-item>
	        <yd-cell-item arrow href="/addlike" type="link" >
	            <yd-icon slot="icon" name="like-outline" size=".42rem" color="#d96745"></yd-icon>
	            <span slot="left" style="color:#d96745">我的收藏</span><yd-badge type="danger" slot="right">{{bandage}}</yd-badge>
	        </yd-cell-item>
    	</yd-cell-group>
        <!-- 登出 -->
        <div >
	        <yd-button @click.native="show1 = true" size="large" id="loginout" >登出</yd-button> 
	        <yd-actionsheet :items="myItems1" v-model="show1" cancel="取消"></yd-actionsheet>
   		 </div>
    	<!-- 底部导航 -->
    	<yd-tabbar  color="#6a6565" slot="tabbar" fixed>
	        <yd-tabbar-item title="首页" link="/index">
	            <yd-icon name="home-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="商城" link="/item">
	            <yd-icon name="shopcart-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="个人中心" link="#">
	            <yd-icon name="ucenter" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
    	</yd-tabbar>
	</yd-layout>
</template>
<script type="text/javascript">
	export default{
		data(){

			return{
				bandage:'',
				user:'',
				src:'',
				uid:'',
				age:'',
				phone:'',
				level:'',
				show1: false,
                myItems1: 
                    [	
                    	{
	                        label: '退出',
	                        method: () => {
	                            this.$dialog.toast({mes: '您已退出，请重新登录！'});
	                            sessionStorage.setItem('user','');
		 						this.$router.push('/login');
	                            /* 注意： method: function() {} 和 method() {}  这样是无法正常使用当前this的 */
	                        }
                        }
                    ]
                
			}
		},
		created(){
			this.user = sessionStorage.getItem('user')
			this.$http.get('users/personInfo',{params:{name:this.user}}).then(
					function(data){
						this.src=data.data[0].src;
						this.uid=data.data[0].uid;
						this.age=data.data[0].age;
						this.phone=data.data[0].phone;
						this.level=data.data[0].level;
					}
				)
			this.$http.get('/users/mylike',{params:{username:sessionStorage.getItem('user')}}).then(
					function(data){
						this.bandage=data.data.length;
					}
				)
		}
	}
</script>
<style>
#loginout{
	margin-top:300px;
	color:#fff;
	background:#d96745;
}
</style>