<template>
  <transition name="discuss" tag="div">
    <div v-show="discussshow" class="bg">
      <div class="header">
        <div class="header-left iconfont icon-left" @click="hide()"></div>
        <div class="header-title">评论区</div>
        <div class="header-right" @click="send()">发布</div>
      </div>
      <div>
        <textarea class="content" placeholder="请进行评论" contenteditable="" rows="6" v-model="discussContent"></textarea>
        <div style="margin-left:.5rem;">
        <van-rate v-model="value" class="discussStar"/>
        <div class="content-1">
            <div
            style="margin-right:10px;"
                              v-for="(item, index) in imgArr"
                              :key="index"
                            >
                            <button
                                  type="button"
                                  style="float:left;"
                                  @click="deleteImg(index)"
                                  aria-label="Close"
                                >
                                  <span aria-hidden="true">&times;</span>
                                </button>
           <img :src="
                                    'data:image/' +
                                      imgType[index] +
                                      '+;base64,' +
                                      item
                                  " style="width:80px;height:80px;float:left;margin:0 5px;">

            </div>
          <van-uploader :after-read="onRead" accept="image/gif, image/jpeg" multiple>
            <van-icon name="photograph" class="photograph" />
          </van-uploader>
        </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import axios from 'axios'
export default {
  name: 'Discuss',
  props: {
    discussDetail: Object
  },
  data() {
    return {
      discussshow: false,
      discussContent: '',
      value: 4,
      imgData: '',
      imgArr: [],
      imgType: [],
      imgSrc: ''
    }
  },
  watch: {
    discussDetail: {
      handler (val, oldVal) {
        if (val !== oldVal) {
          this.discussDetail = val
        }
      }
    }
  },
  methods: {
    deleteImg: function(index) {
      this.imgArr.splice(index, 1)
      if (this.imgArr.length < 5) {
        this.allowAddImg = true
      }
    },
    devareImg(index) {
      this.imgArr.splice(index, 1)
      if (this.imgArr.length < 5) {
        this.allowAddImg = true
      }
    },
    onRead(file) {
      console.log(file)
      this.imgArr.unshift('')
      this.imgType.unshift('')
      var arr = file.content.split(',')
      this.imgArr.splice(0, 1, arr[1]) // 替换数组数据的方法，此处不能使用：this.imgArr[index] = url;
      this.imgType.splice(0, 1, file.file.type.split('/')[1])
    },
    show() {
      this.$nextTick(() => {
        console.log(this.discussDetail)
      })
      this.discussshow = true
    },
    hide() {
      this.discussshow = false
    },
    send() {
      axios.post('http://localhost:8090/api/order/toComment', {
        'content': this.discussContent,
        'imgArr': this.imgArr,
        'imgType': this.imgType,
        'orderSn': this.discussDetail.orderSn,
        'value': this.value
      })
        .then(response => {
          this.discussshow = false
        })
    }
  }
}
</script>

<style lang="stylus" scoped>
  .bg
    position: fixed
    background: #FFF
    z-index: 60
    top: 0
    left: 0
    right: 0
    bottom: 0
  //header
  .header
    overflow: hidden
    position: relative
    display: flex
    line-height: 1.1rem
    background: #333
    color: white
  .header-title
    width:100%
    flex: 1
    text-align: center
    font-size: .45rem
    margin-bottom: -.2rem
    margin-right: -.8rem
  .header-left
    font-size:.6rem
    margin-right: .2rem
  .header-right
    font-size:.4rem
    margin-right: .3rem
    color: #FFF
  //评论内容
  .content
    margin-top: 1.1rem
    width :90%
    padding: 0 .54rem
  .discussStar
    padding:0.2rem auto
  .content-1
    padding-top: 0.5rem
  .photograph
    font-size: 1rem
</style>
