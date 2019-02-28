<template>
  <transition name="updateArea" tag="div">
    <div class="bg" v-show="showUpdateArea">
      <div>
        <div class="header-fixed">
          <div class="header-left iconfont icon-left" @click="hide()"></div>
          <div class="header-title">
            修改地区
          </div>
        </div>
      </div> <!--header-->
      <div class="content" @click="areaSelect">
        <div class="item-info">
          <p class="item-title">地区</p>
          <p class="item-desc">{{this.$store.state.userArea}}</p>
        </div>
      </div>
      <van-popup v-model="showArea" position="bottom" :overlay="true">
      <van-area :area-list="areaList" value="110101" title="请选择地区" @change="onChange" @cancel="onCancel" @confirm="onConfirm"/>
      </van-popup>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
export default {
  name: 'UpdateArea',
  data () {
    return {
      showUpdateArea: false,
      area: 'haha',
      showArea: false,
      areaList: {
        province_list: {},
        city_list: {},
        county_list: {}
      }
    }
  },
  mounted () {
    this.getAreaInfo()
  },
  methods: {
    show() {
      this.showUpdateArea = true
    },
    hide() {
      this.showUpdateArea = false
    },
    getAreaInfo () {
      axios.get('/api/area.json')
        .then(this.handleGetAreaInfoSucc)
    },
    handleGetAreaInfoSucc (res) {
      res = res.data
      if (res.ret && res.data) {
        const data = res.data.areaList
        this.areaList.city_list = data.cityList
        this.areaList.province_list = data.provinceList
        this.areaList.county_list = data.countyList
      }
    },
    areaSelect() {
      this.showArea = true
    },
    onChange(picker, value, index) {
      this.area = value[0].name + ' ' + value[1].name + ' ' + value[2].name
    },
    onCancel() {
      this.showArea = false
    },
    onConfirm() {
      axios({
        method: 'put',
        url: 'http://localhost:8090/api/users/update',
        changeOrigin: true,
        data: {
          'userId': this.$store.state.userId,
          'userArea': this.area
        }
      }).then(response => {
        if (response.data.status === 200) {
          this.$toast.success('修改成功')
          this.$store.dispatch('updateuserArea', this.area)
          this.showArea = false
          this.hide()
        } else if (response.data.status === 500) {
          this.$toast.fail('修改失败')
        }
      }).catch(error => {
        console.log(error)
      })
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 99
    top: 0
    left: 0
    right: 0
    bottom: 0
  .updateArea-enter-active,.updateArea-leave-active
    transition: all 0.3s
  .updateArea-enter, .updateArea-leave-to
    opacity: 0
    transform: translate3d(100%, 0, 0)
  //header
  .header-fixed
    z-index: 30
    position: fixed
    top: 0
    left: 0
    right: 0
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:.86rem
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    margin-left: -.9rem
  .icon-left
    font-size:.5rem
    margin-left: .3rem
    color: #FFF
  //content
  .content
    margin-top: 1.2rem
  .item-title
    height: 0.8rem
    line-height: 0.8rem
    float: left
    font-size: .35rem
    margin-left: .2rem
    color #aaa
    margin-right :.2rem
  .item-desc
    height: 0.8rem
    line-height: 0.8rem
    font-size: .33rem
    float right
    margin-right .4rem
</style>
