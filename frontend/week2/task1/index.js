const btnGet = document.getElementById("btnGet")
const divResult = document.getElementById("resultsdiv")
btnGet.addEventListener("click", getForks)

async function getCommits(i, repo) {
    const commitUrl = "https://api.github.com/repos/"+i.full_name+"/commits"

    const commitResponse = await fetch(commitUrl, { headers: { "Authorization": 'token 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'} })
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

    const branchResponse = await fetch(branchUrl, { headers: { "Authorization": 'token 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'} })
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

    const url = "https://api.github.com/repos/devclub-iitd/summer-of-code-2023/forks?per_page=100"
    const response = await fetch(url, { headers: { "Authorization": 'token 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'} })
    const result = await response.json()

    console.log(result)

    result.forEach(i=>{

        const repo = document.createElement("details")
        const summ = document.createElement("summary")
        summ.textContent = i.full_name;

        repo.appendChild(summ)
        repo.appendChild(document.createElement("br"))

        getBranches(i, repo)
        getCommits(i, repo)

        divResult.appendChild(repo)
        divResult.appendChild(document.createElement("br"))

        
    })

    function clear() {
        while(divResult.firstChild) 
            divResult.removeChild(divResult.firstChild)
    }

}