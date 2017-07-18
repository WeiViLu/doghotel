<template>
	<yd-layout>
	 	<!-- 头部导航 -->
	 	<yd-navbar title="我的资料" style="background-color:#d96745" color="#fff" slot="navbar">
	        <router-link to="/personinfo" slot="left">
	            <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
	        </router-link>
    	</yd-navbar>
    	<!-- 表单 -->
    	<yd-cell-group>
            <yd-cell-item>
                <span slot="left">昵称：</span>
                <yd-input slot="right" :placeholder="user" readonly></yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">UID:</span>
                <yd-input slot="right"  v-model="uid">{{uid}}</yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">手机：</span>
                <yd-input slot="right"  v-model="phone">{{phone}}</yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">年龄：</span>
                <yd-input slot="right"  v-model="age">{{age}}</yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <span slot="left">等级：</span>
                <yd-input slot="right"  v-model="level">{{level}}</yd-input>
            </yd-cell-item>
        </yd-cell-group>
        <!-- 确定按钮 -->
        <yd-button @click.native="openConfrim" size="large" style="margin-top:267px;" bgcolor="#d96745" color="#FFF">确定</yd-button>
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
			 openConfrim() {
                this.$dialog.confirm({
                    mes: '保存当前信息吗？',
                    opts: () => {
                        // this.$dialog.toast({mes: '你点了确定', timeout: 1000});
                        this.$http.post('/users/updateinfo',{
                            user:this.user,
                            uid:this.uid,
                            age:this.age,
                            phone:this.phone,
                            level:this.level
                        }).then(
                            function(data,textStatus,xhr){
                                this.$dialog.toast({mes: '修改成功！', timeout: 1000});
                            }
                        )

                    }
                });
            }
		}
	}
</script>
<style>
	
</style>