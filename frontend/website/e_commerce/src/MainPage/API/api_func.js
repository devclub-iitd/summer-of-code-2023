async function testing(){
    var y=0;
    await fetch('https://marketplace-1-b3203472.deta.app/').then(x=>x.json()).then(x=>{y=x})
    return y
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
module.exports={put}