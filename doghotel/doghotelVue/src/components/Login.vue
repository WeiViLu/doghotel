<template>
	<div>
		<!-- 选项卡 -->
		<yd-tab>
	        <yd-tab-panel label="登录">
	        	<yd-cell-group>
			        <yd-cell-item>
			            <span slot="left">用户名：</span>
			            <yd-input slot="right" required v-model="logName" max="20" placeholder="请输入用户名"></yd-input>
			        </yd-cell-item>
			        <yd-cell-item>
			            <span slot="left">密码：</span>
			            <yd-input slot="right" type="password" v-model="logPwd" placeholder="请输入密码"></yd-input>
			        </yd-cell-item>
			        <yd-button size="large" bgcolor="#20a1ff" color="#FFF" @click.native="login">登录</yd-button>
			    </yd-cell-group>
	        </yd-tab-panel>
	        <yd-tab-panel label="注册">
	        	<yd-cell-group>
			        <yd-cell-item>
			            <span slot="left">用户名：</span>
			            <yd-input slot="right" required v-model="regName" max="20" placeholder="请输入用户名"></yd-input>
			        </yd-cell-item>
			        <yd-cell-item>
			            <span slot="left">密码：</span>
			            <yd-input slot="right" type="password" v-model="regPwd" placeholder="请输入密码"></yd-input>
			        </yd-cell-item>
			        <yd-button size="large" bgcolor="#20a1ff" color="#FFF" @click.native="register">注册</yd-button>
			    </yd-cell-group>
	        </yd-tab-panel>
    	</yd-tab>
	</div>
</template>
<script type="text/javascript">
	export default{
		data(){
			return{
				logName:'',
				logPwd:'',
				regPwd:'',
				regName:'',
				timer:''
			}
		},
		methods:{
			login(){
				this.$http.post('/users/login',{
							name:this.logName,
							password:this.logPwd
						}).then(
							function(data,textStatus,xhr){
								if(data.data.msg){
									alert(data.data.msg);
								}else{
									alert('登录成功！！');
									sessionStorage.setItem('user',this.logName);
	 								this.$router.push('/index');
									document.getElementsByTagName("body")[0].style='background:#fff';
									clearInterval(this.timer);
									return;
								}
							}
						)
			},
			register(){
				this.$http.post('/users/register', {
							name:this.regName,
							password:this.regPwd
						}).then(
							function(data, textStatus, xhr) {
								if(data.data.err){
									alert('用户名已存在！');
									return;
								}else if(this.regName==""){
									alert('用户名不能为空！')
									return
								}
								alert('注册成功！');
							}
						)
			}
		},
		mounted(){
			this.$http.get('/users/bgimg')
			.then(
					function(data){
						document.getElementsByTagName("body")[0].style='background:url('+data.data[0].src+') 50% 30%';
						var i=1;
						this.timer=setInterval(function(){
							if(i==data.data.length){
								i=0;
							}
							document.getElementsByTagName("body")[0].style='background:url('+data.data[i].src+') 50% 30%';
							i++;
						},4000);
					}
				)
		}
	}
</script>
<style type="text/css">
	
</style>