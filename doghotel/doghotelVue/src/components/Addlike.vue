<template>
	<yd-layout>
		<!-- 头部导航 -->
	 	<yd-navbar title="我的收藏" style="background-color:#d96745" color="#fff" slot="navbar">
	        <router-link to="/ucenter" slot="left">
	            <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
	        </router-link>
    	</yd-navbar>
    	<!--  -->
    	<yd-list theme="5" class="tabbar"> 
			        <yd-list-item v-for="item in listlike">
			            <img slot="img" :src="item.img">
			            <span slot="title">{{item.title}}</span>
			            <yd-list-other slot="other">
			                <div>
			                    <span class="list-price"><em>¥</em>{{item.price}}</span>
			                    <span class="list-del-price">¥{{item.w_price}}</span>
			                </div>
			                <div><yd-button @click.native="cancel" size="small" :id="item.likeid">取消收藏</yd-button></div>
			            </yd-list-other>
			        </yd-list-item>
		</yd-list>
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
				listlike:[]
			}
		},
		methods:{
			cancel(e){
				this.$dialog.confirm({
                    mes: '确定要取消收藏吗？',
                    opts: () => {
                    	this.$http.post('/users/cancellike',{
							likeid:e.target.id,
							username:sessionStorage.getItem('user')
						}).then(
							function(data,textStatus,xhr){
								this.$dialog.toast({mes: '您已经取消收藏！', timeout: 1000});
								this.$http.get('/users/mylike').then(
									function(data){
										this.listlike=data.data;
									}
								)
							}
						)
                    }
                });
			}
		},
		created(){
			this.$http.get('/users/mylike',{params:{username:sessionStorage.getItem('user')}}).then(
					function(data){
						console.log(sessionStorage.getItem('user'));
						this.listlike=data.data;
					}
				)
		}
	}
</script>
<style>
	.tabbar{
		padding-bottom: 1.3rem;
	}
</style>