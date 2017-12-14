<template>
  <div class="wrapper" @click="update"  @nativeCall="nativeCall"  @viewappear="viewappear">
    <image :src="logoUrl" class="logo"></image>
    <text class="title">Hello {{target}}  </text>
    <text class="desc">Now, let's use vue to build your weex app.</text>
  </div>
</template>

<style>
  .wrapper { align-items: center; margin-top: 120px; }
  .title { padding-top:40px; padding-bottom: 40px; font-size: 48px; }
  .logo { width: 360px; height: 156px; }
  .desc { padding-top: 20px; color:#888; font-size: 24px;}
</style>

<script>

  var navigator = weex.requireModule('navigator')

  export default {  
    data: {
      logoUrl: 'http://img1.vued.vanthink.cn/vued08aa73a9ab65dcbd360ec54659ada97c.png',
      target: 'World33333'
    },
    methods: {
      viewappear() {
        console.log('viewappear--------------')
        navigator.setNavBarTitle({title:"Demo 首页"},function() {
        })
      },

      update: function (e) {
        this.target = 'Weex'
        console.log('target:', this.target)
      },

      nativeCall: function (e) {
          this.target = 'js响应了native按钮的点击'
          console.log('js响应了native按钮的点击:',e)
      },


      nativeCall1: function (e) {
          this.target = 'js响应了native按钮的点击'
          console.log('js响应了native按钮的点击:',e)
      }
    }
  }
</script>