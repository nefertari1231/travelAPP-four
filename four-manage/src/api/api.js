import axios from 'axios';

let base = 'http://localhost:8090';

export const requestLogin = params => { return axios.post(`${base}/login`, params).then(res => res.data); };

export const getCityList =  params => { return axios.get(`${base}/api/servers/city`, params).then(res => res.data); };

export const getFoodsByCity = params => { return axios.get(`${base}/api/servers/foods?cityMenuId=`+params).then(res => res.data); };

export const delFoodsById = params => { return axios.delete(`${base}/api/servers/foods?foodsId=`+params).then(res => res.data); };

export const updateFoodsById = params => { return axios.put(`${base}/api/servers/foods`,params).then(res => res.data); };

export const insertFoods = params => { return axios.post(`${base}/api/servers/foods`,params).then(res => res.data); };

export const insertCity =  params => { return axios.post(`${base}/api/servers/city`,params).then(res => res.data); };