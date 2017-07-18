// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueResource from 'vue-resource'
import YDUI from 'vue-ydui';
import 'vue-ydui/dist/ydui.rem.css';

Vue.use(VueResource)
Vue.use(YDUI)
Vue.config.productionTip = false

router.beforeEach(({path}, from, next) => {
  let login = sessionStorage.getItem('user') || ''  
  if (!login && path !== '/login') {                
    return next({                                   
      path: '/login'                                
    })
  }
  next()
})


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
