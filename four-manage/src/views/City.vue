<template>
  <section style="margin-top: 20px">
    <!--列表-->
    <el-table :data="city" style="width: 100%" :row-key="getRowKey" :expand-row-keys="expand">
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-table
            :data="props.row.cityMenus"
            :row-key="getRowKeys"
            :expand-row-keys="expands"
            style="width: 100%"
          >
            <el-table-column type="expand">
              <template slot-scope="prop">
                <el-table :data="foods" style="width: 100%">
                  <el-table-column prop="foodsId" label="ID"></el-table-column>
                  <el-table-column prop="foodsName" label="名称"></el-table-column>
                  <el-table-column label="操作" width="250">
                    <template slot-scope="props">
                      <el-button
                        type="warning"
                        size="mini"
                        @click="handleEdit(props.$index, props.row)"
                      >修改</el-button>
                      <el-button type="danger" size="mini" @click="delFoods(props.row.foodsId,props.row.citymenuId)">删除</el-button>
                    </template>
                  </el-table-column>
                </el-table>
              </template>
            </el-table-column>
            <el-table-column prop="citymenuId" label="城市 ID"></el-table-column>
            <el-table-column prop="citymenuName" label="城市名称"></el-table-column>
            <el-table-column label="操作" width="300">
              <template slot-scope="props">
                <el-button type="primary" size="mini" @click="toggleRowExpansions(props.row)">查看</el-button>
                <el-button
                  type="primary"
                  size="mini"
                  @click="handleAdd(props.$index, props.row)"
                >发布</el-button>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="省份 ID" prop="cityId"></el-table-column>
      <el-table-column label="省份名称" prop="cityName"></el-table-column>
      <el-table-column label="操作" width="250">
        <template slot-scope="props">
          <el-button type="primary" size="mini" @click="toggleRowExpansion(props.row)">查看城市</el-button>
          <el-button
                  type="primary"
                  size="mini"
                  @click="handleAddCity(props.$index, props.row)"
                >发布</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--新增界面-->
    <el-dialog title="编辑" :visible.sync="editFormVisible" :close-on-click-modal="false">
      <el-form :model="editForm" label-width="80px" ref="editForm">
        <el-form-item label="名称" prop="foodsName">
          <el-input v-model="editForm.foodsName" auto-complete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="editFormVisible = false">取消</el-button>
        <el-button type="primary" @click.native="editSubmit" :loading="editLoading">提交</el-button>
      </div>
    </el-dialog>

    <!--新增-->
    <el-dialog title="新增" :visible.sync="addFormVisible" :close-on-click-modal="false">
      <el-form :model="addForm" ref="addForm">
        <el-form-item label="名称">
          <el-input v-model="addForm.foodsName" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item>
          <input type="file" accept="image/*" multiple="multiple" @change="changeImg($event)">
          <div class="img_box" v-for="(item, index) in imgArr" :key="index">
            <div class="img_show_box">
              <img
                :src="
                                    'data:image/' +
                                      imgType[index] +
                                      '+;base64,' +
                                      item
                                  "
                style="float:left;width:100px;height:100px;margin:5px;"
              >
              
              <button
                type="button"
                style="float:left;background: #fff;border: none;"
                @click="deleteImg(index)"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="addFormVisible = false">取消</el-button>
        <el-button type="primary" @click.native="addSubmit" :loading="addLoading">提交</el-button>
      </div>
    </el-dialog>

    <!--城市新增-->
     <el-dialog title="新增" :visible.sync="addCityFormVisible" :close-on-click-modal="false">
      <el-form :model="addCityForm" ref="addForm">
        <el-form-item label="名称">
          <el-input v-model="addCityForm.citymenuName" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="名称">
          <el-input
            type="textarea"
            v-model="addCityForm.citymenuIntro" auto-complete="off"
            :rows="2"
            placeholder="请输入内容"
            >
          </el-input>
        </el-form-item>
        <el-form-item>
          <input type="file" accept="image/*" multiple="multiple" @change="changeImg($event)">
          <div class="img_box" v-for="(item, index) in imgArr" :key="index">
            <div class="img_show_box">
              <img
                :src="
                                    'data:image/' +
                                      imgType[index] +
                                      '+;base64,' +
                                      item
                                  "
                style="float:left;width:100px;height:100px;margin:5px;"
              >
              
              <button
                type="button"
                style="float:left;background: #fff;border: none;"
                @click="deleteImg(index)"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="addCityFormVisible = false">取消</el-button>
        <el-button type="primary" @click.native="addCitySubmit" :loading="addCityLoading">提交</el-button>
      </div>
    </el-dialog>

  </section>
