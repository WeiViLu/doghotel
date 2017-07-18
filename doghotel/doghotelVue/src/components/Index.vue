<template>
	<yd-layout>
		<!-- 头部导航 -->
		<yd-navbar title="汪星人旅馆" color="#d96547" slot="navbar">
	        <router-link to="#" slot="left">
	            <yd-icon name="shopcart-outline" size="25px" color="#d96547"></yd-icon>
	        </router-link>

	        <router-link to="#" slot="right">
	            <yd-icon name="location" size="25px" color="#d96547"></yd-icon>
	        </router-link>
    	</yd-navbar>
    	<!-- 轮播图 -->
    	<yd-slider autoplay="3000">
	        <yd-slider-item v-for="item in slider">
	            <a href="http://www.ydcss.com">
	                <img :src="item.src">
	            </a>
	        </yd-slider-item>
    	</yd-slider>
    	<!-- 广告 -->
    	<yd-rollnotice autoplay="2000">
	        <yd-rollnotice-item v-for="item in ads"><span style="color:#F00;"> 优惠龙卷风！</span>{{item.msg}}</yd-rollnotice-item>
    	</yd-rollnotice>
    	<!-- 网格 -->
    	<yd-grids-group :rows="2">
	        <yd-grids-item link="/item">
	            <yd-icon slot="icon" name="shopcart-outline" color="#FF685D"></yd-icon>
	            <span slot="text" style="color:#6a6565">商城</span>
	        </yd-grids-item>
	        <yd-grids-item link="/ucenter">
	            <yd-icon slot="icon" name="setting" color="#FF685D"></yd-icon>
	            <span slot="text" style="color:#6a6565">设置</span>
	        </yd-grids-item>
	         <yd-grids-item>
	             <yd-icon slot="icon" name="phone2" color="#FF685D"></yd-icon>
	            <span slot="text" style="color:#6a6565">联系我们</span>
	        </yd-grids-item>
	        <yd-grids-item>
	            <yd-icon slot="icon" name="search" color="#FF685D"></yd-icon>
	            <span slot="text" style="color:#6a6565">搜索</span>
	        </yd-grids-item>
    	</yd-grids-group>
    	<!-- 数字动画 -->
    	<yd-grids-group style="font-size:30px;height:150px;line-height:150px;color:#d96745;text-align:center">
    		<yd-countup
            endnum="555569"
            duration="3"
            decimals="2"
            separator=","
            prefix="已有"
            suffix="人访问"
    		></yd-countup>
    	</yd-grids-group>
    	<!-- 底部导航 -->
    	<yd-tabbar  color="#6a6565" slot="tabbar" fixed>
	        <yd-tabbar-item title="首页" link="#" >
	            <yd-icon name="home" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="商城" link="/item">
	            <yd-icon name="shopcart-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="个人中心" link="/ucenter">
	            <yd-icon name="ucenter-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
    	</yd-tabbar>
	</yd-layout>
</template>
<script type="text/javascript">
	export default{
		data(){
			return{
				slider:[],
				ads:[]
			}
		},
		mounted(){
			this.$http.get('/users/slider').then(
					function(data){
						this.slider=data.data;
					}
			)
			this.$http.get('/users/ads').then(
					function(data){
						this.ads=data.data;
					}
			)
		}
	}
</script>
<style type="text/css"></style>