import Review from "./Review";
const data=[require("./images/beauty-4993469_1280-removebg-preview 1.png"),require("./images/ps4-product-thumbnail-01-en-14sep21.webp")]
const data2=[]
// console.log(Review())
const next=(v,set_v)=>{
    if(v+1>=data.length)set_v(0);
    else set_v(v+1);
}
const prev=(v,set_v)=>{
    if(v-1<0)set_v(data.length-1);
    else set_v(v-1);
}
export {data,data2,next,prev}