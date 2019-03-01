<template>
  <transition name="serverout" tag="div">
    <div v-show="showServerout" class="bg">
      <div>
        <div class="header">
          <div class="header-left iconfont icon-left" @click.stop.prevent="hide()"></div>
          <div class="header-title">
            发送服务
          </div>
          <div class="header-right" @click="send()">发布</div>
        </div>
      </div>  <!--header-->
      <div class="content-bg">
        <div class="text1">
          <div class="">标题
            <input class="content-1" type="text"  placeholder="标题需要体现服务内容" v-model="serverName"/>
          </div>
        </div>
        <hr class="hro" />
        <textarea class="content" placeholder="请描述一下你的服务" contenteditable="" rows="6" v-model="serverDescription"></textarea>
        <div class="picture"></div>
        <div class="line2"></div>
        <textarea class="content" placeholder="备注注意事项" contenteditable="" rows="6" v-model="serverRemark"></textarea>
        <div class="text1">
          <div class="place-title">出游城市:
            <span class="place" @click="enterCity">{{city}} (点击切换)</span>
          </div>
          <div class="gold-title">输入金额(￥):
            <input class="content-1" type="text" v-model="serverPrice"/>
          </div>
        </div>
      </div><!--content-->
      <city ref="enteredCity" @changeCity="changeCity" :city="city"></city>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
import City from '../city/City'
export default {
  name: 'ServerOut',
  components: {City},
  data() {
    return {
      showServerout: false,
      city: '徐州市',
      serverName: '',
      serverDescription: '',
      serverPrice: '',
      serverRemark: ''
    }
  },
  methods: {
    show() {
      this.showServerout = true
    },
    hide() {
      this.showServerout = false
    },
    enterCity() {
      this.$refs.enteredCity.show()
    },
    changeCity(city) {
      this.city = city
    },
    send() {
      if (this.serverName !== '' && this.serverDescription !== '' && this.serverPrice !== '') {
        axios({
          method: 'post',
          url: 'http://localhost:8090/api/servers/saveServer',
          changeOrigin: true,
          data: {
            'serverName': this.serverName,
            'serverDescription': this.serverDescription,
            'serverPrice': this.serverPrice,
            'serverPlace': this.city,
            'serverRemark': this.serverRemark,
            'userId': this.$store.state.userId
          }
        }).then(response => {
          console.log(response)
          this.$toast.success('发布成功')
          this.hide()
          this.serverName = ''
          this.serverDescription = ''
          this.serverPrice = ''
          this.serverRemark = ''
        }).catch(error => {
          console.log(error)
        })
      } else {
        this.$toast('请填完整信息')
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 100
    top: 0
    left: 0
    right: 0
    bottom: 0
    color: #666
  .serverout-enter-active,.serverout-leave-active
    transition: all 0.3s
  .serverout-enter, .serverout-leave-to
    opacity: 0
    transform: translate3d( 0, 100%, 0)
  .header
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:1.2rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
  .header-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  .header-right
    font-size:.4rem
    margin-right: .3rem
    color: #FFF
  //content
  .text1
    margin: .25rem 0 0.1rem 0.5rem
    font-size : .4rem
  .content-1
    margin-top: -0.05rem
    margin-left .2rem
    font-size .3rem
  .hro
    width: 90%
    margin : 0 auto
  .content
    margin-top: 0.35rem
    width :100%
    padding: 0 .54rem
  .picture
    margin-left: 0.5rem
    width: 1.2rem
    height: 1.2rem
    border: 0.02rem dashed #aaa
    background: url(http://img04.yesmyimg.com/images/event/2014/11/018403/icon.png) no-repeat center
  .line2
    margin-top: .3rem
    height: .1rem
    background: #ddd
  .gold-title
    font-size : 0.35rem
  .place-title
    font-size: 0.35rem
    margin-bottom : 0.2rem
  .place
    font-size: 0.3rem
</style>
