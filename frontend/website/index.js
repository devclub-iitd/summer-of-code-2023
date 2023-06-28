var value=0;
image=["./images/beauty-4993469_1280-removebg-preview 1.png","./images/ps4-product-thumbnail-01-en-14sep21.webp"]
function next(){
    value++;
    if(value>image.length-1)value=0;
    document.querySelector("#pg1img1").firstElementChild.src=image[value];
}
function prev(){
    value--;
    if(value<0)value=image.length-1;
    document.querySelector("#pg1img").firstElementChild.src=image[value];
}
document.querySelector("#box1").addEventListener("click",next)
document.querySelector("#box2").addEventListener("click",prev)