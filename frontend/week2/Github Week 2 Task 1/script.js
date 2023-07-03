var namearr=new Array();
var branch_api={};
var commit_api="";
var commit_type="";

let perpage=parseInt(document.getElementById("per_page").value);
let ch=document.getElementById("change");
let stars=document.getElementById("star_count");

stars.addEventListener('click',()=>{
    ch.innerHTML="Star_Count";

})
let none=document.getElementById("none");
none.addEventListener('click',()=>{
    ch.innerHTML="NONE";
})
let sub=document.getElementById("fetch");
sub.addEventListener('click',()=>{
    let temp=document.getElementById("result2")
    temp.innerHTML='';
    final();
})
function final(){
    // document.body.appendChild(first);
    let perpage=parseInt(document.getElementById("per_page").value);
    let ch=document.getElementById("change");
    let stars=document.getElementById("star_count");
    
    stars.addEventListener('click',()=>{
        ch.innerHTML="Star_Count";

    })
    let none=document.getElementById("none");
    none.addEventListener('click',()=>{
        ch.innerHTML="NONE";
    })
    let url="";
    let sort=ch.innerHTML.trim();
    console.log(sort);
    if (sort==="Sort By" || sort==="NONE"){
        url=`https://api.github.com/repos/devclub-iitd/summer-of-code-2023/forks?per_page=${perpage}`
        fetch_data();
    }
    else{
        url=`https://api.github.com/repos/devclub-iitd/summer-of-code-2023/forks?per_page=${perpage}&sort=stargazers`;
        fetch_data();
    }
    async function fetch_data(){
        await fetch(url,{
            headers: {
                'Authorization': 'token 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',
            }
        })
        .then((response)=>{
            return response.json();
        })
        .then((result)=>{
            let result2=document.querySelector("#result2");
            for (let i=0;i<perpage;i++){
                
                let div = document.createElement("div");
                div.className = "display";
                div.id = "duplicate";
                let photolink=result[i].owner.avatar_url;
                let name=result[i].owner.login;
                namearr.push(name);
                let star=result[i].stargazers_count;
                let language_used=result[i].language;
                let created=result[i].created_at.slice(0,10);
                let update=result[i].updated_at.slice(0,10);
                div.innerHTML = `
                <div class="image">
                    <img id="photo" src=${photolink} alt="Student's Photos">
                    <h1 id="name">${name}</h1>
                    </div>
                    <div class="about">
                    <h1>Profile....</h1>
                    <p><strong>Stars:</strong>&nbsp;&nbsp; ${star}</p>
                    <p><strong>Updated_At</strong>&nbsp;&nbsp;${update}</a></p>
                    <p><strong>Created At:</strong>&nbsp;&nbsp; ${created}</p>
                    <p><strong>Language:</strong>&nbsp;&nbsp; ${language_used}</p>
                </div>`;
                result2.appendChild(div);
            }
        })
        .catch((error)=>{
            console.log(error);
        })
    }
};
    