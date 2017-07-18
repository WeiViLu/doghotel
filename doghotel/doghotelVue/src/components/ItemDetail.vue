<template>
	<yd-layout>
		<!-- 头部导航 -->
	 	<yd-navbar :title="title" style="background-color:#d96745" color="#fff" slot="navbar">
	        <router-link to="/item" slot="left">
	            <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
	        </router-link>
    	</yd-navbar>
    	<!-- 内容详情 -->
    	<yd-list theme="5"> 
			        <yd-list-item>
			            <span slot="img"><img :src="img"></span>
			            <span slot="title">{{title}}</span>
			            <yd-list-other slot="other">
			                <div>
			                    <span class="list-price"><em>¥</em>{{price}}</span>
			                    <span class="list-del-price">¥{{w_price}}</span>
			                </div>
			                 <div><yd-spinner max="75" unit="1" v-model="spinner1"></yd-spinner></div>
			            </yd-list-other>
			        </yd-list-item>
		</yd-list>
		<!-- 下单 -->
		 <yd-button size="large" bgcolor="#d96745" color="#FFF" class="order" @click.native="addorder">下单</yd-button>
    	<!-- 底部导航 -->
    	<yd-tabbar  color="#6a6565" slot="tabbar" fixed>
	        <yd-tabbar-item title="首页" link="/index">
	            <yd-icon name="home-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="商城" link="/item">
	            <yd-icon name="shopcart" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="个人中心" link="/ucenter">
	            <yd-icon name="ucenter-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
    	</yd-tabbar>
    </yd-layout>
</template>
<script>
	export default{
		data(){
			return{
				title:'',
				price:'',
				w_price:'',
				img:'',
				spinner1:0 
			}
		},
		created(){
			this.$http.get('/users/itemdetail',{params:{id:sessionStorage.getItem('itemid')}}).then(
					function(data){
						this.title=data.data[0].title;
						this.price=data.data[0].price;
						this.w_price=data.data[0].w_price;
						this.img=data.data[0].img;
					}
				)
		},
		methods:{
			addorder() {
                this.$dialog.confirm({
                    title: '下单确认 ',
                    mes: '确定下单吗？',
                    opts: () => {
                    	this.$http.post('/users/addorder',{
                    		username:sessionStorage.getItem('user'),
                    		orderid:sessionStorage.getItem('itemid'),
                    		count:this.spinner1
                    	}).then(
                    		function(data,textStatus,xhr){
                    			this.$dialog.toast({mes: '你已经下单 ！', timeout: 1000});
                        		this.$router.push('/item');
                    		}
                    	)
                    }
                });
            }
		}
	}
</script>
<style>
	.order{
		margin-top:80px;
	}
</style>