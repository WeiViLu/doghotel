<template>
	 <yd-layout>
	 	<!-- 头部导航 -->
	 	<yd-navbar title="我的资料" style="background-color:#d96745" color="#fff" slot="navbar">
	        <router-link to="/ucenter" slot="left">
	            <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
	        </router-link>
    	</yd-navbar>
    	<!-- 表单 -->
    	<yd-cell-group>
            <yd-cell-item>
                <span slot="left">昵称：</span>
                <span slot="right">{{user}}</span>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">UID:</span>
                <span slot="right">{{uid}}</span>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">手机：</span>
                <span slot="right">{{phone}}</span>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">年龄：</span>
                <span slot="right">{{age}}</span>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">等级：</span>
                <span slot="right">{{level}}</span>
            </yd-cell-item>
        </yd-cell-group>
        <!-- 编辑按钮 -->
        <yd-button size="large" bgcolor="#d96745" color="#FFF" style="margin-top:267px;" @click.native="enterUpdateInfo">修改个人信息</yd-button>
    	<!-- 底部导航 -->
    	<yd-tabbar  color="#6a6565" slot="tabbar" fixed>
	        <yd-tabbar-item title="首页" link="/index">
	            <yd-icon name="home-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="商城" link="/item">
	            <yd-icon name="shopcart-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="个人中心" link="/ucenter">
	            <yd-icon name="ucenter" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
    	</yd-tabbar>
	 </yd-layout>
</template>
<script type="text/javascript">
	export default{
		data(){
			this.user = sessionStorage.getItem('user')
						this.$http.get('users/personInfo',{params:{name:this.user}}).then(
								function(data){
									this.src=data.data[0].src;
									this.uid=data.data[0].uid;
									this.age=data.data[0].age;
									this.phone=data.data[0].phone;
									this.level=data.data[0].level;
									this.user=data.data[0].username;
								}
							)
			return{
				user:'',
				src:'',
				uid:'',
				age:'',
				phone:'',
				level:''
			}
		},
		methods:{
			enterUpdateInfo(){
				this.$router.push('/updateinfo');
			}
		}
	}
</script>
<style type="text/css">
	
</style>