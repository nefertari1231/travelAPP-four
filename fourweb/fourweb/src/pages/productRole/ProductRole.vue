<template>
  <transition name="productRole" tag="div">
    <div class="bg" v-show="showProductRole">
      <template>
        <el-tree ref="expandMenuList" class="expand-tree"
                 v-if="isLoadingTree"
                 :data="setTree"
                 node-key="id"
                 highlight-current
                 :props="defaultProps"
                 :expand-on-click-node="false"
                 :render-content="renderContent"
                 :default-expanded-keys="defaultExpandKeys"></el-tree>
      </template>
      <!--
      * highlight-current ：为了点击时节点高亮
      * expand-on-click-node : 只能箭头控制树形的展开收缩
      * render-content : 节点渲染方式
      * default-expanded-keys ：默认展开节点
      -->
      <template>
        <span class="tree-expand">
          <span class="tree-label">
            <span>{{DATA.name}}</span>
          </span>
          <span class="tree-btn">
            <i class="el-icon-plus" @click.stop="nodeAdd(STORE,DATA,NODE)"></i>
            <i class="el-icon-edit" @click.stop="nodeEdit(STORE,DATA,NODE)"></i>
            <i class="el-icon-delete" @click.stop="nodeDel(STORE,DATA,NODE)"></i>
          </span>
        </span>
      </template>
    </div>
  </transition>
</template>

<script>
export default {
  name: 'productRole',
  props: ['NODE', 'DATA', 'STORE'],
  data() {
    return {
      maxexpandId: api.maxexpandId,
      // 新增节点开始id
      non_maxexpandId: api.maxexpandId,
      // 新增节点开始id(不更改)
      isLoadingTree: false,
      // 是否加载节点树
      setTree: api.treelist,
      // 节点树数据
      defaultProps: {
        children: 'children',
        label: 'name'
      },
      defaultExpandKeys: []
      // 默认展开节点列表
    }
  },
  methods: {
    show() {
      this.showProductRole = true
    },
    hide() {
      this.showProductRole = false
    },
    renderContent(h, {node, data, store}) {
      let that = this
      // 指向vue
      return h( TreeRender, {
        props: {
          DATA: data,
          // 节点数据
          NODE: node,
          // 节点内容
          STORE: store
          // 完整树形内容
        },
        on: {
          // 绑定方法
          nodeAdd: ((s, d, n) => that.handleAdd(s, d, n)),
          nodeEdit: ((s, d, n) => that.handleEdit(s, d, n)),
          nodeDel: ((s, d, n) => that.handleDelete(s, d, n))
        }
      })
    },
    handleAdd(s, d, n) {
      // 增加节点
      console.log(s, d, n)
    },
    handleEdit(s, d, n) {
      // 编辑节点
      console.log(s, d, n)
    },
    handleDelete(s, d, n) {
      // 删除节点
      console.log(s, d, n)
    },
    nodeAdd(s, d, n) {
      // 新增
      this.$emit('nodeAdd', s, d, n)
    },
    nodeEdit(s, d, n) {
      // 编辑
      this.$emit('nodeEdit', s, d, n)
    },
    nodeDel(s, d, n) {
      // 删除
      this.$emit('nodeDel', s, d, n)
    }
  }
}
</script>

<style scoped>

</style>
