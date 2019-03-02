package com.example.four.VO;

import com.example.four.exception.IllegalException;
import com.example.four.utils.ImgUtil;

import java.io.IOException;
import java.util.Arrays;

public class CommentVO {

    private String content;

    private String orderId;

    private String[] imgArr;

    private String[] imgType;

    private Integer value;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String[] getImgArr() {
        return imgArr;
    }

    public void setImgArr(String[] imgArr) {
        this.imgArr = imgArr;
    }

    public String[] getImgType() {
        return imgType;
    }

    public void setImgType(String[] imgType) {
        this.imgType = imgType;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "CommentVO{" +
                "orderId='" + orderId + '\'' +
                ", imgArr=" + Arrays.toString(imgArr) +
                ", imgType=" + Arrays.toString(imgType) +
                ", value=" + value +
                '}';
    }

    public String uploadImg() throws IOException, IllegalException {
        String[] strings = ImgUtil.MultiBase64StringsToLocalImg(getImgArr(), getImgType());
        StringBuffer stringBuffer = new StringBuffer();
        for (String string : strings) {
            stringBuffer.append(string+",");
        }
        return stringBuffer.substring(0,stringBuffer.length()-1);
    }
}
