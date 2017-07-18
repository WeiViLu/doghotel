<template>
	<yd-layout>
		<!-- 头部导航 -->
	 	<yd-navbar title="我的订单" style="background-color:#d96745" color="#fff" slot="navbar">
	        <router-link to="/ucenter" slot="left">
	            <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
	        </router-link>
    	</yd-navbar>
    	<!-- 我的订单 -->
    	<yd-cell-group>
	        <yd-cell-item arrow  v-for="item in listorder">
	            <span slot="left">商品名称：{{item.title}}</span>
	            <span slot="right">数量:{{item.count}}</span>
	        </yd-cell-item>
    	</yd-cell-group>
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
<script>
	export default{
		data(){
			return{
				listorder:[]
			}
		},
		created(){
			this.$http.get('/users/myorder',{params:{username:sessionStorage.getItem('user')}}).then(
				function(data){
					this.listorder=data.data;
					console.log(data.data);
				}
			)
		}
	}
</script>
<style>
</style>