import { Octokit, App } from "https://esm.sh/octokit";
import { Auth } from './credential.js'


const btnGet = document.getElementById("btnGet")
const divResult = document.getElementById("resultsdiv")
btnGet.addEventListener("click", getForks)

async function getCommits(i, repo) {
    const commitUrl = "https://api.github.com/repos/"+i.full_name+"/commits"

    const commitResponse = await fetch(commitUrl, { headers: { "Authorization": Auth.token} })
    const commitResult = await commitResponse.json()

    console.log(commitResult)

    const head = document.createElement("h2")
    head.textContent = "Commits"
    repo.appendChild(head)

    commitResult.forEach(i=>{

        const commit = document.createElement("p")
        commit.textContent = i.author.login+" : "+i.commit.message+" : "+i.commit.committer.date;

        repo.appendChild(commit)
    })
}

async function getBranches(i, repo) {
    const branchUrl = "https://api.github.com/repos/"+i.full_name+"/branches"

    const branchResponse = await fetch(branchUrl, { headers: { "Authorization": Auth.token} })
    const branchResult = await branchResponse.json()

    console.log(branchResult)

    const head = document.createElement("h2")
    head.textContent = "Branches"
    repo.appendChild(head)

    branchResult.forEach(i=>{

        const branch = document.createElement("p")
        branch.textContent = i.name;

        repo.appendChild(branch)
    })
}

async function getForks() {
    clear();

    const load = document.createElement("div");
    load.classList.add("loader");
    divResult.appendChild(load);
    divResult.appendChild(document.createTextNode("Loading results..."));

    const table = document.createElement("table");

    const headRow = document.createElement("tr");

    const head1 = document.createElement("th");
    head1.textContent= "Fork";
    headRow.appendChild(head1);

    const head2 = document.createElement("th");
    head2.textContent= "Stargazers";
    headRow.appendChild(head2);

    const head3 = document.createElement("th");
    head3.textContent= "Last committed";
    headRow.appendChild(head3);

    table.appendChild(headRow);

    const octokit = new Octokit({ });

    const data = await octokit.paginate("https://api.github.com/repos/devclub-iitd/summer-of-code-2023/forks", {
        per_page: 100,
        headers: {
          "Authorization": Auth.token,
        },
      });

    console.log(data)

    data.forEach(i=>{

        const repo = document.createElement("details")
        const summ = document.createElement("summary")
        summ.textContent = i.full_name;

        repo.appendChild(summ)
        repo.appendChild(document.createElement("br"))

        const populate = getBranches(i, repo).then(getCommits(i, repo))

        const tr = document.createElement("tr")

        const td = document.createElement("td")
        td.appendChild(repo)

        const stars = document.createTextNode(i.stargazers_count)
        const td2 = document.createElement("td")
        td2.appendChild(stars)

        const lCommit = document.createTextNode(i.pushed_at)
        const td3 = document.createElement("td")
        td3.appendChild(lCommit)

        tr.appendChild(td)
        tr.appendChild(td2)
        tr.appendChild(td3)
        table.appendChild(tr)

    })

    clear();
    divResult.appendChild(table)

    function clear() {
        while(divResult.firstChild) 
            divResult.removeChild(divResult.firstChild)
    }

}