function create(x) {
  const el = document.createElement("div");
  el.classList.add("row", "p-2");
  el.setAttribute("id", x["owner"]["login"] + "get_build");
  el.innerHTML = `<div class="col p-2">${x["owner"]["login"]}</div>
  <div class="col p-2">${x["stargazers_count"]}</div>`;
  return el;
}


function create_build(x,id) {
    // console.log(x)
    const el = document.createElement("div");
    el.classList.add("row", "pl-5","ml-5","justify-content-end");
    el.setAttribute("id",id+"/"+x["name"]+" get_commit");
    el.innerHTML = `<div class=" p-2">${x["name"]}</div>`;
    return el;
}
function create_build2(x,id){
    const el = document.createElement("div");
    el.classList.add("row", "pl-5","ml-5");
    el.setAttribute("id",id+"/"+x["name"]+" get_commit");
    el.innerHTML = `<div class="col p-2">${x["commit"]["message"]}</div>`;
    return el;
}



document.querySelector("#form").addEventListener("submit", async (event) => {
  event.preventDefault();
  const repo = document.getElementById("rep").value,
    own = document.getElementById("own").value;
  await fetch("https://api.github.com/repos/" + own + "/" + repo + "/forks")
    .then((res) => res.json())
    .then((res) => {
      table = document.getElementById("data");
      //   console.log(res);
      for (y in res) {
        // console.log(res[y]);
        // console.log(create(res[y]));
        table.appendChild(create(res[y]));
        document
          .getElementById(res[y]["owner"]["login"] + "get_build")
          .addEventListener("click", async (event) => {
            const name=event.currentTarget.id.substring(0,event.currentTarget.id.length-9);
            // console.log(name);
            event.preventDefault();
            await fetch(
              "https://api.github.com/repos/" + name + "/" + repo + "/branches")
              .then((i) => i.json())
              .then((i) => {
                for(z in i){
                    document.getElementById(name+ "get_build").appendChild(create_build(i[z],name));
                }
              });
              await fetch(
                "https://api.github.com/repos/" + name + "/" + repo + "/commits")
                .then((i) => i.json())
                .then((i) => {
                  for(z in i){
                    console.log(i[z])
                      document.getElementById(name+ "get_build").appendChild(create_build2(i[z],name));
                  }
                });
          });
      }
    });
});
