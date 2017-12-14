<template>
  <div @viewappear="viewappear" @clickrightitem="clickrightitem">
    <list :class="[listClass]">
    <cell>
      <adv adId=153 :style="{'width':'750px','height':advHeight}" @advdidload="advdidload"></adv>
    </cell>
    <cell class="cell" v-for="(item,index) in lists" :key="item" @click="jumpBiaozhi(item)">
      <div class="titleline">
        <text class="title">{{item.title}}</text>
        <text class="subtitle">{{item.imgCount}}张图片</text>
      </div>
      <div class="imageLine">
        <image class="biaozhi" :src="'localpath:'+item.image1"></image>
        <image class="biaozhi" :src="'localpath:'+item.image2"></image>
        <image class="biaozhi" :src="'localpath:'+item.image3"></image>
        <image class="biaozhi" :src="'localpath:'+item.image4"></image>
      </div>
    </cell>
    <header>
      <div class="header1" @click="jumpWithMucangProtocol">
        <text class="title1">答题技巧</text><text class="subtitle1">教练总结，让你事半功倍</text>
      </div>
    </header>
    <cell class="cell1" v-for="(item1,index) in lists1" :key="item1" @click="jumpArtical(item1)">
      <div class="jiqiaoRow">
        <div style="flex-direction:row;align-items:center">
          <div class='rowIcon' :style="{'background-color':colorList[index % 6]}">
            <text style="color:#ffffff;text-align:left;" @click="logTest">{{index+1}}</text>
          </div>
          <text class="jiqiaoTitle">{{item1.title}}</text>
        </div>
        <div style="align-items:center;justify-content:center;">
          <image style="width:8wx;height:13wx;" src="localimg:jiakao__ic_arrow_right"></image>
        </div>
      </div>
    </cell>

    <header>
      <div class="header1" @click="jumpToIndex">
        <text class="title1">最新法规</text>
      </div>
    </header>
    <cell class="cell1" v-for="(item2,index) in lists2" :key="item2" @click="jumpArtical(item2)">
      <div class="jiqiaoRow">
        <div style="flex-direction:row;align-items:center">
          <div class='rowIcon' :style="{'background-color':colorList[index % 6]}">
            <text style="color:#ffffff;text-align:left;" @click="logTest">{{index+1}}</text>
          </div>
          <text class="jiqiaoTitle">{{item2.title}}</text>
        </div>
        <div style="align-items:center;justify-content:center;">
          <image style="width:8wx;height:13wx;" src="localimg:jiakao__ic_arrow_right"></image>
        </div>
      </div>
    </cell>
  </list>
</div>
</template>
<script>
  
  var eventModule = weex.requireModule('fyModule')

  var tubiaoList = eventModule.getBiaozhiList()

  var jiqiaoList = eventModule.getJiqiaoList()

  var faguiList = eventModule.getFaguiList()

  var lc = (weex.config.env.platform == "iOS" ? "listIOS" : "list")
  var colors = ['#fc7878','#25c8da','#faa912','#81a0ff','#5acb5a','#bc7cfc']

  var navigator = weex.requireModule('navigator')

  var modal = weex.requireModule('modal')
  export default {
    data () {
      return {
        lists: tubiaoList,
        lists1: jiqiaoList,
        lists2: faguiList,
        listClass: lc,
        colorList: colors,
        advHeight: '0px',
      }
    },
    methods: {
      viewappear() {
        console.log('viewappear')
        navigator.setNavBarRightItem({title:"get请求",titleColor:"#333333"},function(){})
      },
      advdidload() {
        this.advHeight = 750 * 100 / 640 + 'px';
      },
      clickrightitem() {
        console.log('right item click')
        eventModule.httpGet("/api/open/zuozhan/get-data.htm",function(rt) {
          console.log(rt)
          modal.toast({message:"返回了url:"+rt.url+"的结果",duration:5})
        })
      },
      logTest(e) {
        console.log("--------------")
        console.log(listStyle);
      },

      jumpToIndex(event) {
        console.log('will push')
        
        navigator.push({
          url: 'http://192.168.200.181:8081/dist/index.js',
          animated: "true"
        }, event => {
          // modal.toast({ message: 'callback1:' + event})
        })
      },

      jumpWithMucangProtocol(event) {

        eventModule.openUrl("http://jiakao.nav.mucang.cn/doExam?type=zhineng",function(rt) {
          modal.toast({ message: 'callback2:' + rt})
        })

      },

      jumpBiaozhi(p) {
        console.log(p)
        eventModule.jumpBiaozhi(p);
      },
      jumpArtical(p) {
        eventModule.jumpArtical(p)
      }
    }
  }
</script>
<style scoped>
  .list {
    background-color: #ffffff;
    margin-bottom: 0wx;
  }
  .listIOS {
    background-color: #ffffff;
    margin-bottom: 64wx;
  }
  .titleline {
    flex-direction: row;
    justify-content: space-between;
    height: 60px;
    margin-top: 20px;
    margin-left: 30px;
    margin-right: 30px;
  }
  .title {
    font-size: 28px;
    text-align: left;
    color: #333333;
  }
  .subtitle {
    font-size: 28px;
    text-align: right;
    color: #666666;
  }
  .imageLine {
    flex-direction: row;
    justify-content: left;
    height: 120px;
    padding: 10px;
  }
  .biaozhi {
    width: 100px;
    height: 100px;
    margin-left: 30px;
    margin-right: 30px;
  }
  .list1 {

  }
  .header1 {
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 88px;
    background-color: #eeeeee;
  }
  .rowIcon {
    margin-right:15wx;
    justify-content:center;
    align-items:center;
    width:33wx;
    height:33wx;
    border-radius: 5wx;
  }
  .title1 {
    font-size: 32px;
    color: #333333;
    margin-left: 30px;
  }
  .subtitle1 {
    font-size: 28px;
    color: #666666;
    margin-right: 30px;
  }
  .jiqiaoTitle {
    font-size: 14wx;
    color: #333333;
  }
  .jiqiaoRow {
    flex-direction: row;
    justify-content: space-between;
    height: 44wx;
    margin-left: 30px;
    margin-right: 30px;
  }
</style>