</template>

<script>
import {
  getCityList,
  getFoodsByCity,
  updateFoodsById,
  delFoodsById,
  insertFoods,
  insertCity
} from "../api/api";
export default {
  data() {
    return {
      imgData: "",
      imgArr: [],
      imgType: [],
      imgSrc: "",
      allowAddImg: true,
      filters: "",
      city: [],
      foods: [],
      foodsName: '',
      editFormVisible: false, //编辑界面是否显示
      addFormVisible: false, //新增界面是否显示
      addCityFormVisible:false,
      addCityForm: {},
      addCityLoading:false,
      getRowKeys(row) {
        return row.citymenuId;
      },
      editLoading: false,
      addLoading: false,
      editForm: [],
      addForm: {},
      getRowKey(row) {
        return row.cityId;
      },
      expands: [],
      expand: []
    };
  },
  methods: {
    handleAddCity(index, row) {
      this.addCityForm.cityId = row.cityId;
      this.addCityFormVisible = true;
    },
    //删除食品
    delFoods(id,citymenuId) {
      let par = {
        cityMenuId: id
      }
      delFoodsById(id)
        .then(result => {
          this.$notify({
            title: "成功",
            message: "删除成功",
            type: "success"
          });
          this.getAllFoodsByCity(citymenuId);
        })
        .catch(err => {
          this.$notify.error({
            title: "错误",
            message: "删除失败"
          });
        });
    },
    //一级表格展开
    toggleRowExpansions(row) {
      this.getAllFoodsByCity(row.citymenuId);
      this.tableLoading = true;
      if (this.expands.indexOf(row.citymenuId) == 0) {
        this.expands = [];
      } else {
        this.expands = [];
        this.expands.push(row.citymenuId);
        this.tableLoading = false;
      }
    },
    //二级表格展开
    toggleRowExpansion(row) {
      console.log(row.cityId)
      this.tableLoading = true;
      if (this.expand.indexOf(row.cityId) == 0) {
        this.expand = [];
      } else {
        this.expand = [];
        this.expand.push(row.cityId);
        this.tableLoading = false;
      }
    },
    //显示编辑界面
    handleEdit: function(index, row) {
      this.editFormVisible = true;
      this.editForm = Object.assign({}, row);
    },
    handleAdd: function(index, row) {
      this.addForm.citymenuId = row.citymenuId;
      this.addFormVisible = true;
    },
    //获取城市下商品
    getAllFoodsByCity(id) {
      getFoodsByCity(id).then(result => {
        this.foods = result.data;
      });
    },
    //获取城市数据
    getCityAll() {
      getCityList({}).then(result => {
        this.city = result.data;
      });
    },
    //编辑
    editSubmit: function() {
      this.$refs.editForm.validate(valid => {
        if (valid) {
          this.$confirm("确认提交吗？", "提示", {}).then(() => {
            this.editLoading = true;
            let par = Object.assign({},this.editForm)
            updateFoodsById(par).then(res => {
              this.editLoading = false;
              //NProgress.done();
              this.$message({
                message: "提交成功",
                type: "success"
              });
              this.$refs["editForm"].resetFields();
              this.editFormVisible = false;
              this.getAllFoodsByCity(par.citymenuId);
            });
          });
        }
      });
    },
    addSubmit: function() {
      this.$refs.addForm.validate(valid => {
        if (valid) {
          this.$confirm("确认提交吗？", "提示", {}).then(() => {
            this.addLoading = true;
            //NProgress.start();
            this.addForm.foodsImg = this.imgArr[0];
            let par = Object.assign({},this.addForm)
            insertFoods(par).then(result => {
              this.addLoading = false;
              //NProgress.done();
              this.$message({
                message: "添加成功",
                type: "success"
              });
              this.$refs["addForm"].resetFields();
              this.addFormVisible = false;
              this.imgArr = [];
               this.getAllFoodsByCity(par.citymenuId);
            });
          });
        }
      });
    },
    addCitySubmit: function() {
      this.$refs.addForm.validate(valid => {
        if (valid) {
          this.$confirm("确认提交吗？", "提示", {}).then(() => {
            this.addLoading = true;
            //NProgress.start();
            this.addCityForm.citymenuImg = this.imgArr[0];
            let par = Object.assign({},this.addCityForm)
            insertCity(par).then(result => {
              this.addCityLoading = false;
              //NProgress.done();
              this.$message({
                message: "添加成功",
                type: "success"
              });
              this.$refs["addCityForm"].resetFields();
              this.addCityFormVisible = false;
              this.imgArr = [];
               this.getCityAll();
            });
          });
        }
      });
    },
    changeImg: function(e) {
      var _this = this;
      var imgLimit = 1024;
      var files = e.target.files;
      var image = new Image();
      if (files.length > 0) {
        var dd = 0;
        var timer = setInterval(function() {
          if (
            files.item(dd).type != "image/png" &&
            files.item(dd).type != "image/jpeg" &&
            files.item(dd).type != "image/gif"
          ) {
            return false;
          }

          if (files.item(dd).size > imgLimit * 102400) {
            //to do sth
          } else {
            image.src = window.URL.createObjectURL(files.item(dd));
            image.onload = function() {
              // 默认按比例压缩
              var w = image.width,
                h = image.height,
                scale = w / h;
              w = 200;
              h = w / scale;
              // 默认图片质量为0.7，quality值越小，所绘制出的图像越模糊
              var quality = 0.7;
              //生成canvas
              var canvas = document.createElement("canvas");
              var ctx = canvas.getContext("2d");
              // 创建属性节点
              var anw = document.createAttribute("width");
              anw.nodeValue = w;
              var anh = document.createAttribute("height");
              anh.nodeValue = h;
              canvas.setAttributeNode(anw);
              canvas.setAttributeNode(anh);
              ctx.drawImage(image, 0, 0, w, h);
              var ext = image.src
                .substring(image.src.lastIndexOf(".") + 1)
                .toLowerCase(); //图片格式
              console.log(image.src);

              var base64 = canvas.toDataURL("image/" + ext, quality);
              // 回调函数返回base64的值
              if (_this.imgArr.length <= 4) {
                _this.imgArr.unshift("");
                _this.imgType.unshift("");
                let arr = base64.split(",");
                _this.imgArr.splice(0, 1, arr[1]); //替换数组数据的方法，此处不能使用：this.imgArr[index] = url;
                _this.imgType.splice(0, 1, files.item(dd).type.split("/")[1]);
                if (_this.imgArr.length >= 5) {
                  _this.allowAddImg = false;
                }
              }
            };
          }

          if (dd < files.length - 1) {
            dd++;
          } else {
            clearInterval(timer);
          }
        }, 1000);
      }
    },
    deleteImg: function(index) {
      this.imgArr.splice(index, 1);
      if (this.imgArr.length < 5) {
        this.allowAddImg = true;
      }
    }
  },
  mounted() {
    this.getCityAll();
  }
};
</script>

<style>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 90px;
  color: #99a9bf;
}
.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}
.el-table__expand-column .cell {
  padding: 0;
  text-align: center;
  display: none;
}
</style>
