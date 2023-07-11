async function testing(setstate){
    await fetch('https://marketplace-1-b3203472.deta.app/').then(x=>x.json()).then(x=>{console.log(x);setstate(x)})
}
async function put(formData){
    fetch('https://marketplace-1-b3203472.deta.app/product', {
  method: 'POST',
  headers: {
    'accept': 'application/json',
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin':'*'
  },
  body: JSON.stringify({
   formData
  })
})
  .then(response => response.json())
  .then(data => {
    // Handle the response data
    console.log(data);
  })
  .catch(error => {
    // Handle any errors
    console.error('Error:', error);
  });
}
async function get(setstate){
  fetch('https://marketplace-1-b3203472.deta.app/search?skip=0&limit=100').then(x=>x.json).then(x=>{setstate(x)}).catch((reason)=>{console.log("HI");setstate(["Error Loading the Page"])})
}
module.exports={put,testing,get}