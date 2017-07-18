<template>
	<yd-layout>
		<!-- 头部导航 -->
		<yd-navbar slot="navbar" >
	        <router-link to="/index" slot="left">
	            <yd-navbar-back-icon color="#d96745" ></yd-navbar-back-icon>
	        </router-link>

	        <img slot="center" src="static/dogicon.jpg"/>

	        <router-link to="#" slot="right">
	            <yd-icon name="type" size="25px" color="#d96745"></yd-icon>
	        <!--     <div id="menu" class="animated slideIndown" v-if="show">
	            	<ul>
	            		<li>全部</li>
	            		<li>大型</li>
	            		<li>中型</li>
	            		<li>小型</li>
	            	</ul>
	            </div> -->
	        </router-link>
    	</yd-navbar>
		<!-- 选项卡 -->
		<yd-tab>
	        <yd-tab-panel label="全部" class="tabbar">
	        	<yd-list theme="4"> 
			        <yd-list-item v-for="item in listall">
			            <img slot="img" :src="item.img" :item="item.Id" @click="itemdetail">
			            <span slot="title">{{item.title}}</span>
			            <yd-list-other slot="other">
			                <div>
			                    <span class="list-price"><em>¥</em>{{item.price}}</span>
			                    <span class="list-del-price">¥{{item.w_price}}</span>
			                </div>
			                <div><yd-icon :id="item.Id" name="like-outline" size="25px" color="#d96745" @click.native="addlike"></yd-icon></div>
			            </yd-list-other>
			        </yd-list-item>
			    </yd-list>
	        </yd-tab-panel>
	        <yd-tab-panel label="大型" class="tabbar">
	        	<yd-list theme="3"> 
			        <yd-list-item v-for="item in listbig">
			            <img slot="img" :src="item.img">
			            <span slot="title">{{item.title}}</span>
			            <yd-list-other slot="other">
			                <div>
			                    <span class="list-price"><em>¥</em>{{item.price}}</span>
			                    <span class="list-del-price">¥{{item.w_price}}</span>
			                </div>
			                <div><yd-icon name="like-outline" size="25px" color="#d96745" ></yd-icon></div>
			            </yd-list-other>
			        </yd-list-item>
			    </yd-list>
	        </yd-tab-panel>
	        <yd-tab-panel label="中型" class="tabbar">
	        	<yd-list theme="5"> 
			        <yd-list-item v-for="item in listmiddle">
			            <span slot="img"><img :src="item.img"></span>
			            <span slot="title">{{item.title}}</span>
			            <yd-list-other slot="other">
			                <div>
			                    <span class="list-price"><em>¥</em>{{item.price}}</span>
			                    <span class="list-del-price">¥{{item.w_price}}</span>
			                </div>
			                 <div><yd-icon name="like-outline" size="25px" color="#d96745" ></yd-icon></div>
			            </yd-list-other>
			        </yd-list-item>
			    </yd-list>
	        </yd-tab-panel>
	        <yd-tab-panel label="小型" class="tabbar">
	        	<yd-list theme="5"> 
			        <yd-list-item v-for="item in listsmall">
			            <img slot="img" :src="item.img">
			            <span slot="title">{{item.title}}</span>
			            <yd-list-other slot="other">
			                <div>
			                    <span class="list-price"><em>¥</em>{{item.price}}</span>
			                    <span class="list-del-price">¥{{item.w_price}}</span>
			                </div>
			                <div><yd-icon name="like-outline" size="25px" color="#d96745" class="addlike" ></yd-icon></div>
			            </yd-list-other>
			        </yd-list-item>
			    </yd-list>
	        </yd-tab-panel>
   		</yd-tab>
		<!-- 底部导航 -->
		<yd-tabbar color="#6a6565" slot="tabbar" fixed>
	        <yd-tabbar-item title="首页" link="/index" >
	            <yd-icon name="home-outline" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
	        </yd-tabbar-item>
	        <yd-tabbar-item title="商城" link="#" >
	            <yd-icon name="shopcart" slot="icon" size="0.54rem" color="#d96745"></yd-icon>
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
				listall:[],
				listbig:[],
				listsmall:[],
				listmiddle:[],
				page: 1,
                pageSize: 10,
			}
		},
		methods:{
			enterIndex(){
				this.$router.push('/index');
			},
			enterUcenter(){
				this.$router.push('/ucenter');
			},
			addlike(e) {
				if(e.target.getAttribute('class')=='icon-like-outline'){
					this.$http.post('/users/addlike',{
						likeid:e.target.id,
						username:sessionStorage.getItem('user')
					}).then(
						function(data,textStatus,xhr){
							if(data.data.err){
								this.$dialog.toast({mes:'您已经添加过了，不能重复添加！'});
								return;
							}
							e.target.setAttribute('class','icon-like')
							this.$dialog.toast({mes: '您已经添加到收藏夹！'});
						}
					)
				}
				else{
					this.$http.post('/users/cancellike',{
						likeid:e.target.id,
						username:sessionStorage.getItem('user')
					}).then(
						function(data,textStatus,xhr){
							this.$dialog.toast({mes: '您已经取消收藏！'});
							e.target.setAttribute('class','icon-like-outline');
						}
					)
					
				}
			},
			itemdetail(ev){
				sessionStorage.setItem('itemid',ev.target.getAttribute('item'));
				this.$router.push('/itemdetail');
			}
		},
		created(){
			this.$http.get('/users/listall').then(
					function(data){
						this.listall=data.data;
					}
			)
			this.$http.get('/users/listbig').then(
					function(data){
						this.listbig=data.data;
					}
			)
			this.$http.get('/users/listmiddle').then(
					function(data){
						this.listmiddle=data.data;
					}
			)
			this.$http.get('/users/listsmall').then(
					function(data){
						this.listsmall=data.data;
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