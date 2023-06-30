function create(x) {
  const el = document.createElement("div");
  el.classList.add("row", "p-2");
  el.setAttribute("id", x["owner"]["login"] + "get_build");
  el.innerHTML = `<div class="col p-2">${x["owner"]["login"]}</div>
  <div class="col p-2">${x["stargazers_count"]}</div>
  <div class="col p-2">${x["has_issues"]}</div>
  <div class="col p-2">${x["size"]}</div>`;
  return el;
}

function create_build(x, id) {
  // console.log(x)
  const el = document.createElement("div");
  el.classList.add("row", "pl-5", "ml-5", "justify-content-end");
  el.setAttribute("id", id + "/" + x["name"] + " get_commit");
  el.innerHTML = `<div class="col p-2"></div><div class="col p-2">${x["name"]}</div>`;
  return el;
}
function create_build2(x, id) {
  const el = document.createElement("div");
  el.classList.add("row", "pl-5", "ml-5");
  el.setAttribute("id", id + "/" + x["name"] + " get_commit");
  el.innerHTML = `<div class="col p-2"></div>
    <div class="col p-2">${x["commit"]["message"]}</div>
    <div class="col p-2">${x["commit"]["author"]["name"]}</div>`;
  return el;
}

document.querySelector("#form").addEventListener("submit", async (event) => {
  event.preventDefault();
  const repo = document.getElementById("rep").value,
    own = document.getElementById("own").value;
  var ls = [],
    counter = 2;
  await fetch(
    "https://api.github.com/repos/" +
      own +
      "/" +
      repo +
      "/forks?page=1&sort=stargazers&per_page=99"
  )
    .then((res) => res.json())
    .then((res) => {
      ls = res;
    });
  while (ls.length != 0 && counter <= 10) {
    table = document.getElementById("data");
    for (y in ls) {
      table.appendChild(create(ls[y]));
      document
        .getElementById(ls[y]["owner"]["login"] + "get_build")
        .addEventListener("click", async (event) => {
          const name = event.currentTarget.id.substring(
            0,
            event.currentTarget.id.length - 9
          );
          event.preventDefault();
          await fetch(
            "https://api.github.com/repos/" + name + "/" + repo + "/branches"
          )
            .then((i) => i.json())
            .then((i) => {
              const el = document.createElement("div");
              el.classList.add("row", "pl-5", "ml-5", "justify-content-end");
              el.innerHTML = `<div class="col p-2">Branch</div><div class="col p-2">Name</div>`;
              document.getElementById(name + "get_build").appendChild(el);
              for (z in i) {
                document
                  .getElementById(name + "get_build")
                  .appendChild(create_build(i[z], name));
              }
            });
          await fetch(
            "https://api.github.com/repos/" + name + "/" + repo + "/commits?per_page=99"
          )
            .then((i) => i.json())
            .then((i) => {
              const el = document.createElement("div");
              el.classList.add("row", "pl-5", "ml-5");
              // el.setAttribute("id", id + "/" + x["name"] + " get_commit");
              el.innerHTML = `<div class="col p-2">Commit</div>
    <div class="col p-2">Message</div>
    <div class="col p-2">Author</div>`;
              document.getElementById(name + "get_build").appendChild(el);
              for (z in i) {
                document
                  .getElementById(name + "get_build")
                  .appendChild(create_build2(i[z], name));
              }
            });
        });
    }
    await fetch(
      "https://api.github.com/repos/" +
        own +
        "/" +
        repo +
        "/forks?page=" +
        counter +
        "&sort=stargazers&per_page=99"
    )
      .then((res) => res.json())
      .then((res) => {
        ls = res;
      });
    counter += 1;
    console.log(ls);
  }
});
