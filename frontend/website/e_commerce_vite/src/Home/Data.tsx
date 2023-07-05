import img1 from "./images/beauty-4993469_1280-removebg-preview 1.png"
import img2 from    "./images/ps4-product-thumbnail-01-en-14sep21.webp"
import Review from "./Review";
const data=[img1,img2]
const data2: JSX.Element[]=[<Review brand="Lux" date="5th June" person="Amy" product="soap" />,
<Review brand="Dove" date="10th July" person="John" product="PS5" />]
const next=(v:number,set_v:Function,dat:Array<any>)=>{
    if(v+1>=dat.length)set_v(0);
    else set_v(v+1);
}
const prev=(v:number,set_v:Function,dat:Array<any>)=>{
    if(v-1<0)set_v(dat.length-1);
    else set_v(v-1);
}
export {data,data2,next,prev}