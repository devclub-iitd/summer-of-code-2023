const btnGet = document.getElementById("btnGet")
btnGet.addEventListener("click", getForks)

async function getForks() {
    const url = "https://api.github.com/repos/devclub-iitd/summer-of-code-2023/forks"
    const response = await fetch(url)
    const result = await response.json()

    console.log(result)

}