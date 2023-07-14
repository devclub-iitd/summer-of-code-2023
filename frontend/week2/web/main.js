const API_BASE_URL = 'https://api.github.com';
const OWNER = 'devclub-iitd';
const REPO = 'summer-of-code-2023';
const TOKEN = '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';

const div = document.getElementById("container")
// const url = `${API_BASE_URL}/repos/${OWNER}/${REPO}/forks`
async function getForks(url=`${API_BASE_URL}/repos/${OWNER}/${REPO}/forks`){
    loading();
    const headers = {

    }
    let response = await fetch(url,
    {
        method: "GET",
    }
    )
    let result = await response.json()
    console.log(result)
    let links = (response.headers.get('link'))
    let urls = links.split(",").map(e => {
        return {
            url: e.match(/<(.*)>/)[1],
            title: e.split(";")[1].trim().match(/"(.*)"/)[1]
        }
    })
    
    clear();
    div.innerHTML += '<ul class="list-group">'
    result.forEach(i=>{
        let tag;
        tag = `<p class="list-group-item">
        <button class="btn btn-secondary" onclick="getUserData('${i.full_name}')" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-${i.id}" aria-expanded="false" aria-controls="collapse-${i.id}">
    ${i.full_name}
  </button>
        <div class="collapse" id="collapse-${i.id}">
        <div class="card card-body" id="card-${i.id}">
         
        </div>
      </div></p>`
        div.innerHTML += tag
    })
    div.innerHTML += "</ul>"
    urls.forEach(e => {
        let elem = `<button class="btn btn-primary m-1" onclick="getForks('${e.url}')">${e.title}</button>`
        div.innerHTML += elem
    })
}

async function getUserData(repo_name){
    let url = `${API_BASE_URL}/repos/${repo_name}/commits`
    const request = await fetch(url);
    let result = await request.json()
    console.log(result);
}

function clear(){
    div.innerHTML = ""
}
function loading(){
    div.classList.replace("d-none", "d-block")
    div.innerHTML = "<p>loading...</p>"
}